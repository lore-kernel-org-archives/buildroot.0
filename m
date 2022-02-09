Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30783C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 23:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB9344051D;
	Wed,  9 Feb 2022 23:00:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jxNmN-mDlJaG; Wed,  9 Feb 2022 23:00:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6998403A7;
	Wed,  9 Feb 2022 23:00:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9CC111BF3F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 23:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AC4C403A7
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 23:00:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wCrs0tTWa5g5 for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 23:00:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 290AC401B1
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 23:00:24 +0000 (UTC)
Received: from calakmul.fritz.box ([151.61.64.67]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.17.189]) with ESMTPA (Nemesis) id
 1MZCvh-1nmzMz4C1Z-00V8Qi; Thu, 10 Feb 2022 00:00:21 +0100
From: Pedro Aguilar <paguilar@paguilar.org>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 23:59:57 +0100
Message-Id: <20220209225957.1257630-1-paguilar@paguilar.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:hF6uyHZ3LbTI5wj0UoeHX09Mak6q1ui7bkSoevz2uC5uxILG5kk
 1XW8xJe/hfjVtR31cgG6arn0bMv9YdPhTYpVC9GLZSSSQdynbQRHvjMTeCAHUqWTRAwSn34
 YSjzmWgvXZ12Tyxdu6jESK6pkDzRkqTSkG2Udln9VayuuC/D4eHYu6c2Up3d15I42xjR7yc
 GvUP6xmZZoo0+AtoWRXug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VodUC4UkVHg=:DgrQILlp62s/TqteaQAJD4
 m5BJKqqpCM8vlLN4hCJnhPUNgnqzyKWoVZ1gKeqJtQ8xmVESQ6vqBv1gdtWl+kkpmof3b6XLA
 ImWdK/2qk9lUFACgFRZGF9GPfbFl89AbBZTxoSeag/EubRXBDDVwHXGkDSoqVlUYpX5dM3xgi
 2ar/NdZEHqLBaUS8EXDpXZEhJPJ6MPLBDUu6oaRzMtnDiKrVwBi/VyWCLWZ3W7k4IEcMKrnkW
 XnqW+C+Ca9L7vIBtG7DQYVMh2dEl1snf7QaBDvZYGk2N36y6qk+rihRMyDUcw7QIATqpuqikU
 2g6nbyMTTl79BrJUG1cx3dHTMHH/TJJO4S2SjEu7W78D1WHCgonvMfH+wt0JDCTvwpRM3LO8t
 VhpEeVrpcUBcTVzSuhPBaze9r5Z2NfB7euUDNNYVv8CjMYqk1imI3fSJHRAg2oj3Pt+/tv2+u
 b30S4MsZfjUbYlmb+LNOVidcDwRIibXrfRnQG8DehFCUDgD3t/BLrEussbAwdkuW/bLHwszZB
 /Y1TjTNuKhfOvSZ6m5Jaynhv5JxHhlxjBRwtNZe12XiYsa91ihTHW99xZ3r3rPyBRWuXKepjr
 xzjHwfA+GPklZCDmnYkhOLPLwF8XfGNUacuhyk47+XNDV+bQMoYz90CDfoaB1pxGGMCqzXIXY
 Xdl94lY5FR7MVty6pwNpn9Bf3oUYKY5qYcQu2mmoP0ZTbNg946z8dvcibZa4RETPd88kYqmbq
 liXz1HoRaLCWKQr1
Subject: [Buildroot] [PATCH v3 1/1] package/guile: Fix build failure due to
 missing libiconv
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
Cc: giulio.benetti@benettiengineering.com, thomas.petazzoni@bootlin.com,
 Pedro Aguilar <paguilar@paguilar.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building package guile with BR2_ENABLE_LOCALE=n
we get the following error:

```
In file included from filesys.c:95:
ports-internal.h:26:10: fatal error: iconv.h: No such file or directory
   26 | #include <iconv.h>
      |          ^~~~~~~~~
compilation terminated.
```

So let's fix it by selecting BR2_PACKAGE_LIBICONV and
adding libiconv package as dependency.

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

---
Changes v2 -> v3:
  - Improve commit message (thanks to Giulio comments)
Changes v1 -> v2:
  - Use BR2_ENABLE_LOCALE if selected, otherwise use libiconv
    as before (pointed out by Thomas and Giulio)
---
 package/guile/Config.in | 1 +
 package/guile/guile.mk  | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/guile/Config.in b/package/guile/Config.in
index b1182a4cee..f70e674018 100644
--- a/package/guile/Config.in
+++ b/package/guile/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_GUILE
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_BDWGC
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Guile is an interpreter and compiler for the Scheme
 	  programming language, a clean and elegant dialect of Lisp.
diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 0f245fca76..03420407f8 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -18,6 +18,10 @@ GUILE_CPE_ID_VENDOR = gnu
 GUILE_DEPENDENCIES = host-guile libunistring libffi gmp bdwgc host-pkgconf
 HOST_GUILE_DEPENDENCIES = host-libunistring host-libffi host-gmp host-bdwgc host-flex host-pkgconf host-gettext
 
+ifeq ($(BR2_ENABLE_LOCALE),)
+GUILE_DEPENDENCIES += libiconv
+endif
+
 # The HAVE_GC* CFLAGS specify that we will use internal callbacks
 # instead of the ones provided by
 # bdwgc. Eg. HAVE_GC_SET_FINALIZER_NOTIFIER specifies that we won't
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
