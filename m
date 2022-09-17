Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC94CECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 19:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73E8D60AD1;
	Sat, 17 Sep 2022 19:50:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73E8D60AD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Jw7igJJSyc0; Sat, 17 Sep 2022 19:50:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA08C60ABD;
	Sat, 17 Sep 2022 19:50:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA08C60ABD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 257DD1BF267
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 19:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F37F041DC2
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 19:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F37F041DC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kwVQ2hglaYYe for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 19:50:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C1C641DBD
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C1C641DBD
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 19:50:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7105220003;
 Sat, 17 Sep 2022 19:50:37 +0000 (UTC)
Date: Sat, 17 Sep 2022 21:50:36 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220917215036.0c78a181@windsurf>
In-Reply-To: <20220917171545.130430-1-fontaine.fabrice@gmail.com>
References: <20220917171545.130430-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663444237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q8ZEJNARsoOh2QI+b8KEXAyy5wQXblHH53PL9rsZq34=;
 b=en8moer3V8+0kGyypCvnbkYXF/ucYAfOjrHZlF7yxSoo/jbY+aiGEcayDZREVDbHl3YC2Q
 OJ9tC8wZUMnJYWX38tp173caEIlKgBe+E61wKV24Kl1LehVuQH7ff0Hvi8SOcYDO/RUm42
 qJGFkL46nUr/BuDSnE+pqf+NbF9vXDMQAnmj841nmn1k6UQ7xo3e5+EuEhPz5YMIRpYoUJ
 7NvDme7MEPIZ/izXqeZCH7FgN9iiket0bWZf+PW74DUSa98qdmkemeFg8uAO6wdJylPcq+
 QrcamjQ26ETsja5AEEsOzCiddcISnEsiPnpbucjaFx4EsTXelVrmG6+DWzmWeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=en8moer3
Subject: Re: [Buildroot] [PATCH 1/1] package/pkcs11-helper: bump to version
 1.29.0
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

On Sat, 17 Sep 2022 19:15:45 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop first pacth (already in version)
> 
> https://github.com/OpenSC/pkcs11-helper/releases/tag/pkcs11-helper-1.29.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...h-core.c-fix-build-without-slotevent.patch | 37 -------------------
>  ...-0-does-not-have-DSA_meth_set1_name.patch} |  0
>  package/pkcs11-helper/pkcs11-helper.hash      |  2 +-
>  package/pkcs11-helper/pkcs11-helper.mk        |  4 +-
>  4 files changed, 3 insertions(+), 40 deletions(-)
>  delete mode 100644 package/pkcs11-helper/0001-lib-pkcs11h-core.c-fix-build-without-slotevent.patch
>  rename package/pkcs11-helper/{0002-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch => 0001-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch} (100%)

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
