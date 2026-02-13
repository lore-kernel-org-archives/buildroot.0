Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7FCEF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D38A284577;
	Fri, 13 Feb 2026 19:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C5yoKNRiOJXz; Fri, 13 Feb 2026 19:40:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D77A484939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011608;
	bh=EOjFcqgoK2Hf9YrbJQgYYlyz7jPqjEz2g/7WQLV61Oo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ojxlkTSbdF70X5IeRvLkXERDt7hwDKWXqRGwNTpdg42KXdSRjS0mP3I1SFVqGIAAL
	 SjdQsZIxAQUue4+YgtkH3NgLUTvxRqQClkLZ5BdkxJslRn5nXy+J7eu46rZsC14ZTi
	 /llUtBynnJyr0aMpNWIuAVHE2G2gdmRTh4CwqWMTeUQLTAhsONwoXTtOHfpdRoNmaD
	 acy7ArC05cXYvvaMZrFKxrgOMqa5w/znXso9GVLp9vuWST596AvBZ3eWDsA91YqPkh
	 Zj5kaDMMxo2nOEh2/VPRSwdsMUINu8tTRsYXwgtqYnc1axNqGCi48HnJkV0Y15gZk+
	 c0dWVBtehd0UA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D77A484939;
	Fri, 13 Feb 2026 19:40:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D3DEEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AFA8412FA
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YPhYg_QIi1BP for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9FCB413EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9FCB413EE
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F31485DA7; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:33:43 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 95ba97009cd0b66e5b1b552d8a0980012cea58e4
X-Git-Newrev: f73755663d5a9a7b63bb0c0b42fb472eb01bf07a
X-Patchwork-Hint: ignore
Message-Id: <20260213193705.9F31485DA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/strongswan: fix
 patch header
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f73755663d5a9a7b63bb0c0b42fb472eb01bf07a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Commit [1] introduced a patch to fix CVE-2025-62291. Since [2] the
security patches neeed to reference the vulnerability with the `CVE: `
trailer in the patch header.

[1] b009935e27 package/strongswan: add patch to fix CVE-2025-62291
[2] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit 766a6e5c0ba77fbcb7c7141cb4f66be2d20dc7e7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/strongswan/0001-eap_mschapv2_failure_request_len.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/strongswan/0001-eap_mschapv2_failure_request_len.patch b/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
index 8442cc7816..7442c123c4 100644
--- a/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
+++ b/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
@@ -21,7 +21,7 @@ Ubuntu), the compiler will use __memcpy_chk(), which prevents that buffer
 overflow and causes the daemon to get aborted immediately instead.
 
 Fixes: f98cdf7a4765 ("adding plugin for EAP-MS-CHAPv2")
-Fixes: CVE-2025-62291
+CVE: CVE-2025-62291
 Upstream: https://github.com/strongswan/strongswan/commit/c687ada6a6f68913651e355fd09f906893096b32
 Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
