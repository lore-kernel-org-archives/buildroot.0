Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA895C87FD3
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 14:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B64DA840B0;
	Wed,  6 Aug 2025 14:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sK999h4mLd7O; Wed,  6 Aug 2025 14:55:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFC9F83D60
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFC9F83D60;
	Wed,  6 Aug 2025 14:55:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A4F1233
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 14:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C2554020F
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 14:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrvJB3x9TFlB for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 14:55:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8A9C04012B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A9C04012B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A9C04012B
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 14:55:04 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2039464003; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 06 Aug 2025 14:55:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ujfXh-00GsZH-2D;
 Wed, 06 Aug 2025 16:55:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Cc: Fabien Lehoussel <fabien.lehoussel@smile.fr>,  Thomas Perale
 <thomas.perale@mind.be>
References: <20250716093401.1213358-1-fabien.lehoussel@smile.fr>
 <20250716093401.1213358-4-fabien.lehoussel@smile.fr>
Date: Wed, 06 Aug 2025 16:55:01 +0200
In-Reply-To: <20250716093401.1213358-4-fabien.lehoussel@smile.fr> (Fabien
 Lehoussel via buildroot's message of "Wed, 16 Jul 2025 11:33:47
 +0200")
Message-ID: <87cy98ijp6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Jt/QH6ptHmPC7TW9P3UR2JGbb/MFwHZCTta/rClJXUqtZqZZzzGMdtAzLK5d86hDEbH5fVbhXBwxuhcgpWaZQ9UYHRPY76RHHe8nK9QAd14yWAF0L7Ns2KL4fdvkcL7yT+MUX0Td1kVMHSMaq5fARU2ICxWya1W0iKhTq9lLIXg028msdL7ndktSI/oQIUIma3y3p9/YuYgmGfLSFrhkGqvNd1KR4wl425hVwqOgvZFW4KNuFFgtskmynPl9+I/hb3AWFIA4EBXp0qB+AyFw1GrZQ+6x8/RNOCxKvz+Ccnid9l0QWB8HjRj8KnqHstWKEMGZhfLdf6Xh0IOYeHBTMg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=PVbW/q2Su+2PUJ/DKxISupBdpZ4q8dg+ZaSS4ql7SuM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Jt/QH6pt
Subject: Re: [Buildroot] [PATCH v2 4/5] utils/generate-cyclonedx: add
 project name and version options
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

>>>>> "Fabien" == Fabien Lehoussel via buildroot <buildroot@buildroot.org> writes:

 > Options used to customize the project name and version in the generated SBOM metadata.
 > Sets buildroot generate-cyclonedx as a tool in the metadata section

 > Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
