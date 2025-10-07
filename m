Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE34ECCA470
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 11:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FEB16178D;
	Tue,  7 Oct 2025 11:46:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3OviO2zWrPxz; Tue,  7 Oct 2025 11:46:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7891661515
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7891661515;
	Tue,  7 Oct 2025 11:46:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4B1F119
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 11:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92B678422B
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 11:46:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BzgKOVTUo3xP for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 11:46:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 168DF840B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 168DF840B7
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 168DF840B7
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 11:46:50 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1363039109; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 07 Oct 2025 11:46:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v669W-002j0w-0F;
 Tue, 07 Oct 2025 13:46:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20251005113846.3940440-1-peter@korsgaard.com>
 <a0837005bddaaece56d78bce2c55d6d7@free.fr>
Date: Tue, 07 Oct 2025 13:46:45 +0200
In-Reply-To: <a0837005bddaaece56d78bce2c55d6d7@free.fr> (Julien Olivain's
 message of "Sun, 05 Oct 2025 23:16:31 +0200")
Message-ID: <87ldln0w9m.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=tQq5Ps0vR/Y1iBYhgkx07q66q3R8VDdY3iB1jyIKtDa0PTrM1ci1lkYPQ7UR13uU/y+DGr+oX/gN4QoXz+w1lEaRl/RuLPRXILHGBBi22xB/gqyUh/58K4kIjcFY6ViQhDhRcPEFOgeXRHpjU2kVN66KojscfYzo3ann+ocvYb1sNqyMsjNHx+aJMQu1c6in0VslPrTbeZNc2e2Vk6OL7xbs1zsA/8dZwxxJH/XHrwvEs23vloHA6nHmC6rmF3zOI481cAsPRzz0UKG3UfHW+Rk0hRBPDtdo7LTr7Rq0CqpcaHQClOW9DYnpPMS5t3NbgrR9ivRpnOnA1ZpAhnrN0A==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=3D1x6p3UYLZTGvvWfUsgnPEdSBTlltxwXWSNxGpUuww=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=tQq5Ps0v
Subject: Re: [Buildroot] [PATCH 1/2] configs/beagleboneai: move to u-boot
 2025.04 to unbreak build with gcc 14
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > Series applied to master, thanks.

 > For info, I fixed a check-package error by removing the stale
 > entry in .checkpackageingore file. See:
 > https://gitlab.com/buildroot.org/buildroot/-/commit/7ec419fb9c07292dc28b87ccb0ed35b00437dd16

Ups, thanks.

 > Also, if you still have your board available for testing, I suggest
 > the following maintenance followup patches:

 > Could you fix the shellcheck warnings in:
 > board/beagleboard/beagleboneai/post-build.sh
 > and remove the .checkpackageignore entry

 > Could you also switch this beagleboneai_defconfig to use a bootlin
 > external glibc stable toolchain please?

Sure, I'll do a quick test and send a series.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
