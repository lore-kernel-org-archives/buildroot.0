Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A32C48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F71D41BD9;
	Thu, 29 Feb 2024 15:59:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hs3wru9Qp2Jr; Thu, 29 Feb 2024 15:59:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEB5141C0F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEB5141C0F;
	Thu, 29 Feb 2024 15:59:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E38611BF25B
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC0C360F40
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:50:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q8tqFzgIEdD1 for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:50:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DFAE60F35
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DFAE60F35
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:50:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1891A87DCF; Thu, 29 Feb 2024 15:50:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 16:41:55 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 34b7f3ab9acd18b94d9f830c785d710f728154c2
X-Git-Newrev: 62279f8592cfc4d67771e3df2b5e0c8e1a5b37f9
X-Patchwork-Hint: ignore
Message-Id: <20240229155011.1891A87DCF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/pkg-utils: add
 missing licensing data to show-info
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

commit: https://git.buildroot.net/buildroot/commit/?id=62279f8592cfc4d67771e3df2b5e0c8e1a5b37f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

While the list of licenses is present in the show-info output, the list
of license files and the redistributable status were missing. Add them.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5647d5c1900bde13cedd36efd09404ea5763c0fb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-utils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 059e86ae0a..723bbe4e24 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -157,6 +157,10 @@ endef
 define _json-info-pkg-details
 	"version": $(call mk-json-str,$($(1)_DL_VERSION)),
 	"licenses": $(call mk-json-str,$($(1)_LICENSE)),
+	"license_files": [
+		$(foreach f, $($(1)_LICENSE_FILES),$(call mk-json-str,$(f))$(comma))
+	],
+	"redistributable": $(if $(filter NO,$($(1)_REDISTRIBUTE)),false,true),
 	"dl_dir": $(call mk-json-str,$($(1)_DL_SUBDIR)),
 	"downloads": [
 	$(foreach dl,$(sort $($(1)_ALL_DOWNLOADS)),
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
