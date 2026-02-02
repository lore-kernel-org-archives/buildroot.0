Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5421E73149
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 08:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82C8E810AD;
	Mon,  2 Feb 2026 08:34:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FeLTKf0asduz; Mon,  2 Feb 2026 08:34:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEDC1810CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770021297;
	bh=DUPl1MlwLakKHTVL5qhvWikDApt2JQ4KZZiMb0ZQMm4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UukottMF8zM3++phi9IH7oM601YTSRFjQMj38cUlNRDYobmliCmz7Pm6IZUfj/uzH
	 iBLgV7F5dkC0NfXN27/33VGuaQurBM5pH1oVLPeX2TXjAyFOvxp+0GiXua4yegjRUs
	 jM3iYohlw23QztV9qM5KvxxTyxmFQlUtl8pWAZZNyd4NVElmvFfVEoWx+rI22JU/bX
	 Uz/aRdE+XeOgApMrl1XwLbNvD3VwzE16UTGluydmxoW+nNA05j5MG1JKZoSjF+jFva
	 LEW5ZkXGDFe8lC5jGAvvfyRooSYG10GeGU+8Ub3Xmi10NFzDcMnkpb0dEBNI6JKe6x
	 930afekFUXIRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEDC1810CC;
	Mon,  2 Feb 2026 08:34:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C1653149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A35F080DB2
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:34:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K9t8VmT5J85M for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 08:34:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2DA980E38
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2DA980E38
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:34:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBD307F963; Mon,  2 Feb 2026 08:34:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 09:28:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc4af8bfa979beb147cdbd7523b5ade26095a0d5
X-Git-Newrev: 0dd7a3017fe37f6add763cf46879ac1fdc089707
X-Patchwork-Hint: ignore
Message-Id: <20260202083451.CBD307F963@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-utils: add 'provides' to
 show-info
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=0dd7a3017fe37f6add763cf46879ac1fdc089707
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the list of virtual packages a show-info entry provides to the
output.

For more information on virtual packages infrastructure see [1]

[1] https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_virtual_packages

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-utils.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 288a202230..211e681e8f 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -201,9 +201,16 @@ define _json-info-pkg-details
 		$(foreach patch, \
 			$(call pkg-patches-list,$(1)), \
 			$(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$(patch)))$(comma) \
-
 		)
 	],
+	$(if $($(1)_PROVIDES), \
+		"provides": [ \
+			$(foreach provide, \
+				$($(1)_PROVIDES), \
+				$(call mk-json-str,$(provide))$(comma) \
+			) \
+		]$(comma) \
+	)
 endef
 
 define _json-info-fs
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
