Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72996D3B98E
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 13:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25F974C51B;
	Tue, 26 Nov 2024 13:22:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pL5v9-PrDiyl; Tue, 26 Nov 2024 13:22:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 032D84C567
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 032D84C567;
	Tue, 26 Nov 2024 13:22:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 477574961
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 290AB40589
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H-JS7VlwtC-Z for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 13:22:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D0880400D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0880400D9
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D0880400D9
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:22:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABD3B6000B;
 Tue, 26 Nov 2024 13:22:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tFvWe-008nm9-0x;
 Tue, 26 Nov 2024 14:22:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20241113211522.31841-1-ju.o@free.fr>
Date: Tue, 26 Nov 2024 14:22:44 +0100
In-Reply-To: <20241113211522.31841-1-ju.o@free.fr> (Julien Olivain's message
 of "Wed, 13 Nov 2024 22:15:22 +0100")
Message-ID: <87wmgqm8nv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/tiff: security bump to version
 4.7.0
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

 > For the release note, see:
 > http://www.simplesystems.org/libtiff/releases/v4.7.0.html

 > This commit also adds the _SOURCE variable, to switch to the xz
 > archive, which saves ~1.5MB. The _SITE url is also updated to switch
 > to the https protocol.

 > This commit also adds a comment in the hash file about pgp signature
 > veritication.

 > Fixes:
 > - https://nvd.nist.gov/vuln/detail/CVE-2023-6277
 > - https://nvd.nist.gov/vuln/detail/CVE-2023-52356
 > - https://nvd.nist.gov/vuln/detail/CVE-2024-7006

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Patch tested in:

 > Minimal config, only BR2_PACKAGE_TIFF=y:
 > https://gitlab.com/jolivain/buildroot/-/pipelines/1541199649

 > Maximal config, all BR2_PACKAGE_TIFF.*=y:
 > https://gitlab.com/jolivain/buildroot/-/pipelines/1541210686

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
