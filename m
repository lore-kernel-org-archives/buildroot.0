Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BD9C10F16
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 10:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B27BA605C1;
	Mon,  6 May 2024 10:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id udm19VKYbfy3; Mon,  6 May 2024 10:51:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65D5060840
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65D5060840;
	Mon,  6 May 2024 10:51:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E2F71BF33E
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 10:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1946682261
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 10:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aJJPB6M8HIRX for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 10:51:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F3F468225D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3F468225D
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3F468225D
 for <buildroot@buildroot.org>; Mon,  6 May 2024 10:51:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C76A4000C;
 Mon,  6 May 2024 10:51:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s3vwA-001DSt-05;
 Mon, 06 May 2024 12:51:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20240410214454.86748-1-romain.naour@smile.fr>
 <20240410214454.86748-2-romain.naour@smile.fr>
Date: Mon, 06 May 2024 12:51:14 +0200
In-Reply-To: <20240410214454.86748-2-romain.naour@smile.fr> (Romain Naour's
 message of "Wed, 10 Apr 2024 23:44:53 +0200")
Message-ID: <877cg72oyl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/3] boot/{uboot,
 ti-k3-r5-loader}: remove uneeded python-jsonschema dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > Commits 8a4c3c91e7 ("boot/ti-k3-r5-loader: add BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option")
 > and 1aec483412 ("boot/uboot: add BR2_TARGET_UBOOT_USE_BINMAN option")
 > added the python-jsonschema (target variant) dependency to the binman
 > option while only host-python-jsonschema is required.

 > http://lists.busybox.net/pipermail/buildroot/2024-April/689291.html

 > Reported-by: James Hilliard <james.hilliard1@gmail.com>
 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
