Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDF5CA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 15:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA06683B7A;
	Fri, 29 Aug 2025 15:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RsHSoR9EkkWv; Fri, 29 Aug 2025 15:39:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08C0A836C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08C0A836C3;
	Fri, 29 Aug 2025 15:39:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 48F62D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F89F40735
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytsnRB6Rd1sq for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 15:39:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 43E8E4003D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43E8E4003D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43E8E4003D
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:39:53 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -241306139; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 15:39:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1us1Cg-00CicE-1s;
 Fri, 29 Aug 2025 17:39:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Fabrice Fontaine
 <fontaine.fabrice@gmail.com>
References: <20250828174155.249940-1-thomas.petazzoni@bootlin.com>
Date: Fri, 29 Aug 2025 17:39:50 +0200
In-Reply-To: <20250828174155.249940-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Thu, 28 Aug 2025 19:41:50
 +0200")
Message-ID: <874itqi1bt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Sr+aW6Efs29YbFLWw+DS+gz2eZqIeDpc8wfa7fXu6v5b7kIZH8eEMGJND6hb+1xumXMONKxNHzhwF3Nf1Tj6pVnrqoINXO+V22zBoiRyRvAGUsfbPICp6l3hAfTvUZ1BpTdsTppEMCQJm20hToaIqIt2jvxRHwqVANh2c591sI175Ypo6oYQaPTNNYE/EA0JnIw9w1mfiDHEjk49WTL+vhpxqdMOkty+AuqnmnetA+slnkp4lFHCiCfyfri+CO+opaeYkSYif2mcRws7QUi7ZNVnyP7cw2U1bkVtgb7RANvRs4i6yJDmKtb5kVBm3yM9pQDiXGTbV/RLWmdnJff4nQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=ycQ4HSY8zMnn99IuqqYHBFLK31yRfT9zK9ZG7yfX1Sc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Sr+aW6Ef
Subject: Re: [Buildroot] [PATCH 1/3] package/libsoxr: drop ffmpeg support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Having support for ffmpeg in libsoxr causes several circular
 > dependencies:

 > - pulseaudio -> libsoxr -> ffmpeg -> pulseaudio

 >   (This one was worked around in
 >   fecc337d21f337a30ef7f9f448683d99c01fc245 by dropping the ffmpeg ->
 >   pulseaudio dependency, but it's annoying as being able to output
 >   audio from ffmpeg into pulseaudio seems useful)

 > - libopenmpt -> pulseaudio -> libsoxr -> ffmpeg -> libopenmpt

 >   (This is one exists, and is fixed by this commit)

 > To fix both circular dependencies, we propose to drop the dependency
 > of libsoxr on ffmpeg, which is used to get some optimized FFT
 > implementation. While not being useless, this is the point where
 > breaking the dependency seems the most logical.

 > Neither Debian nor Fedora build libsoxr with ffmpeg support.

 > In order to achieve that, we add a new patch making the option
 > WITH_AVFFT actually effective. Since we no longer build against
 > ffmpeg, the previously added patch that was fixing the pkg-config file
 > is no longer needed.

 > Fixes:

 >   https://autobuild.buildroot.net/results/bbfce69f35cafd56245ebeae79086a8b64592a16/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
