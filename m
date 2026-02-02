Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF930E73145
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 08:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8005880DB2;
	Mon,  2 Feb 2026 08:34:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id syL7fnnBpkUS; Mon,  2 Feb 2026 08:34:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0C4280E38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770021294;
	bh=CDxpOE2hKt3xDzvdsLvDztwCb42VED/97J5YWrqVxKM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F32KmDxA1zAGE6aE7XWgobhbnAde5Xib9JakhCVS92740Fdz63rMvHWhNtO76VSHS
	 OpIDWy5cQuVIP7UEKbIaVdWQuS2FsoDcFoRy8uUVavvodynahtxxSx+EVKbosh31D9
	 KN2nbLZnYz9ODYfd8cN1VH9gQAs2REtvrv6akKIyFhcW4WxfzlualW2Gce+s4zC6Ko
	 Vlw+xR3Drp+k433R8q/Y5kIyazcD+Hd/9Pq9PmMVh8HJtLiJQjHlNG7dAdgURS2cmM
	 M/nd1uXNm2NoUV5Litg11zjmMYkNcWN1m4yFL9UG6KfDk76JjNOMuzqM1j+awXMQhz
	 NsFhvlqhEWz3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0C4280E38;
	Mon,  2 Feb 2026 08:34:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A2BAF149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 917C580E3B
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:34:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w-3jqg6SkQPD for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 08:34:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDA4680DB2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDA4680DB2
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:34:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD3238625A; Mon,  2 Feb 2026 08:34:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 09:26:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 191367ad120a564949001e0bf91425ad2cbed107
X-Git-Newrev: 189a983c7d8f1d24310bd9e142dbc950f86863b8
X-Patchwork-Hint: ignore
Message-Id: <20260202083451.AD3238625A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/generate-cyclonedx: fix 'project'
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=189a983c7d8f1d24310bd9e142dbc950f86863b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
