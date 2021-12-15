Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED304C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Dec 2021 22:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7014160F81;
	Wed, 15 Dec 2021 22:28:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1IYNAFxhBBeK; Wed, 15 Dec 2021 22:28:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C0BF60FAA;
	Wed, 15 Dec 2021 22:28:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 04EA41BF44A
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 22:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0123583163
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 22:28:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id btf9CKtCXnAi for <buildroot@lists.busybox.net>;
 Wed, 15 Dec 2021 22:28:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84AB583134
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 22:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1639607320;
 bh=wzi4zO4FsjO36Sd9ONXbAxpU7PebDyPW00X2v6xZrZU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=FVm9+njRMoJWv+GzlkryLx9RWVYe0tsGAvMHif8K8Za8Fi5DGySD8bTi3TZDlZhny
 Q239b+st2sVcbqQU9F03D1RWWtb0jOp1dnVybb/OUE6uLB3IIlOjEqKmI/4mPOEiUh
 OTwi9xi+gk2WJJqKD8cWTcg1KauDLkp8TGpF9I5o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.223]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0G1n-1mcXJ10SYh-00xGz3; Wed, 15
 Dec 2021 23:28:40 +0100
Date: Wed, 15 Dec 2021 23:28:39 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Florent AUMAITRE <florent.aumaitre@medianesysteme.com>
Message-ID: <20211215232839.22ae07a9@gmx.net>
In-Reply-To: <20211214075133.4482-1-florent.aumaitre@medianesysteme.com>
References: <20211214075133.4482-1-florent.aumaitre@medianesysteme.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:jcvs+SnJ6z+TwKFoFpuQ33b26+ruc7Lpr/2wl2g6+sTRI+auMTu
 gXJcnrfEHJG93JD/Jzeq0QkLVAFUu6CtVJwwcsZXzUvCu6GnzrtfOmAclpog8d7wAh3PqTk
 6sR+QRM3C4znXSSkswYpPWCAwOCI6FwZST/tgjAcGq1vjX5mTJQIuJc/DkqDyrzY+vybHZF
 Gx1fWDRU3S9z7RA02McXw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HTtcbMoPgiY=:CqFZATg1LSGNsL0A1IRgdd
 XEbB0MhW6ljMrugBTOqzmAhWGy2f51u6kGS1wqzNIOE+nP90RKK+3pDTJ1vy3hJ2FMfWICJco
 KUqFefQm1Y+8q5u4OqEuy+9+Yg3jnMZHAPQkxF+cEjSTgfZN1ESk544OrNw/Jna3b9AofaW0p
 UZgv8yrjFyuPyWiKGOzPvD/cMYuWJlYvz8W85CnQgwY/ghA5XZgs9XrMQRqF+9OUdpo/6257s
 g1MRivuGhKHNIwUoaXrsA5V8c33DDhS9J20/iZVFwxZ/ZoDojRj9HsMydv7Wde4g9fASTk9JB
 Qwhd1ayIcYaH8+WN2hfkRnQMwwXlvO9vvdQYqe+LE+p81yMd9ww4c4z+2g+v9Nw9JE9MhjTtW
 UUcIRlRjssUlNpfNobWtfdd1F5M1wiBDHb9ssu/JJVhIVdK9muEVn3JH1uoAviWksMrqtFcH/
 K1+jTWGKWHnNwAnIDKDT5YUb8eSVaIdIw8UVvQk2OUdlk+/4RqeZXTy1e3t2Fx3CXtpk3Ey3V
 4XxUMTYSNVModPoZ89RUI//MTTi7FY6AKV9zyfr4cZ8igqB4VBL2JHi3bL6I0lkN1dlcmygea
 jZywVJ0gZLTjdb+E5thRXdx6u8hb+LKztcxGNYLXpJeUcudQmnPnwRsVcbWqgGd1u3tNUXkoH
 vYw1Hgq4w/s1sLEaA49aKfahRa7Oxq1o5XNxBFBj/Ll6NZoZiqrcyiJmpaaLZnX1wgXPztQCx
 kRUd74djpMXW9L7UEppPAvONJrp7Rlt7QjgWuPAJqnMMf0Prqsk5XzgXsA0T3Pw8u5f99YLTj
 auz1jg5eOm9ZGZnVoQ7gvXHWSF6al5jjBfOk1h6yNtdfXfThatEW0ENCRGFzmH64Bc4OKiSXu
 3KkxuKcgS3bFPqI018YDbGBkvX8uRFxmVbQ+dZ/bjgK7jLPMn6MmNytyYmxvlVBqR+K/yr2MB
 a4tLh0GO/2k07BxuQRCLrdlvFCI9DuNLYmlwhVpGkegFmZISR9SYN6+CMiM/YrS3LkXmbZSAN
 +OqacQupw+6kTGSw20wEaO7psdTxQEVI13oyUJqWtg8v8K/P7G3c1La4rdq3YqT3TQ6C4kvLy
 DtGsSlacTiPhbo=
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5: fix parallel build qmake
 package (qt5) doesn't build when using parallel build.
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
Cc: Julien Corjon <corjon.j@ecagroup.com>,
 Naumann Andreas <ANaumann@ultratronik.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Florent,

On Tue, 14 Dec 2021 08:51:33 +0100, Florent AUMAITRE <florent.aumaitre@medianesysteme.com> wrote:

> Signed-off-by: Florent AUMAITRE <florent.aumaitre@medianesysteme.com>
> ---
>  package/pkg-qmake.mk           | 22 +++++++++++++++++++++-
>  package/qt5/qt5.mk             |  4 +++-
>  package/qt5/qt5base/qt5base.mk | 13 +++++++++++++
>  3 files changed, 37 insertions(+), 2 deletions(-)
>
> diff --git a/package/pkg-qmake.mk b/package/pkg-qmake.mk
> index deb033c1d6..55b3594f32 100644
> --- a/package/pkg-qmake.mk
> +++ b/package/pkg-qmake.mk
> @@ -20,6 +20,23 @@
>  #
>  ################################################################################
>
> +# When per-package is enabled, and qmake project is configured to generate
> +# pkg-config compatible package, absolute path are generated for "prefix" field
> +# of .pc files. In order to keep per-package isolation with sysroot'in, it is
> +# needed to remove those absolute path. Same apply for mkspecs files.
> +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> +define PKG_QMAKE_FIXUP_ABSOLUTE_PATH
> +	$(Q)find $(STAGING_DIR)/ -name "*.pc" \
> +	| xargs --no-run-if-empty \
> +	$(SED) "s:$(STAGING_DIR)::g"
> +
> +	$(Q)find $(HOST_DIR)/ -name "*.pri" \
> +		| xargs --no-run-if-empty \
> +		$(SED) "s:$(STAGING_DIR):\$$\$$\[QT_SYSROOT\]:g"
> +endef
> +endif
> +
> +
>  #
>  # Hook to sync Qt headers
>  #
> @@ -89,6 +106,8 @@ define $(2)_INSTALL_STAGING_CMDS
>  endef
>  endif
>
> +$(2)_POST_INSTALL_STAGING_HOOKS += PKG_QMAKE_FIXUP_ABSOLUTE_PATH
> +
>  #
>  # Target installation step. Only define it if not already defined by
>  # the package .mk file.
> @@ -103,9 +122,10 @@ endif
>  # We subsequently rsync only the files from the temporary staging dir and that
>  # way exclude files for the build host from target.
>  #
> +# Qt Package (declarative at least) does not install in parallel due to improper make rules
>  ifndef $(2)_INSTALL_TARGET_CMDS
>  define $(2)_INSTALL_TARGET_CMDS
> -	$$(TARGET_MAKE_ENV) $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_BUILDDIR) INSTALL_ROOT=$$($(2)_BUILDDIR)tmp-target-install $$($(2)_INSTALL_TARGET_OPTS)
> +	$$(TARGET_MAKE_ENV) $$($(2)_MAKE_ENV) $$(MAKE1) -C $$($(2)_BUILDDIR) INSTALL_ROOT=$$($(2)_BUILDDIR)tmp-target-install $$($(2)_INSTALL_TARGET_OPTS)

Which failure? Does it happen with per-package enabled or without (would
like to avoid the forced MAKE1 for all qt packages install) too? In case it
happens with per-package disabled it should go to an extra patch...

One qt5declarative failure for parallel install was fixed by 'package/qt5/qt5declarative:
fix parallel install' ([1]) some time back...

Regards,
Peter

[1] https://git.buildroot.net/buildroot/commit/?id=a96277a93d36a1828de87b011022ae389a549cbd

>  	rsync -arv $$($(2)_BUILDDIR)tmp-target-install$$(STAGING_DIR)/ $$(TARGET_DIR)/
>  endef
>  endif
> diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
> index 3ffb7b0063..eced7e2564 100644
> --- a/package/qt5/qt5.mk
> +++ b/package/qt5/qt5.mk
> @@ -27,4 +27,6 @@ endef
>  endif
>
>  # Variable for other Qt applications to use
> -QT5_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++
> +QT5_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++ \
> +	PKG_CONFIG_SYSROOT_DIR=$(STAGING_DIR) \
> +	PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index ba2971dc08..3750d4547e 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -334,4 +334,17 @@ endef
>
>  QT5BASE_POST_INSTALL_STAGING_HOOKS += QT5_INSTALL_QT_CONF
>
> +# CMake config files generated by Qt5 might break per-package isolation because
> +# of absolute path generated.
> +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> +define QT5BASE_CMAKECONFIG_FIXUP
> +	$(Q)find $(STAGING_DIR)/ -name "*.cmake" \
> +		| xargs --no-run-if-empty \
> +		$(SED) "s:$(STAGING_DIR)::g"
> +endef
> +endif
> +
> +QT5BASE_POST_INSTALL_STAGING_HOOKS += QT5BASE_CMAKECONFIG_FIXUP
> +
> +
>  $(eval $(qmake-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
