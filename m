Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885ECE784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 21:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 507D8405DA;
	Sun, 28 Dec 2025 21:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id peG4qWNAGKgl; Sun, 28 Dec 2025 21:00:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A417406BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766955633;
	bh=jgbtzA5W4RuIDelCxT7sLrJB6UvzU1XQliVCwJb0pok=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fUcNewFKb0LDx7m+iurPLebwkWfxhSP2VsXpytwRB7oJUzEX00rC/DdwkrkF72qVF
	 c+bBpKQzyGYaZjhkgouUS2bBbv2IYDwIO9TsdtIElKqezKgy8lHR4qFrrd8H2gNyJu
	 L0sC5Fpo8Eq/qOf84KkJWsUB9Gv2y3ZPpvfyvR130IHKMDlFj+DKbsmGGWmAZjzJOi
	 TOTXAWoARALkOzJSmE5FPz1EZ9D1k0Ikqh+yC8ehAPe6xe9guGS1LEZIosOekYh6Rf
	 tAAg+uH+0YWltI+h/R6lA/WuJnHn0D2wlTl2cr8AzyvC959XGQoIkiYXO4jwE4nEya
	 O8kvLsT1Zxv3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A417406BC;
	Sun, 28 Dec 2025 21:00:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A1F76D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3900C81448
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUvQcQq5BehF for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82D1E8144A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82D1E8144A
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74B14811B3; Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 22:00:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 04d80d13ec7f84e8074ad4f886da06a8e0ca0e86
X-Git-Newrev: 51a3cb5db4b4c1be51e7572028555b5a53055752
X-Patchwork-Hint: ignore
Message-Id: <20251228210024.74B14811B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jbig2dec: add CVE trailer in patch
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6406049908608618408=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6406049908608618408==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=51a3cb5db4b4c1be51e7572028555b5a53055752
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Bug-705041-jbig2dec-Avoid-uninitialized-allocator-in.patch      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jbig2dec/0001-Bug-705041-jbig2dec-Avoid-uninitialized-allocator-in.patch b/package/jbig2dec/0001-Bug-705041-jbig2dec-Avoid-uninitialized-allocator-in.patch
index 8331d5f2a4..dd96c45ebd 100644
--- a/package/jbig2dec/0001-Bug-705041-jbig2dec-Avoid-uninitialized-allocator-in.patch
+++ b/package/jbig2dec/0001-Bug-705041-jbig2dec-Avoid-uninitialized-allocator-in.patch
@@ -4,6 +4,7 @@ Date: Sun, 5 Nov 2023 12:21:52 +0100
 Subject: [PATCH] Bug 705041: jbig2dec: Avoid uninitialized allocator in
  command-line tool.
 
+CVE: CVE-2023-46361
 Upstream: https://github.com/ArtifexSoftware/jbig2dec/commit/ee53a7e4bc7819d32e8c0b2057885bcc97586bf3
 Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
 ---

--===============6406049908608618408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6406049908608618408==--
