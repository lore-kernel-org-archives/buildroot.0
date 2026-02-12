Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A62EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84AF66147D;
	Fri, 13 Feb 2026 19:36:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQN8LoSc77E7; Fri, 13 Feb 2026 19:36:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F3F261412
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011370;
	bh=a/PLhPW3iMc76siRfQRqh1q6iDozYwsUqBFeguXGA0k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HxzFzGlH+T4IIo0VLezGemPzW6axfRZ+n81ioy5a40uqKCrTzdIMX1r72WO7pb2UG
	 MjiIePMsKXVuomTUJhFuHGm807WzE9sfPswGkRRQ1YOMg/QqJ1ahmBiq/lLGK/7Yp7
	 Isnka8/hd1zhQ9YYapbiGU4mn3ae7pAFJj8TXgAtLgi/FbTxIw8nT0so4a5F8o84EN
	 6K3wIypnfh++2di0Hhu03KpbvzHrwSOw7kCAbLsquikSzDtFa4V2A2xM8Gbr3gdnn0
	 U8ud2cDENWIRzOr+KMrOVwQJhi4nSrZALSSKOcnpaccYrG5xbqhP6vQvNsutJTE6I9
	 kqFo7tRZIzkdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F3F261412;
	Fri, 13 Feb 2026 19:36:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03FC869
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E171F41E50
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cofgHAhKO-5q for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61CE040C48
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61CE040C48
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 471F586D65; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:10:06 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bee356b41839847b4c7230aaab88af59ab4034d1
X-Git-Newrev: b0ea0d5395c7b59a9625d9c96ee230eb7da08bee
X-Patchwork-Hint: ignore
Message-Id: <20260213193526.471F586D65@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/generate-cyclonedx:
 fix 'project' dependency
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b0ea0d5395c7b59a9625d9c96ee230eb7da08bee
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The definition of the project name & version is stored under the
`metadata:component` CycloneDX property.

Since the introduction of the `generate-cyclonedx` script [1] a
'buildroot' dependency entry that depends on every components has been
part of the generated SBOM.
Tools such as 'DependencyTrack' relies on such entry to create graph of
the entire project.

With the commit [2] that introduced the option to pass a custom project
name and version, this dependency reference was not updated to match the
custom 'bom-ref'.

This patch fixes the reference to match the custom project name.

[1] dbab39e2d9 support/scripts/generate-cyclonedx.py: add script to generate CycloneDX-style SBOM
[2] 9cbbc47762 utils/generate-cyclonedx: add project name and version options

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 189a983c7d8f1d24310bd9e142dbc950f86863b8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index a103b7b707..e864edf181 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -428,7 +428,7 @@ def main():
             cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
         ],
         "dependencies": [
-            cyclonedx_dependency("buildroot", list(filtered_show_info_dict)),
+            cyclonedx_dependency(args.project_name, list(filtered_show_info_dict)),
             *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref, show_info_dict, args.virtual))
               for ref in filtered_show_info_dict],
         ],
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
