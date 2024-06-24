Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAD1C3064D
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 13:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 900D481585;
	Mon, 24 Jun 2024 13:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HlMmnV6pBiWm; Mon, 24 Jun 2024 13:46:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A047814B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A047814B7;
	Mon, 24 Jun 2024 13:46:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A66FA1BF479
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 13:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91EA6814B7
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 13:46:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f7zJ9ZAZfq1V for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 13:46:19 +0000 (UTC)
X-Greylist: delayed 24734 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 24 Jun 2024 13:46:18 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EF8D181026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF8D181026
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF8D181026
 for <buildroot@busybox.net>; Mon, 24 Jun 2024 13:46:18 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.90]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfpOd-1soB1N0BA1-00j1kL; Mon, 24
 Jun 2024 15:46:16 +0200
To: buildroot@busybox.net
Date: Mon, 24 Jun 2024 15:46:15 +0200
Message-ID: <20240624134615.19901-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:K2Rutb4rhaDChUvk73NUWN6DXNwBKwtLN3AEYFbPjYBbO5o/Xpy
 h40BbVun0RF1aoz9IwiKU4LSHdW+gEzrVKX1m5L6JSMUPVG6Lqt5gAFdqOb1SBNGoYg5hb0
 RZMFnSR+JGT6GMdkZh2ayiSCWwhfSG61+FW5Jrd4Raut1ofvFEAKgNtskhXfbdVjsOKvT2X
 DSdswGx2qfImTE1rKE9/g==
UI-OutboundReport: notjunk:1;M01:P0:tdKkkPXYwI8=;4J/TSycQoWMSQY2t3d6exTMGsTy
 wtlG2fBOwwSwsz3crYUufWEE2Xql68Zq7MvJNnFA3z35UYVzdal2qrH86q1/4rSiHrlZC1msI
 zgETdCQWkgJg3cMscYeVvYfuYFrKsGvydBOX0Fwqqp2BncYxisnFln5ca8ugv00IFIrwKcwZj
 TGNGxVwfRowQTQKmOKCH6AuR+D3F8XtjdfnzChxk84cTlclR1765hcNaVy78yt+iS1lWnK+Wi
 4EQ1M1W5GPydtfZgAvmBN65DFdWl9vf9tatbrqqaM7oNjFlEYIShPPW/sc6Up4JAUy3ewOMqx
 NZOFLbrZLAEPeARfiycfS+NI9T2M5o/xSNiS1qa+QMaF/IIX0tCr47SSIU16LdKW36sNF/O4o
 JQ1uT+G/jiaA5eos4SCHTPEK/KuBL9DAf1DGcClj0wv+zmXvemwudR2xBjBUS940bkW3c0OYS
 VrXmgWmmHsJk4pr+xM18w716YRvaFamZiamqZMN64LCXbGBmsR/R5w9Et43ydyb4ECTikaQVW
 Y10tuqK/qr7c0UMPHh+fNAHlY1zE4juqCUidVUaC6jIIioALP80FH1jAjLnKkMNgRHeMwAhiP
 ZtEDeD+nMEkHaK6t5Ci05iyg42P8884AYFJUFuh7PCFdsPFieUnPOW0fNEUQOik3NiKg4pxxh
 uHjcTHm/0g2bfe4j2E13i5jaPIqwb0n9AAZcxO2IghSWa4TLIJO8cZrQlr+SGw5RJAdXk6nH4
 /MJNgUPb9JtvVA8R5zSMbUY9aiY2b+Fb5iE9iF+jWIzTfGqztkSonCJj0foakswXu6PihbdmI
 fLEqC1qyG27yRu7MSb/nEJxEQgeBP0Rssf9iRNZhRyBD0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1719236776; x=1719841576; i=ps.report@gmx.net;
 bh=D6ER/PEvcTQqcxHp3I4ew+4GRHBJeNvgvdU1jX4Eo5U=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=nrn8a3Cxfia8MwkFwc7EwhilBj3YQcS1nNMBPgXYfYW1x7VMIhHaC9E55pdj72xI
 R367O2lFKZNhE54C+5DycGV8ChenAh7NLgxkv99ogglj9HNIOd4sh96VOI3wwABC9
 sAaP9KSYbUnujwWqLd2l4kY8Y9Cd0UmP3Poxf/H3aWLj6DfiBZnlHRNI02EDIUwKW
 8oGgVXmkzjt4Hs1GsCgwvpiWPYh5+SXJwrLVYBHfv1RDRoIvkhsixXU8EyX7jx7Ps
 589/FqaUq3Na3n1UPdhBXV8t4cPYOHret7KcA5Nl9Z9bIth3Ip5cMO3J6kbCnYn5G
 9hPNbtHTO8lTJFPXJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=nrn8a3Cx
Subject: [Buildroot] [PATCH v2] package/apr: bump version to 1.7.4
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- add 0002-Revert-Fix-crosscompiling-detection-in-apr-1-config.patch
  (revert of upstram commit [1], additional to keep the follow-up patches
  to fix apr-util build failure otherwise)
- move 0002-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch to
  0003-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch
- move 0003-Revert-Add-the-ability-to-cross-compile-APR.patch to
  0004-Revert-Add-the-ability-to-cross-compile-APR.patch

For details see [2].

[1] https://github.com/apache/apr/commit/130cf8cb3c6fe713095e560ade1df050aa2a6a14
[2] https://downloads.apache.org/apr/CHANGES-APR-1.7

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - add 0002-Revert-Fix-crosscompiling-detection-in-apr-1-config.patch
  - re-add 0002-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch
    and 0003-Revert-Add-the-ability-to-cross-compile-APR.patch
  - fixes the following apr-util build failure:
    Makefile:50: .../build/apr-util-1.6.3/build/rules.mk: No such file or directory
    make[2]: *** No rule to make target '.../build/apr-util-1.6.3/build/rules.mk'.
---
 ...scompiling-detection-in-apr-1-config.patch | 94 +++++++++++++++++++
 ...1872164.-Fix-the-name-of-libtool-wh.patch} |  0
 ...dd-the-ability-to-cross-compile-APR.patch} |  0
 package/apr/apr.hash                          |  4 +-
 package/apr/apr.mk                            |  2 +-
 5 files changed, 97 insertions(+), 3 deletions(-)
 create mode 100644 package/apr/0002-Revert-Fix-crosscompiling-detection-in-apr-1-config.patch
 rename package/apr/{0002-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch => 0003-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch} (100%)
 rename package/apr/{0003-Revert-Add-the-ability-to-cross-compile-APR.patch => 0004-Revert-Add-the-ability-to-cross-compile-APR.patch} (100%)

diff --git a/package/apr/0002-Revert-Fix-crosscompiling-detection-in-apr-1-config.patch b/package/apr/0002-Revert-Fix-crosscompiling-detection-in-apr-1-config.patch
new file mode 100644
index 0000000000..76d665ed02
--- /dev/null
+++ b/package/apr/0002-Revert-Fix-crosscompiling-detection-in-apr-1-config.patch
@@ -0,0 +1,94 @@
+From bcfdaafde561a22874733d22962dad387d9f4e48 Mon Sep 17 00:00:00 2001
+From: Ruediger Pluem <rpluem@apache.org>
+Date: Fri, 10 Mar 2023 10:54:03 +0000
+Subject: [PATCH] Revert: Fix crosscompiling detection in apr-1-config
+
+Since r1872148 apr-1-config tries to detect if it runs in a crosscompile
+scenario. Fix the detection to correctly distinguish between crosscompiling
+and DESTDIR installations for packaging.
+
+* configure.in: Set APR_CROSS_COMPILING to 'no', 'yes' or 'maybe' based on
+      possible --host and --build parameters given to configure to determine
+      if configure was called for a crosscompiling scenario. This was inspired
+      by how autoconf itself detects crosscompiling scenarios.
+* apr-config.in: Use the value from APR_CROSS_COMPILING to determine if
+      we are in a crosscompiling scenario. Furthermore normalize the pathes
+      we use for suffix matches by collapsing multiple consecutive '/' to one.
+
+PR: 66510
+
+git-svn-id: https://svn.apache.org/repos/asf/apr/apr/trunk@1908248 13f79535-47bb-0310-9956-ffa450edef68
+
+[Revert upstream commit https://github.com/apache/apr/commit/130cf8cb3c6fe713095e560ade1df050aa2a6a14]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ apr-config.in | 29 +++++++----------------------
+ configure.in  | 12 ------------
+ 2 files changed, 7 insertions(+), 34 deletions(-)
+
+diff --git a/apr-config.in b/apr-config.in
+index 626d3b0..bed47ca 100644
+--- a/apr-config.in
++++ b/apr-config.in
+@@ -48,28 +48,13 @@ APR_LIBNAME="@APR_LIBNAME@"
+ # NOTE: the following line is modified during 'make install': alter with care!
+ location=@APR_CONFIG_LOCATION@
+ 
+-cross_compiling=@APR_CROSS_COMPILING@
+-
+-if test "$cross_compiling" != "no"; then
+-
+-    # Normalize $0 and bindir by removing consecutive '/' as the comparison
+-    # and the suffix removal below might fail for semantic equal pathes.
+-    # XXX: This is not perfect. On Linux we could use realpath for this purpose
+-    # but realpath is not portable.
+-    normalized_command=`echo $0 | tr -s /`
+-    normalized_bindir=`echo ${bindir} | tr -s /`
+-    # Remove trailing '/'
+-    normalized_bindir=${normalized_bindir%/}
+-
+-    # absolute path, but not installed path - we're cross compiling
+-    case "$normalized_command" in
+-      "${normalized_bindir}/"*) ;;
+-      "/"*)                     location=crosscompile;
+-                                APR_TARGET_DIR=${normalized_command%${normalized_bindir}/apr-${APR_MAJOR_VERSION}-config};
+-                                ;;
+-      *)                        ;;
+-    esac
+-fi
++# absolute path, but not installed path - we're cross compiling
++case "$0" in
++  "${bindir}/"*) ;;
++  "/"*)         location=crosscompile;
++                APR_TARGET_DIR=${0%${bindir}/apr-${APR_MAJOR_VERSION}-config} ;;
++  *)            ;;
++esac
+ 
+ show_usage()
+ {
+diff --git a/configure.in b/configure.in
+index ff92e55..d9898c5 100644
+--- a/configure.in
++++ b/configure.in
+@@ -140,18 +140,6 @@ fi
+ 
+ AC_SUBST(APR_CONFIG_LOCATION)
+ 
+-if test "x$host_alias" != x; then
+-  if test "x$build_alias" = x; then
+-    APR_CROSS_COMPILING=maybe
+-  elif test "x$build_alias" != "x$host_alias"; then
+-    APR_CROSS_COMPILING=yes
+-  fi
+-else
+-    APR_CROSS_COMPILING=no
+-fi
+-
+-AC_SUBST(APR_CROSS_COMPILING)
+-
+ # Libtool might need this symbol -- it must point to the location of
+ # the generated libtool script (not necessarily the "top" build dir).
+ #
+-- 
+2.45.2
+
diff --git a/package/apr/0002-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch b/package/apr/0003-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch
similarity index 100%
rename from package/apr/0002-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch
rename to package/apr/0003-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch
diff --git a/package/apr/0003-Revert-Add-the-ability-to-cross-compile-APR.patch b/package/apr/0004-Revert-Add-the-ability-to-cross-compile-APR.patch
similarity index 100%
rename from package/apr/0003-Revert-Add-the-ability-to-cross-compile-APR.patch
rename to package/apr/0004-Revert-Add-the-ability-to-cross-compile-APR.patch
diff --git a/package/apr/apr.hash b/package/apr/apr.hash
index 96f43d3710..66a183c11d 100644
--- a/package/apr/apr.hash
+++ b/package/apr/apr.hash
@@ -1,4 +1,4 @@
-# From https://archive.apache.org/dist/apr/apr-1.7.2.tar.bz2.sha256
-sha256  75e77cc86776c030c0a5c408dfbd0bf2a0b75eed5351e52d5439fa1e5509a43e  apr-1.7.2.tar.bz2
+# From https://archive.apache.org/dist/apr/apr-1.7.4.tar.bz2.sha256
+sha256  fc648de983f3a2a6c9e78dea1f180639bd2fad6c06d556d4367a701fe5c35577  apr-1.7.4.tar.bz2
 # Locally calculated
 sha256  f854aeef66ecd55a126226e82b3f26793fc3b1c584647f6a0edc5639974c38ad  LICENSE
diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index cb8c12dd65..4eb6eb12ad 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APR_VERSION = 1.7.2
+APR_VERSION = 1.7.4
 APR_SOURCE = apr-$(APR_VERSION).tar.bz2
 APR_SITE = https://archive.apache.org/dist/apr
 APR_LICENSE = Apache-2.0
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
