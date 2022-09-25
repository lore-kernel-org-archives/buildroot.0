Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D97C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 20:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFC1260E03;
	Sun, 25 Sep 2022 20:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFC1260E03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n_o4dAn8iYt0; Sun, 25 Sep 2022 20:49:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDC0D60C29;
	Sun, 25 Sep 2022 20:49:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDC0D60C29
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4CA5B1BF321
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 20:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35341605F6
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 20:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35341605F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W6cpWOLOY98o for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 20:49:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 411F9605EA
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 20:49:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 411F9605EA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 308B786021; Sun, 25 Sep 2022 20:49:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 25 Sep 2022 22:48:14 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c1d360044c29d22b4a307e05d3fb3b83bbc7a215
X-Git-Newrev: ab35b08f23167d1c5edf1e7fd69c88087cf4d6f8
X-Patchwork-Hint: ignore
Message-Id: <20220925204923.308B786021@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/icu: clear TARGET
 env variable
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ab35b08f23167d1c5edf1e7fd69c88087cf4d6f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

If the TARGET env variable is set icu may try to use it.

To prevent this from causing issues clear it from the icu env.

Fixes:
>>> host-icu 70-1 Building
PATH="/home/buildroot/buildroot/output/per-package/host-icu/host/bin:/home/buildroot/buildroot/output/per-package/host-icu/host/sbin:/home/buildroot/bin:/home/buildroot/.local/bin:/home/buildroot/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
PKG_CONFIG="/home/buildroot/buildroot/output/per-package/host-icu/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/buildroot/buildroot/output/per-package/host-icu/host/lib/pkgconfig:/home/buildroot/buildroot/output/per-package/host-icu/host/share/pkgconfig"
 /usr/bin/make -j33  -C
/home/buildroot/buildroot/output/build/host-icu-70-1/source
cd ./config; \
    /usr/bin/make -f pkgdataMakefile
rm -rf config/icu-config
rebuilding config/icucross.mk
rebuilding config/icucross.inc
/bin/bash ./mkinstalldirs lib
/bin/bash ./mkinstalldirs bin
/usr/bin/install -c ./config/icu-config-top config/icu-config
rm -rf pkgdata.inc
chmod u+w config/icu-config
mkdir lib
mkdir bin
LC_ALL=C /usr/bin/sed -f ./config/make2sh.sed < ./config/Makefile.inc
| grep -v '#M#' | uniq >> config/icu-config
config/icu-uc.pc updated.
config/icu-i18n.pc updated.
/usr/bin/make[2]: Making `all' in `stubdata'
LC_ALL=C /usr/bin/sed -f ./config/make2sh.sed < ./config/mh-linux |
grep -v '#M#' | uniq >> config/icu-config
cat ./config/icu-config-bottom >> config/icu-config
   (deps)     stubdata.cpp
chmod u-w config/icu-config
Note: rebuild with "/usr/bin/make VERBOSE=1 " to show all compiler parameters.
make[3]: *** No rule to make target 'bpf', needed by 'all-local'.  Stop.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 17b6372790c33fa317ab6134ad6d5b8882b9cedd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/icu/icu.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index ebbb1968fc..8107796ae9 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -28,6 +28,13 @@ ICU_CONF_OPTS = \
 	--disable-samples \
 	--disable-tests
 
+# the icu build process breaks if the TARGET environment variable is
+# non-empty
+ICU_CONF_ENV += TARGET=""
+ICU_MAKE_ENV += TARGET=""
+HOST_ICU_CONF_ENV += TARGET=""
+HOST_ICU_MAKE_ENV += TARGET=""
+
 # When available, icu prefers to use C++11 atomics, which rely on the
 # __atomic builtins. On certain architectures, this requires linking
 # with libatomic starting from gcc 4.8.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
