Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1593DC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 16:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A0C2431AB;
	Wed,  1 Nov 2023 16:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A0C2431AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jKZluwpv2WYK; Wed,  1 Nov 2023 16:25:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4007431D2;
	Wed,  1 Nov 2023 16:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4007431D2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B1DB81BF841
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89F1241785
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89F1241785
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id na8QQzT3f8-L for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 16:24:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B0D940180
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 16:24:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B0D940180
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65B228636A; Wed,  1 Nov 2023 16:24:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 17:09:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96b8eac679138e7eab022770d71a42368f2d6f58
X-Git-Newrev: e612a67c95cc5e4ff617805957b0d72ef01f47cd
X-Patchwork-Hint: ignore
Message-Id: <20231101162447.65B228636A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zeromq: bump to version 4.3.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=e612a67c95cc5e4ff617805957b0d72ef01f47cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Relicensing from LGPL-3.0+ to MPL-2.0:
  https://github.com/zeromq/libzmq/commit/da31917f4f443df751871ee359f7562cf6d77bde

https://github.com/zeromq/libzmq/releases/tag/v4.3.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../zeromq/0001-define-missing-rebind-type.patch   | 62 ----------------------
 package/zeromq/zeromq.hash                         |  9 ++--
 package/zeromq/zeromq.mk                           |  6 +--
 3 files changed, 7 insertions(+), 70 deletions(-)

diff --git a/package/zeromq/0001-define-missing-rebind-type.patch b/package/zeromq/0001-define-missing-rebind-type.patch
deleted file mode 100644
index f7484931e8..0000000000
--- a/package/zeromq/0001-define-missing-rebind-type.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 438d5d88392baffa6c2c5e0737d9de19d6686f0d Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyich@gmail.com>
-Date: Tue, 20 Dec 2022 21:45:16 +0000
-Subject: [PATCH] src/secure_allocator.hpp: define missing 'rebind' type
-
-`gcc-13` added an assert to standard headers to make sure custom
-allocators have intended implementation of rebind type instead
-of inherited rebind. gcc change:
-    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=64c986b49558a7
-
-Without the fix build fails on this week's `gcc-13` as:
-
-    [ 92%] Building CXX object tests/CMakeFiles/test_security_curve.dir/test_security_curve.cpp.o
-    In file included from /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/ext/alloc_traits.h:34,
-                     from /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/stl_uninitialized.h:64,
-                     from /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/memory:69,
-                     from tests/../src/secure_allocator.hpp:42,
-                     from tests/../src/curve_client_tools.hpp:49,
-                     from tests/test_security_curve.cpp:53:
-    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/alloc_traits.h: In instantiation of 'struct std::__allocator_traits_base::__rebind<zmq::secure_allocator_t<unsigned char>, unsigned char, void>':
-    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/alloc_traits.h:94:11:   required by substitution of 'template<class _Alloc, class _Up> using std::__alloc_rebind = typename std::__allocator_traits_base::__rebind<_Alloc, _Up>::type [with _Alloc = zmq::secure_allocator_t<unsigned char>; _Up = unsigned char]'
-    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/alloc_traits.h:228:8:   required by substitution of 'template<class _Alloc> template<class _Tp> using std::allocator_traits< <template-parameter-1-1> >::rebind_alloc = std::__alloc_rebind<_Alloc, _Tp> [with _Tp = unsigned char; _Alloc = zmq::secure_allocator_t<unsigned char>]'
-    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/ext/alloc_traits.h:126:65:   required from 'struct __gnu_cxx::__alloc_traits<zmq::secure_allocator_t<unsigned char>, unsigned char>::rebind<unsigned char>'
-    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/stl_vector.h:88:21:   required from 'struct std::_Vector_base<unsigned char, zmq::secure_allocator_t<unsigned char> >'
-    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/stl_vector.h:423:11:   required from 'class std::vector<unsigned char, zmq::secure_allocator_t<unsigned char> >'
-    tests/../src/curve_client_tools.hpp:64:76:   required from here
-    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/alloc_traits.h:70:31: error: static assertion failed: allocator_traits<A>::rebind_alloc<A::value_type> must be A
-       70 |                         _Tp>::value,
-          |                               ^~~~~
-
-The change adds trivial `rebind` definition with expected return type
-and satisfies conversion requirements.
-
-Upstream: merged. Commit: bdd471fa17100fe84f64da348951dab3ee4780bb
-Signed-off-by: Sergei Trofimovich <slyich@gmail.com>
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- src/secure_allocator.hpp | 11 +++++++++++
- 1 file changed, 11 insertions(+)
-
-diff --git a/src/secure_allocator.hpp b/src/secure_allocator.hpp
-index e0871dcc99..5e97368911 100644
---- a/src/secure_allocator.hpp
-+++ b/src/secure_allocator.hpp
-@@ -99,6 +99,17 @@ bool operator!= (const secure_allocator_t<T> &, const secure_allocator_t<U> &)
- #else
- template <typename T> struct secure_allocator_t : std::allocator<T>
- {
-+    secure_allocator_t () ZMQ_DEFAULT;
-+
-+    template <class U>
-+    secure_allocator_t (const secure_allocator_t<U> &) ZMQ_NOEXCEPT
-+    {
-+    }
-+
-+    template <class U> struct rebind
-+    {
-+        typedef secure_allocator_t<U> other;
-+    };
- };
- #endif
- }
diff --git a/package/zeromq/zeromq.hash b/package/zeromq/zeromq.hash
index 5085fbca33..e5ac289656 100644
--- a/package/zeromq/zeromq.hash
+++ b/package/zeromq/zeromq.hash
@@ -1,7 +1,6 @@
 # From https://github.com/zeromq/libzmq/releases
-md5  c897d4005a3f0b8276b00b7921412379  zeromq-4.3.4.tar.gz
-sha1  47277a64749049123d1401600e8cfbab10a3ae28  zeromq-4.3.4.tar.gz
+md5  ae933b1e98411fd7cb8309f9502d2737  zeromq-4.3.5.tar.gz
+sha1  bdbf686c8a40ba638e21cf74e34dbb425e108500  zeromq-4.3.5.tar.gz
 # Locally computed
-sha256  c593001a89f5a85dd2ddf564805deb860e02471171b3f204944857336295c3e5  zeromq-4.3.4.tar.gz
-sha256  4fd86507c9b486764343065a9e035222869a27b5789efeb4fd93edc85412d7a3  COPYING
-sha256  83f32abe61ee58ffb1b007412c08415168c052501dbf56d7a47aaaac52b03ef6  COPYING.LESSER
+sha256  6653ef5910f17954861fe72332e68b03ca6e4d9c7160eb3a8de5a5a913bfab43  zeromq-4.3.5.tar.gz
+sha256  1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5  LICENSE
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 452c5f4291..137fad1a66 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-ZEROMQ_VERSION = 4.3.4
+ZEROMQ_VERSION = 4.3.5
 ZEROMQ_SITE = https://github.com/zeromq/libzmq/releases/download/v$(ZEROMQ_VERSION)
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_CONF_OPTS = --disable-Werror --without-documentation
-ZEROMQ_LICENSE = LGPL-3.0+ with exceptions
-ZEROMQ_LICENSE_FILES = COPYING COPYING.LESSER
+ZEROMQ_LICENSE = MPL-2.0
+ZEROMQ_LICENSE_FILES = LICENSE
 ZEROMQ_CPE_ID_VENDOR = zeromq
 ZEROMQ_CPE_ID_PRODUCT = libzmq
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
