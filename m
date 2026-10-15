Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CF7CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D0DE61476;
	Fri, 16 Oct 2026 13:14:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OdBxcepfSehR; Fri, 16 Oct 2026 13:14:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E8AED61470
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156456;
	b=QZW5L9K1UJ+Ae4g84gaMp3IsLuKj6Rcfk9SK0Z3hSuQdBvZFdzNAu37jLushplJMaIn9
	 q+AxV+boqeqxrnabmfGkdU2excqm80CrnKvTlxlHjuNtNqYDqgrLMRrai5R5PsfWsLsCw
	 FpnXQ4unxpTUslnlZg5zyHWvr5uapXia9tvMYyLMjMVkZQpXgzr373GUHGEWGj4VPLS9D
	 hlynMXTVM6VodpLNsZsiy5iHUFNJFF3z/HkCDXF0DUD/JJqZWsD8UrtY943X1ChwVGZcC
	 RFpS4SDX44nPv11DPyQDEo873dlRSJgxubcHUvhWOfQl93+Tl5s71pbwKJyem0iMKaw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156456;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=6xqIO8UUFySrHHiWGlSzc3zfKAQK7OG/JYqUmu2TZSA=;
	b=NDuay5cT9n/FgeyVyl0pW9mFjGPmQi6WNxRxWBIZdgxixnHaYjxauA2GXvw7u6SHMsg6
	 SsDYyO5DjKnaZnVj8V3s/Km5EkUQ0JX1aYbHBQoXRtMIBlRveP8SUZag14CQw+b+Rnvno
	 958cmjoVtmMP/jU28//3vRLW5BbgVe2XID4+l9HFtRCzE/EsrB+N6eT744st+NPVB1IUe
	 nPxqryDG5sQR7uee9LWzcmeqzawguVogEmGp3VCNEGwZj55S7ctKWttN1wKgAt8wTTKPR
	 k0wIilzQILnw2Ud+lM+DKRB7ypOF5mH9U/bx5C7Kc8eJ6rJvBvWvqzxSQ8RWvrelGfA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156456;
	bh=6xqIO8UUFySrHHiWGlSzc3zfKAQK7OG/JYqUmu2TZSA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mGlk/aTvfoNW2wqKWgLfQ14tF0cYV5jadl5QuDKAqQ0YmFV6dBCZO9ugEjP13vyP/
	 KovBgtBilNzh1fpVcQTeCPClT+gN38CS2S4lLBqqAoDJvD5u0hntsLyj+6MYf/j4NR
	 Y5aJ8nWzDAuI2WqRvBhqlYbfYZ1TPvWtSh+caeUH9+qRI7JaABe3Q334ydWCGEbwMs
	 ZLAEKrUw68p0GKzfFVcsdMXjMTG5/XALfoZ8Avploz37tiiXZJlE1D/w5WcG/Gl4ox
	 gxjdcCvFqpmZqcOaMuXVXezkk9pDvCJYQN7xMZbch7/82brKNE5Fep+ULNoE4rUaoL
	 P91+E1mqo5PbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8AED61470;
	Fri, 16 Oct 2026 13:14:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DFE3920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FE5260F25
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jqfefvGsfUYd for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8C19F60F60
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156194;
 b=hkraEYR+KozpazSkkXj6gDykIGkpKpw1+Wttk7CKe1x+hgjxN/cNJUDqdaZNv2X1bW7o
 g0S3v0oXbtQ+HkQddPLuRTf25r/ZrYQSLanXXd+hRsmqyvBesw8GkBMQ+fzgRwQdzkaYO
 qpeh5CD4QyJSSTItknq4GOxJJ0tUGpmXojki3hTbPaasgCoCEgHADjR46yhOzTwjmQcC/
 +9FhRmn++5KdPet0OfXR26KwS4cWFlhAPdGAaJ8n7X1Ys+nD+lpdgeQds12/fDEMJ6WM4
 nlbHylToIR/h3WpApynu+P36HNYbthZsGSMRQKdFidrLPwGnkBzDiMEcivZO8A/DQhA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156194;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ENkebtL369vYLLxPfeFcvmyg3iOJaeRmUhslPVmdQc0=;
 b=h3BFizClG36bNBV85hMcLjRaWdheyXQs1DTnDGmkJIz/3ZIa8VtCc+x2pP1kAd31itgx
 jeLjQkUoKcFJdj5hZuNd8QO1J56p+yn25q57k//Ar+jDglxHIUILK4gggtbFBRgBM5PpG
 R9XwUSV9zaiwyUG0WsRnLpj/Ei+dgDuSw1Ebwzo9hDG7tggaea9Y7FKaB+LZV60akMyx7
 25gc8OenzZoquqw0SYH08dTFQuEnmHVbacfgwL4HiiQTtCWqSULHfSkVbE+dOiqN9HaIg
 O+836cTCelCDmIwVfm9uDoDDyWQQZwsiv+pdH2SCxpE1/gOUOwTHeDfqwS5pw/78NEw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C19F60F60
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70C1F960D9; Fri, 16 Oct 2026 13:08:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:46:36 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: bb5e615593297c0ad2e6f7d82d10e96878c01324
X-Git-Newrev: 5d484774ab8ff987131eda0c5b114ea1ab51060f
X-Patchwork-Hint: ignore
Message-Id: <20261016130833.70C1F960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] utils/generate-cyclonedx:
 use argparse defaults help formatter
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7583137242614601287=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7583137242614601287==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5d484774ab8ff987131eda0c5b114ea1ab51060f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The argparse library documentation [1] suggest the usage of
'ArgumentDefaultsHelpFormatter' in the ArgumentParser declaration to
show the default value of every arguments.

Use this to avoid declaring this value ourself which possibly gets
outdated with the actual default value.

Note that this also adds an unnecessary default: FALSE to the --virtual
option, but that's a minor annoyance.

[1] https://docs.python.org/3/library/argparse.html#argparse.ArgumentDefaultsHelpFormatter

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Suggested-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 358f22680949692a4fe503e57802f3043f8a3169)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 utils/generate-cyclonedx | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 98009cef98..c292ef7840 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -529,23 +529,24 @@ def br2_root_deps(show_info_dict, virtual=False) -> list:
 
 def main():
     parser = argparse.ArgumentParser(
-            description='''Create a CycloneDX SBoM for the Buildroot configuration.
-                Example usage: make show-info | utils/generate-cyclonedx > sbom.json
-            '''
-        )
+        description='''Create a CycloneDX SBoM for the Buildroot configuration.
+            Example usage: make show-info | utils/generate-cyclonedx > sbom.json
+        ''',
+        formatter_class=argparse.ArgumentDefaultsHelpFormatter
+    )
     parser.add_argument("-i", "--in-file", nargs="?", type=argparse.FileType("r"),
                         default=(None if sys.stdin.isatty() else sys.stdin))
     parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
                         default=sys.stdout)
-    parser.add_argument("--virtual", default=False, action='store_true',
+    parser.add_argument("--virtual", action='store_true',
                         help="This option includes virtual packages to the CycloneDX output")
     parser.add_argument("--project-name", type=str, default="buildroot",
-                        help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
+                        help="Specify the project name to use in the SBOM metadata")
     parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
-                        help="Specify the project version to use in the SBOM metadata (default: builroot version)")
+                        help="Specify the project version to use in the SBOM metadata")
     parser.add_argument("--cdx-version", type=str, default=DEFAULT_CYCLONEDX_VERSION,
                         choices=["1.6", "1.6.1", "1.6.2", "1.7", "1.7.1"],
-                        help=f"Set CycloneDX version (default: {DEFAULT_CYCLONEDX_VERSION})")
+                        help="Set CycloneDX version")
 
     args = parser.parse_args()
 

--===============7583137242614601287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7583137242614601287==--
