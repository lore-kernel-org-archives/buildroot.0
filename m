Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E5ECA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 15:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29E8D83E82;
	Fri, 29 Aug 2025 15:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0JJM556FNgB2; Fri, 29 Aug 2025 15:40:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4442683DD9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4442683DD9;
	Fri, 29 Aug 2025 15:40:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CD7A6C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F0EF41738
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tyJuFc60L1uX for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 15:40:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8C29C41730
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C29C41730
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C29C41730
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:40:00 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1718205843; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 15:39:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1us1Cn-00Cicm-0l;
 Fri, 29 Aug 2025 17:39:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Bernd Kuhls
 <bernd@kuhls.net>,  Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
References: <20250828174155.249940-1-thomas.petazzoni@bootlin.com>
 <20250828174155.249940-2-thomas.petazzoni@bootlin.com>
Date: Fri, 29 Aug 2025 17:39:57 +0200
In-Reply-To: <20250828174155.249940-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Thu, 28 Aug 2025 19:41:51
 +0200")
Message-ID: <87zfbigmr6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=M9uYESUU2iwwrY9RmmzGpKEeGFeUXrw6Nn1X8BzC+21oLoBsg3mPf5XgUN7Ar906uYhUiTWbnsWzpN4ADwH04+DX3QB52sdMlH+aIUD8wJ5nu72ZdUabeD3k3i0nuKorqv7YTeQyiM/LFmBbzoSWBSxf+6MyFWERyYI0CRn1uolOdsM0Ibvta2UHgn4WEDNoDJPoTn7fQhNV49SSAAipGb/+tbFXvFfdhSOgVMYjoaC2TgSYc8q6y3rwd9A0zeT5PiIsa0lykciYf3m3zQV0zdsKGdsbadtwQSnEcGg9AiF0H+3VD9hy0JbL9rQtbeDR/oq6AP8A2Vn26aynp8n2cw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=mL8s+EkqzGdzwcF32HvB961KcVTiyvpMAlYuBgv5Bac=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=M9uYESUU
Subject: Re: [Buildroot] [PATCH 2/3] Reapply "package/ffmpeg: add support
 for pulseaudio"
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

 > This reverts commit fecc337d21f337a30ef7f9f448683d99c01fc245,
 > re-adding optional support for pulseuadio in ffmpeg.

 > This is possible now that the circular dependency:

 >   pulseaudio -> libsoxr -> ffmpeg -> pulseaudio

 > has been broken between libsoxr and ffmpeg.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
