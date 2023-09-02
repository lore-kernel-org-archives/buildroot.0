Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B6BCA0FF6
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 07:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AD7A4012B;
	Sat,  2 Sep 2023 07:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AD7A4012B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JQ0Cz-11K9XG; Sat,  2 Sep 2023 07:40:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26E604052D;
	Sat,  2 Sep 2023 07:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26E604052D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 175301BF3CB
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B10114026F
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B10114026F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ipYEFDRb1tmc for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 07:38:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FA6F4025D
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 07:38:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FA6F4025D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E89386501; Sat,  2 Sep 2023 07:38:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 09:36:52 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a0617d73c39a42a6644e99f7e0a2f766ade1a3ce
X-Git-Newrev: 94d48acba3a787dd20fb53bcd759a2cf96e779fc
X-Patchwork-Hint: ignore
Message-Id: <20230902073856.7E89386501@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libopenssl: bump
 version to 3.1.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=94d48acba3a787dd20fb53bcd759a2cf96e779fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-Reproducible-build-do-not-leak-compiler-path.patch       | 2 +-
 ...004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch | 8 ++++----
 package/libopenssl/0005-Revert-Fix-static-builds.patch            | 4 ++--
 package/libopenssl/0006-Add-linux-x86-latomic-target.patch        | 2 +-
 package/libopenssl/libopenssl.hash                                | 4 ++--
 package/libopenssl/libopenssl.mk                                  | 2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/libopenssl/0002-Reproducible-build-do-not-leak-compiler-path.patch b/package/libopenssl/0002-Reproducible-build-do-not-leak-compiler-path.patch
index ea26a31075..9353c1ae90 100644
--- a/package/libopenssl/0002-Reproducible-build-do-not-leak-compiler-path.patch
+++ b/package/libopenssl/0002-Reproducible-build-do-not-leak-compiler-path.patch
@@ -15,7 +15,7 @@ diff --git a/crypto/build.info b/crypto/build.info
 index 2c619c6..49ca6ab 100644
 --- a/crypto/build.info
 +++ b/crypto/build.info
-@@ -111,7 +111,7 @@ EXTRA=  ../ms/uplink-x86.pl ../ms/uplink.c ../ms/applink.c \
+@@ -115,7 +115,7 @@ EXTRA=  ../ms/uplink-x86.pl ../ms/uplink.c ../ms/applink.c \
  
  DEPEND[info.o]=buildinf.h
  DEPEND[cversion.o]=buildinf.h
diff --git a/package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch b/package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
index 9f34e1f5fb..629d9c26ce 100644
--- a/package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
+++ b/package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
@@ -21,9 +21,9 @@ diff --git a/Configure b/Configure
 index 5a699836f3..f9152b1702 100755
 --- a/Configure
 +++ b/Configure
-@@ -1424,6 +1424,10 @@ my %predefined_CXX = $config{CXX}
-     ? compiler_predefined($config{CROSS_COMPILE}.$config{CXX})
-     : ();
+@@ -1549,6 +1549,10 @@ unless ($disabled{asm}) {
+     }
+ }
  
 +if ($target eq "linux-ppc64" && !$disabled{asm}) {
 +       $target{perlasm_scheme} = "linux64v2" if ($predefined_C{_CALL_ELF} == 2);
@@ -31,7 +31,7 @@ index 5a699836f3..f9152b1702 100755
 +
  # Check for makedepend capabilities.
  if (!$disabled{makedepend}) {
-     if ($config{target} =~ /^(VC|vms)-/) {
+     # If the attribute makedep_scheme is defined, then we assume that the
 -- 
 2.25.0
 
diff --git a/package/libopenssl/0005-Revert-Fix-static-builds.patch b/package/libopenssl/0005-Revert-Fix-static-builds.patch
index 2bc0b961eb..149ad54fc5 100644
--- a/package/libopenssl/0005-Revert-Fix-static-builds.patch
+++ b/package/libopenssl/0005-Revert-Fix-static-builds.patch
@@ -16,7 +16,7 @@ diff --git a/Configure b/Configure
 index 2c17f4186b..94cab4c3c4 100755
 --- a/Configure
 +++ b/Configure
-@@ -1438,10 +1438,6 @@ foreach (keys %useradd) {
+@@ -1377,10 +1377,6 @@ foreach (keys %useradd) {
  # At this point, we can forget everything about %user and %useradd,
  # because it's now all been merged into the corresponding $config entry
  
@@ -27,7 +27,7 @@ index 2c17f4186b..94cab4c3c4 100755
  # Allow overriding the build file name
  $config{build_file} = env('BUILDFILE') || $target{build_file} || "Makefile";
  
-@@ -1728,6 +1724,10 @@ if ($strict_warnings)
+@@ -1671,6 +1667,10 @@ if ($strict_warnings)
                  }
          }
  
diff --git a/package/libopenssl/0006-Add-linux-x86-latomic-target.patch b/package/libopenssl/0006-Add-linux-x86-latomic-target.patch
index a59db73314..9ecc50b1ae 100644
--- a/package/libopenssl/0006-Add-linux-x86-latomic-target.patch
+++ b/package/libopenssl/0006-Add-linux-x86-latomic-target.patch
@@ -14,7 +14,7 @@ diff --git a/Configurations/10-main.conf b/Configurations/10-main.conf
 index 2200a85b16..bcf54a2a53 100644
 --- a/Configurations/10-main.conf
 +++ b/Configurations/10-main.conf
-@@ -861,6 +861,10 @@ my %targets = (
+@@ -868,6 +868,10 @@ my %targets = (
          asm_arch         => 'x86',
          perlasm_scheme   => "elf",
      },
diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index b43281c7eb..1c82cd7cf8 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-3.0.10.tar.gz.sha256
-sha256  1761d4f5b13a1028b9b6f3d4b8e17feb0cedc9370f6afe61d7193d2cdce83323  openssl-3.0.10.tar.gz
+# From https://www.openssl.org/source/openssl-3.1.2.tar.gz.sha256
+sha256  a0ce69b8b97ea6a35b96875235aa453b966ba3cba8af2de23657d8b6767d6539  openssl-3.1.2.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 8bc3687921..9c1dbe8694 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.0.10
+LIBOPENSSL_VERSION = 3.1.2
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
