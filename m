Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1824FC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 18:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CECC8405AB;
	Sat,  8 Jun 2024 18:19:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uhZlfkDO3ceZ; Sat,  8 Jun 2024 18:19:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D4E3406BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D4E3406BC;
	Sat,  8 Jun 2024 18:19:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FD731BF408
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 18:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1679D40677
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 18:18:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mMU2kVKlJ4-b for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 18:18:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4AE28405EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AE28405EF
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AE28405EF
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 18:18:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89D9020003;
 Sat,  8 Jun 2024 18:18:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sG0eJ-002HgR-39;
 Sat, 08 Jun 2024 20:18:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20240601223120.2123976-1-romain.naour@smile.fr>
 <20240601223120.2123976-2-romain.naour@smile.fr>
 <87bk4ijpey.fsf@dell.be.48ers.dk>
Date: Sat, 08 Jun 2024 20:18:43 +0200
In-Reply-To: <87bk4ijpey.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Mon, 03 Jun 2024 12:23:17 +0200")
Message-ID: <878qzfwb5o.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/systemd: add optional tpm2
 dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:
 >> When tpm2-tss package is selected, systemd can enable its TPM2 support
 >> [1] used by systemd-boot, systemd-cryptenroll (when cryptsetup package
 >> is also enabled) [2] and other tool systemd-pcr{extend,lock,machine}.

 >> [1] https://github.com/systemd/systemd/blob/db11bab38ccf1ed257f310d29070843d4c58ea01/meson.build#L1341
 >> [2] https://www.freedesktop.org/software/systemd/man/latest/systemd-cryptenroll.html

 >> Signed-off-by: Romain Naour <romain.naour@smile.fr>

 > Committed, thanks.

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
