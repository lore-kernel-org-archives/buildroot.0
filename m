Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5FAEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE3CA84569;
	Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jlFeHL11tPS3; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A0A88456B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011329;
	bh=Lb7wBX9eemgHGDEXYt6Sb9HrQS4sCI84YHkH0IsFUIU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JowUOuNqOetm06k2zhUXJ6BuzH/wdK4j0D11aDcvkBE4yEcPNKHlc0wkv/38Nwbx+
	 tbEVHIYyS9iTHhXWHwWtMTB8qsBhpqnQHm2mOnCdX+HozJkWPXoyMjRgUavfT/2M+b
	 qX3/mRGb5v737unQZ88OIkVZMCH5DUzqcWY0Szaa/QX+ozQclC5+8RcNQ928MnR3vb
	 x/znw52uDSDxApHbxH9sf39FTC+ld/cZPzkMIxzqPQrSQ4zsqOn5bpGDwJvw5eIxm1
	 Yfc7KuJlREXWPf+rHmKbmoUOl+F2/zvQw9vP9vhWw+7a/deqqGyOvNHjGsTJVzaZAo
	 vCCh+CAQdOr0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A0A88456B;
	Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 634B269
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51B9284535
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SYkc7R1kIW2u for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 711B1844BF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 711B1844BF
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 634B7811EA; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:10:43 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8e7e67e1e30415eecaf016759e3abdb7e0abc67f
X-Git-Newrev: 411cc61bd5046b58454d0173285a178ce2664907
X-Patchwork-Hint: ignore
Message-Id: <20260213193526.634B7811EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pkg-utils: add
 'provides' to show-info
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/411cc61bd5046b58454d0173285a178ce2664907
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Add the list of virtual packages a show-info entry provides to the
output.

For more information on virtual packages infrastructure see [1]

[1] https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_virtual_packages

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0dd7a3017fe37f6add763cf46879ac1fdc089707)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
