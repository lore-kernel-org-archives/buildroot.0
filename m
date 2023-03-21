Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B15C6FD20
	for <buildroot@archiver.kernel.org>; Tue, 21 Mar 2023 20:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC8E461310;
	Tue, 21 Mar 2023 20:12:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC8E461310
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VU_I9HM-Ve7P; Tue, 21 Mar 2023 20:12:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 003F16130C;
	Tue, 21 Mar 2023 20:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 003F16130C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3CEAD1BF357
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 20:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 180A06130A
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 20:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 180A06130A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JlBHA7DdVtYY for <buildroot@lists.busybox.net>;
 Tue, 21 Mar 2023 20:12:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B66D561127
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B66D561127
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 20:12:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.166.121]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MeU4y-1qF91Z06A0-00aWD6; Tue, 21 Mar 2023 21:12:25 +0100
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Tue, 21 Mar 2023 21:11:31 +0100
Message-Id: <20230321201133.236692-2-dalang@gmx.at>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230321201133.236692-1-dalang@gmx.at>
References: <20230321201133.236692-1-dalang@gmx.at>
MIME-Version: 1.0
X-Provags-ID: V03:K1:dojij3UVDeswig92xaimD2BpTsRgHwvyFZ1pDROgJ4pO4CavgDL
 gzp39w8EFDzTwANVNECfLXTMUlf3fjZcrp1iOuNpge1W0BjO7qHinBP4JwFwmsNe7KTj3PY
 x/U/Yp4OP33d54DttkTFJwqNyl7P9g4gl6jGY2XTO7R2vh2KMIsuETV481kS4zfENc4iziH
 yFErJLD0yiduow1hSQUcA==
UI-OutboundReport: notjunk:1;M01:P0:aCsSzt2vbW4=;zSjkvcPUkjLitOvpHclj8d5dcPf
 q9UaNl3mtXjmyzWN2BkepILgoR6L/th4l1W7+nSmPQSMG0UOmmqvzncBeKxLG4qzEjiuFXG2q
 BlrLwNV300c6xr2D3BGofyCKWfEUIw0O3ctbOtKKzyamNNWfTL9jCi6N70xdgkXT9ETlVqiNq
 +8zVNcLzg2zJDUNImKc4/d9HqSISD77nenwwEP3WL/Y1lGy9x4SUFLCYwvtkuufLPmcTDBLKO
 pYIOP3ZM716A07DE5Rm48DHpO1xxjvZj59Ds6KlxVhK9iHh72rxLfAaKDKmge+8ygPdzc5cxV
 mtXWOdlk2gfIynN6FT7uCkleux7Gx3Lt3ZMCzj9EDVvgMklZNMUwpOERPB8WlMSM8V37BK5hI
 zZRGG0rRB3fsQSL2kYkT+OXQlx6iAkjVXVIbvrpMdoPfJlwsFPxTG39o+tAqnCK8hSMZv2AdL
 fjCMnGVtvjGqSqatyl739wUQC+KB8Js5ZyjzbIGE25YspXn0qs75S5mktzNgwf1f5IWyAFGgU
 3nGgO8fCclz+huq7q2vN1/GaP3nxRQhuZW0rbizg3RI4gtY0yGz3GXQmuCodjtH5herF5Ztio
 LmsO6ve/9zxbN66IFgijrl/F9SGODbNQSLZ2YsCVirhmsQxxY8yb68R91ZJ+wrURZnAwqTyIC
 5kQrVQQJ31uzr48FLiykcmAvWMffT9+jhqtZY6tvllZ62+Y8rQHC0oJcIRD4Y3m1tnZL9r/Bj
 Wq2K3bFRioLIGL8/qwusxvZ0qvmYGbfnkyXAFWR91cUa8yxgDIYyt8ZWQBR+sUykAWoOterjX
 uO7n4EzOzxCiomJJKvCvKRRqamyqq68YXUf/vtBxG66KWteSOeHUB8gNTPrOp3y/ISjshp3vq
 B0Hnh729yfpz9YXrZ8Vy1EAkfMcn16Kyljvf9KiFNAmJXdJ7NNm9TsosOkXwfzkhHudrTpOXu
 YOfZoZ+2xI0y4WxVfRwf+1PWmlQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1679429545; i=dalang@gmx.at;
 bh=AcMV+AySPFVvidj/0e/o2WM0KGllR3K78eBcHayACWU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=A51QKj5Fd57j8RlbumXLHVprY/aV/acmogYYhg7+uuU+zfhYQLSIizrL23Eyb08Do
 NpNcVlPpUbtcau8XE3hUCkLWK/rtwWCqIciHM7v3KF0mbH+MRVSX3wmjquvtyzgYvM
 iecGdDV01nmwqq2IQ9XmeYnCAaa0hfRBP2bvenXp5eLefjqvXwv2o2EG8lPebVYms7
 zW946MMGUhxzq0gosrG8rIa8nHx7tBCLVLLgD5IKVhYKJgLFwnA1s6C2LCLWuj1PN4
 qYYmiOC/kpyNq7HINNbmRTCbr49020EXI3yoUUcweBRBrkdTmKdCAueF8KtnfHCxD7
 jzjaejWQXM3gA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=A51QKj5F
Subject: [Buildroot] [PATCH 2/3] package/cairomm: use official website
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
Cc: Daniel Lang <d.lang@abatec.at>, James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The website [1] states that the released version can be downloaded from
the cairo release area [2], which also features a sha1 hash.

[1]: https://www.cairographics.org/cairomm/
[2]: https://www.cairographics.org/releases/

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/cairomm/Config.in    | 2 +-
 package/cairomm/cairomm.hash | 5 ++++-
 package/cairomm/cairomm.mk   | 3 ++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/cairomm/Config.in b/package/cairomm/Config.in
index 75f6692b8a..174f3967ab 100644
--- a/package/cairomm/Config.in
+++ b/package/cairomm/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_CAIROMM
 	help
 	  The cairomm package is a set of C++ bindings for Cairo.
 
-	  http://www.gtkmm.org/
+	  https://www.cairographics.org/cairomm/
 
 comment "cairomm needs a toolchain w/ C++, wchar, threads, gcc >= 7"
 	depends on BR2_USE_MMU
diff --git a/package/cairomm/cairomm.hash b/package/cairomm/cairomm.hash
index d14a65c2d6..dc32453220 100644
--- a/package/cairomm/cairomm.hash
+++ b/package/cairomm/cairomm.hash
@@ -1,3 +1,6 @@
+# From https://www.cairographics.org/releases/cairomm-1.16.1.tar.xz.sha1
+sha1  a2de9b7fbfe8176cb555d94bb531ba1a07f31cc4  cairomm-1.16.1.tar.xz
+
 # Locally computed
-sha256  bb86d855041bd46d31b03e43ea355d233de44034b39d4200725b1e0947e63e67  cairomm-1.16.1.tar.gz
+sha256  6f6060d8e98dd4b8acfee2295fddbdd38cf487c07c26aad8d1a83bb9bff4a2c6  cairomm-1.16.1.tar.xz
 sha256  bfe4a52dc4645385f356a8e83cc54216a293e3b6f1cb4f79f5fc0277abf937fd  COPYING
diff --git a/package/cairomm/cairomm.mk b/package/cairomm/cairomm.mk
index 856c9d67fc..6bb29ea051 100644
--- a/package/cairomm/cairomm.mk
+++ b/package/cairomm/cairomm.mk
@@ -7,7 +7,8 @@
 CAIROMM_VERSION = 1.16.1
 CAIROMM_LICENSE = LGPL-2.0+
 CAIROMM_LICENSE_FILES = COPYING
-CAIROMM_SITE = https://gitlab.freedesktop.org/cairo/cairomm/-/archive/$(CAIROMM_VERSION)
+CAIROMM_SOURCE = cairomm-$(CAIROMM_VERSION).tar.xz
+CAIROMM_SITE = https://cairographics.org/releases
 CAIROMM_INSTALL_STAGING = YES
 CAIROMM_DEPENDENCIES = cairo libglib2 libsigc host-pkgconf
 CAIROMM_CONF_OPTS = -Dbuild-examples=false -Dbuild-tests=false
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
