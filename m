Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC56C4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 22:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B662E60BF0;
	Mon,  7 Nov 2022 22:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B662E60BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MYuKTvoQYhYy; Mon,  7 Nov 2022 22:10:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2A1C60BE7;
	Mon,  7 Nov 2022 22:10:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2A1C60BE7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC6411BF25F
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B30160B30
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:10:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B30160B30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 912x-DVRfEsu for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 22:10:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C866607BC
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C866607BC
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 22:10:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 849FD240009;
 Mon,  7 Nov 2022 22:10:12 +0000 (UTC)
Date: Mon, 7 Nov 2022 23:10:11 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221107231011.1f4faebd@windsurf>
In-Reply-To: <20221107172530.6748-1-fontaine.fabrice@gmail.com>
References: <20221107172530.6748-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667859013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x5enZIUppfyu4tBwS8Bm0quqDRU9guON18LhDdgSzhs=;
 b=lCqJnvzrfnO1oW0KFu2vHgNYl40EGTGEkp9QeiaGTY95F36IWGfHD+JCfGiX3FtrtIxDH8
 mSRvOGqAa3pOk2IgFIkdfToa3cEjDYspTCejCBzvaPEFYMSQYDpb7F9LdMt8WO6Sak8ds2
 fAycgE2Xl+ZXuhQV6p2JLe2jrn8DxpizLYcPatqAglsO98zwmggO2QtsON6XMEpzfH3Los
 arHsBKf23vinbfRXKDv95wcTMppD5x/tOdU2jWQbKTkeyWzVUUauQvPenT7EQtV6oskN9C
 4c7qsZkfot1EqMe9WRHwqj835vwBNgckLl1wHGzC+19L81F35kGOttTKJ/8Psw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lCqJnvzr
Subject: Re: [Buildroot] [PATCH 1/1] package/ipmitool: fix per-package build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  7 Nov 2022 18:25:30 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following per-package build failure raised since commit
> 82480ee22bdfae6f7d399975722b5c125749d8c7:
> 
> configure.ac:44: error: possibly undefined macro: AC_SEARCH_LIBS
>       If this token and others are legitimate, please use m4_pattern_allow.
>       See the Autoconf documentation.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ecf72cd1ebd53f3b3b10f0a24082f9c0ab5d4d12
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ipmitool/ipmitool.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
