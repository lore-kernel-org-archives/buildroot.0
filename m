Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E87EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 14:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C37960E5C;
	Sat, 24 Jun 2023 14:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C37960E5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g9STTaKDbrnx; Sat, 24 Jun 2023 14:05:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0840661159;
	Sat, 24 Jun 2023 14:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0840661159
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 649271BF3E0
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 14:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E7A64011C
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 14:05:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E7A64011C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2rBcyJdSGQrV for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 14:05:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9D104011B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9D104011B
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 14:05:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d5f8:72e0:30f9:5d41])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1FF2BB0056B;
 Sat, 24 Jun 2023 16:04:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 24 Jun 2023 16:04:58 +0200
Date: Sat, 24 Jun 2023 16:04:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230624140458.GQ24952@scaer>
References: <20230624075207.403264-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230624075207.403264-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687615501;
 bh=eyiuAKArFSAzPY/R1L9lBSsApkH7FCYIJBeqixv9M9U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uGUMNmbsvbH1J08JyiD9kho31l/zVE6wsloIP8KR31ZOmuKvvVb6rXTuCnveooDeg
 TMGXS4iVE3s5QYZJkhFN8puLspUHvWXZTYbTUjOnubjaqq0t+i/f71Ic9AwgKO8o1j
 8VMM1bhpAuhRwUfxMS5xC9au1h6sZ2UGYHIGbgkFMYuoq7Q3m75KgLp4AXzOy+9Yla
 wpBJmOQQrCG6Sp6H/cIu/4fjlJJouPzgeM3h8DYrgH20Xcok59xqXTFg12uRvFWT5j
 +j+c5Gc7C29YwO1bWZ1mbJj7JX9v9rdvIxuFs9OuzyB0Oh4CNIF9sKQIK8wpa5HPQp
 1eh3WZP6NYwkA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uGUMNmbs
Subject: Re: [Buildroot] [PATCH 1/1] package/dahdi-linux: fix build with
 kernel >= 6.3
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

Bernd, All,

On 2023-06-24 09:52 +0200, Bernd Kuhls spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/2bb/2bb8a38b12cb3a7650162f1f7f65b56b20711d64/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...rivers-dahdi-fix-build-with-clang-16.patch | 106 ++++++++++++++++++
>  1 file changed, 106 insertions(+)
>  create mode 100644 package/dahdi-linux/0005-drivers-dahdi-fix-build-with-clang-16.patch
> 
> diff --git a/package/dahdi-linux/0005-drivers-dahdi-fix-build-with-clang-16.patch b/package/dahdi-linux/0005-drivers-dahdi-fix-build-with-clang-16.patch
> new file mode 100644
> index 0000000000..535e1628c9
> --- /dev/null
> +++ b/package/dahdi-linux/0005-drivers-dahdi-fix-build-with-clang-16.patch
> @@ -0,0 +1,106 @@
> +From d51c10dae5a06709983b929fc6f9fb18eec41951 Mon Sep 17 00:00:00 2001
> +From: Brahmajit Das <brahmajit.xyz@gmail.com>
> +Date: Thu, 22 Jun 2023 15:52:18 +0000
> +Subject: [PATCH] drivers/dahdi: fix build with clang-16
> +
> +clang-16 enables -Werror=incompatible-pointer-types (along with buch of
> +other warnings) by default, thus resulting in errors such as:
> +
> +/var/tmp/portage/net-misc/dahdi-3.2.0/work/dahdi-linux-3.2.0/drivers/dahdi/dahdi-sysfs.c:272:20: error: incompatible function
> +      pointer types initializing 'int (*)(const struct device *, struct kobj_uevent_env *)' with an expression of type
> +      'int (struct device *, struct kobj_uevent_env *)' [-Wincompatible-function-pointer-types]
> +        .uevent         = span_uevent,
> +                          ^~~~~~~~~~~
> +/var/tmp/portage/net-misc/dahdi-3.2.0/work/dahdi-linux-3.2.0/drivers/dahdi/dahdi-sysfs.c:709:20: error: incompatible function
> +      pointer types initializing 'int (*)(const struct device *, struct kobj_uevent_env *)' with an expression of type
> +      'int (struct device *, struct kobj_uevent_env *)' [-Wincompatible-function-pointer-types]
> +        .uevent         = device_uevent,
> +                          ^~~~~~~~~~~~~
> +2 errors generated.
> +
> +This is due the change in bus_type strcut made in upstream commit
> +https://github.com/torvalds/linux/commit/2a81ada32f0e584fc0c943e0d3a8c9f4fae411d6.
> +Where they make uevent take a const *, as the strcut should not be
> +modifying the device that is passed into it.
> +
> +This patch modifes some of the fucntions parameter types, making dahdi
> +possible to be built with clang-16.
> +
> +Bug: https://bugs.gentoo.org/906179
> +Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
> +
> +Upstream: https://github.com/asterisk/dahdi-linux/pull/21
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + drivers/dahdi/dahdi-sysfs.c    | 8 ++++----
> + drivers/dahdi/wctc4xxp/base.c  | 2 +-
> + drivers/dahdi/xpp/xbus-sysfs.c | 2 +-
> + 3 files changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/drivers/dahdi/dahdi-sysfs.c b/drivers/dahdi/dahdi-sysfs.c
> +index ca29ddba..0c5bd982 100644
> +--- a/drivers/dahdi/dahdi-sysfs.c
> ++++ b/drivers/dahdi/dahdi-sysfs.c
> +@@ -47,7 +47,7 @@ static int span_match(struct device *dev, struct device_driver *driver)
> + 	return 1;
> + }
> + 
> +-static inline struct dahdi_span *dev_to_span(struct device *dev)
> ++static inline struct dahdi_span *dev_to_span(const struct device *dev)
> + {
> + 	return dev_get_drvdata(dev);
> + }
> +@@ -68,7 +68,7 @@ static inline struct dahdi_span *dev_to_span(struct device *dev)
> + 			return err;				\
> + 	} while (0)
> + 
> +-static int span_uevent(struct device *dev, struct kobj_uevent_env *kenv)
> ++static int span_uevent(const struct device *dev, struct kobj_uevent_env *kenv)
> + {
> + 	struct dahdi_span *span;
> + 
> +@@ -415,7 +415,7 @@ static struct {
> + 	unsigned int clean_chardev:1;
> + } should_cleanup;
> + 
> +-static inline struct dahdi_device *to_ddev(struct device *dev)
> ++static inline struct dahdi_device *to_ddev(const struct device *dev)
> + {
> + 	return container_of(dev, struct dahdi_device, dev);
> + }
> +@@ -438,7 +438,7 @@ static inline struct dahdi_device *to_ddev(struct device *dev)
> + 			return err;				\
> + 	} while (0)
> + 
> +-static int device_uevent(struct device *dev, struct kobj_uevent_env *kenv)
> ++static int device_uevent(const struct device *dev, struct kobj_uevent_env *kenv)
> + {
> + 	struct dahdi_device *ddev;
> + 
> +diff --git a/drivers/dahdi/wctc4xxp/base.c b/drivers/dahdi/wctc4xxp/base.c
> +index ec6fc436..db70ea7e 100644
> +--- a/drivers/dahdi/wctc4xxp/base.c
> ++++ b/drivers/dahdi/wctc4xxp/base.c
> +@@ -643,7 +643,7 @@ wctc4xxp_net_register(struct wcdte *wc)
> + 		return -ENOMEM;
> + 	priv = netdev_priv(netdev);
> + 	priv->wc = wc;
> +-	memcpy(netdev->dev_addr, our_mac, sizeof(our_mac));
> ++	memcpy((void *)netdev->dev_addr, our_mac, sizeof(our_mac));
> + 
> + #	ifdef HAVE_NET_DEVICE_OPS
> + 	netdev->netdev_ops = &wctc4xxp_netdev_ops;
> +diff --git a/drivers/dahdi/xpp/xbus-sysfs.c b/drivers/dahdi/xpp/xbus-sysfs.c
> +index d8c11dc3..29ad3619 100644
> +--- a/drivers/dahdi/xpp/xbus-sysfs.c
> ++++ b/drivers/dahdi/xpp/xbus-sysfs.c
> +@@ -418,7 +418,7 @@ static int astribank_match(struct device *dev, struct device_driver *driver)
> + 			return err;				\
> + 	} while (0)
> + 
> +-static int astribank_uevent(struct device *dev, struct kobj_uevent_env *kenv)
> ++static int astribank_uevent(const struct device *dev, struct kobj_uevent_env *kenv)
> + {
> + 	xbus_t *xbus;
> + 	extern char *initdir;
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
