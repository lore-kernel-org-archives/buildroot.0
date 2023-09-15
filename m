Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCA9CD37AA
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 21:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15D7D419D7;
	Fri, 15 Sep 2023 21:31:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15D7D419D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qBnAiuOZNIh1; Fri, 15 Sep 2023 21:31:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29B1E403AE;
	Fri, 15 Sep 2023 21:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29B1E403AE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 91AFD1BF29D
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7605A419AF
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7605A419AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TF4eKarqHQ8H for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 21:31:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 630CF40545
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 21:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 630CF40545
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B4548706C; Fri, 15 Sep 2023 21:31:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 23:27:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a85e0797f67a21140eab5f667156c816ff4a6ef
X-Git-Newrev: 9434a379dc852dc7b35430089e5a4b9a2cc80a0f
X-Patchwork-Hint: ignore
Message-Id: <20230915213117.4B4548706C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boost: bump to version 1.83.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9434a379dc852dc7b35430089e5a4b9a2cc80a0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- add upstream patch for Unordered available on the Release Page.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/boost/0001-unordered-fix-copy-assign.patch | 22 ++++++++++++++++++++++
 package/boost/boost.hash                           |  4 ++--
 package/boost/boost.mk                             |  2 +-
 3 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/package/boost/0001-unordered-fix-copy-assign.patch b/package/boost/0001-unordered-fix-copy-assign.patch
new file mode 100644
index 0000000000..670552535a
--- /dev/null
+++ b/package/boost/0001-unordered-fix-copy-assign.patch
@@ -0,0 +1,22 @@
+Upstream Patch for Unordered
+
+Prevent erroneous copying of groups data, update max load to properly propagate
+
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
+Upstream: https://github.com/boostorg/unordered/commit/067884a4e213352e7c81c441f1453c54735c39f3
+diff --git a/include/boost/unordered/detail/foa/core.hpp b/include/boost/unordered/detail/foa/core.hpp
+index 239d05d3..7ae9f2c8 100644
+--- a/boost/unordered/detail/foa/core.hpp
++++ b/boost/unordered/detail/foa/core.hpp
+@@ -1870,9 +1870,10 @@ private:
+ 
+   void fast_copy_elements_from(const table_core& x)
+   {
+-    if(arrays.elements){
++    if(arrays.elements&&x.arrays.elements){
+       copy_elements_array_from(x);
+       copy_groups_array_from(x);
++      size_ctrl.ml=std::size_t(x.size_ctrl.ml);
+       size_ctrl.size=std::size_t(x.size_ctrl.size);
+     }
+   }
diff --git a/package/boost/boost.hash b/package/boost/boost.hash
index 36de2b9b06..14403758ac 100644
--- a/package/boost/boost.hash
+++ b/package/boost/boost.hash
@@ -1,5 +1,5 @@
-# From https://www.boost.org/users/history/version_1_82_0.html
-sha256  a6e1ab9b0860e6a2881dd7b21fe9f737a095e5f33a3a874afc6a345228597ee6  boost_1_82_0.tar.bz2
+# From https://www.boost.org/users/history/version_1_83_0.html
+sha256  6478edfe2f3305127cffe8caf73ea0176c53769f4bf1585be237eb30798c3b8e  boost_1_83_0.tar.bz2
 
 # Locally computed
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index d432ab48cc..9b1baec5bf 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.82.0
+BOOST_VERSION = 1.83.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = https://boostorg.jfrog.io/artifactory/main/release/$(BOOST_VERSION)/source
 BOOST_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
