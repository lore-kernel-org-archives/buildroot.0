Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8F8C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 14:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33BED81381;
	Sat,  9 Apr 2022 14:03:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JDc_nMKfu8L0; Sat,  9 Apr 2022 14:03:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36F2E8135D;
	Sat,  9 Apr 2022 14:03:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8DB841BF592
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 14:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D05E41BB7
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 14:03:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kf0fbCULGdt8 for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 14:03:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BE014198B
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 14:03:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3503B8368C; Sat,  9 Apr 2022 13:53:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Apr 2022 16:02:26 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 20246952dda1bd81792bf8cc8cb60a87cd7dbe64
X-Git-Newrev: c5bcb7a201b9b4ea5f7e6816061485cb0ffce9c9
X-Patchwork-Hint: ignore
Message-Id: <20220409135355.3503B8368C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 package/python-weasyprint: needs C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=c5bcb7a201b9b4ea5f7e6816061485cb0ffce9c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit b33e39e3ea5078cc80d9658e8af63049189bd475 forgot to add C++
dependency from python-brotli

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit fef53b2e53c0e1ee958702f7a7f2cb097d54e74f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-weasyprint/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-weasyprint/Config.in b/package/python-weasyprint/Config.in
index 4a7e5a513d..7fe99c3951 100644
--- a/package/python-weasyprint/Config.in
+++ b/package/python-weasyprint/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_WEASYPRINT
 	bool "python-weasyprint"
+	depends on BR2_INSTALL_LIBSTDCPP # python-brotli
 	select BR2_PACKAGE_PYTHON_BROTLI # runtime
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CSSSELECT2 # runtime
@@ -14,3 +15,6 @@ config BR2_PACKAGE_PYTHON_WEASYPRINT
 	  The Awesome Document Factory.
 
 	  https://www.courtbouillon.org/weasyprint
+
+comment "python-weasyprint needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
