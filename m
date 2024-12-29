Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E690E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 20:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BA76605A5;
	Sun, 29 Dec 2024 20:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y1VxTOfcyhC1; Sun, 29 Dec 2024 20:09:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71CDF60783
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71CDF60783;
	Sun, 29 Dec 2024 20:09:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B9DA8C8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A76C080592
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZnZbCIPPeyd for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 20:09:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B568C80EC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B568C80EC8
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B568C80EC8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:09:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1258E60002;
 Sun, 29 Dec 2024 20:09:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tRzav-00EdOc-18;
 Sun, 29 Dec 2024 21:09:01 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: buildroot@buildroot.org,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  =?utf-8?Q?Miqu=C3=A8l?= Raynal
 <miquel.raynal@bootlin.com>
References: <20241216-fix_quickjs_prefix-v1-1-88ed52e67b76@bootlin.com>
Date: Sun, 29 Dec 2024 21:09:01 +0100
In-Reply-To: <20241216-fix_quickjs_prefix-v1-1-88ed52e67b76@bootlin.com>
 (Thomas Bonnefille's message of "Mon, 16 Dec 2024 22:30:52 +0100")
Message-ID: <878qryi74y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/quickjs: fix typo in prefix
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

>>>>> "Thomas" == Thomas Bonnefille <thomas.bonnefille@bootlin.com> writes:

 > The quickjs Makefile expects the variable PREFIX to be set [1] but
 > prefix is set instead.
 > Without this parameter quickjs is installed to /usr/local by default [2]
 > instead of /usr as requested.
 > This commit fixed this error.

 > [1]: https://github.com/bellard/quickjs/blob/master/Makefile#L383
 > [2]: https://github.com/bellard/quickjs/blob/master/Makefile#L43

 > Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Committed to 2024.11.x (this was broken by commit 814f9f17d5c3, so
2024.02.x is not affected), thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
