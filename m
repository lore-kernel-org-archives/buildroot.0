Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C78C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 12:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE1DF817F2;
	Sun, 13 Feb 2022 12:07:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hOT1lOv4rTt2; Sun, 13 Feb 2022 12:07:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE6E6817B5;
	Sun, 13 Feb 2022 12:07:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A3DA1BF46D
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 12:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1849860A9C
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 12:05:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id peh7jcqTMP4b for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 12:05:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44D896072A
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 12:05:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 22A1482745; Sun, 13 Feb 2022 11:57:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 13:05:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af54104cbb38a2d8843f1a55e3f4283cc9a5aca9
X-Git-Newrev: b9eca021594470341bec2876edc0a27251f3f9b2
X-Patchwork-Hint: ignore
Message-Id: <20220213115753.22A1482745@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sconeserver: fix build with icu
 and libxml2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9eca021594470341bec2876edc0a27251f3f9b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since addition of icu support in
libxml2 through commit 49d7c85421e87d9d762be9352805cb47a2f0bbeb:

In file included from /home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/include/unicode/ptypes.h:52:0,
                 from /home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/include/unicode/umachine.h:46,
                 from /home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/include/unicode/utypes.h:38,
                 from /home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/include/unicode/ucnv_err.h:88,
                 from /home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/include/unicode/ucnv.h:51,
                 from /home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/bin/../../usr/include/libxml2/libxml/encoding.h:31,
                 from /home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/bin/../../usr/include/libxml2/libxml/parser.h:812,
                 from conftest.cpp:61:
/home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/include/unicode/localpointer.h:224:41: error: 'noexcept' does not name a type
     LocalPointer(LocalPointer<T> &&src) U_NOEXCEPT : LocalPointerBase<T>(src.ptr) {
                                         ^
/home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/include/unicode/localpointer.h:224:41: note: C++11 'noexcept' only available with -std=c++11 or -std=gnu++11

Fixes:
 - http://autobuild.buildroot.org/results/be043792e6e5501631517881b10096291a654364

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/sconeserver/sconeserver.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 17407c29f5..2b28f8015c 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -29,6 +29,8 @@ SCONESERVER_CONF_OPTS += \
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 SCONESERVER_CONF_OPTS += \
 	--with-xml2-config="$(STAGING_DIR)/usr/bin/xml2-config"
+# Needed to fix build failure when icu is enabled in libxml2
+SCONESERVER_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
