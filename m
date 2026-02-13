Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFB6EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7023441F01;
	Fri, 13 Feb 2026 19:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PeWi4YBqi8QK; Fri, 13 Feb 2026 19:36:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ECFC41F02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011407;
	bh=XTg5h5a0ezXX42Y5vb/tJTPbwSZKx02HrnAfvRCcGGQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XIkK3l/LS9jKdrnLvmTW/bVz8qf0XhrrChQ5hyGQmEpSLCCZyluCqa6OETVyTOpgZ
	 cO9PlR+tt9hU0MqT3fJOkCi3N9maZrQ8qFK8wdqFiMtcj8xLUsElkjRQeLkRAGgp4n
	 gP5138doVXgUou0L8Oi9/wnXhK+C5CQ6Ncd/iPdQmzXfeCb5oGlkmbzwslfNIbHv/V
	 PGsMulWtILIwf9d3PLVSHVoGf8L4L8mf/sFVzoZbFqAjVsSO04kD2GZYPA2g2fr6MU
	 31R6iFoNc5alKRUQZrRnkjg9YL/dCpOPeGPCsiSvjbpf6pOFLgOyDKudJqC+1aIojh
	 th2XhDoQ6Z66A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ECFC41F02;
	Fri, 13 Feb 2026 19:36:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0675269
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B9DA41E55
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jt6w9Tl3grQr for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D48A241E29
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D48A241E29
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C99EF83545; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:32:08 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9a9e6df3f402bd86abda6cc67e085357bfbac870
X-Git-Newrev: 1738d5111450c91a85c18f9bb16958311dfdf8b2
X-Patchwork-Hint: ignore
Message-Id: <20260213193529.C99EF83545@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mupdf: update
 release hashes comment
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
Content-Type: multipart/mixed; boundary="===============0220597063178288726=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0220597063178288726==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1738d5111450c91a85c18f9bb16958311dfdf8b2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The old URL now leads to an HTTP 404 not found error.
Update it to the new one which contains the hashes for the current
release as well as older ones.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 6fed872e083c5d5d490977b2bffbd68ebd141f1b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mupdf/mupdf.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mupdf/mupdf.hash b/package/mupdf/mupdf.hash
index 580235eeca..80de6f3b2c 100644
--- a/package/mupdf/mupdf.hash
+++ b/package/mupdf/mupdf.hash
@@ -1,4 +1,4 @@
-# From https://mupdf.com/downloads/index.html:
+# From https://mupdf.com/releases:
 sha1  d79600bccd70ab9d0e8ee19dae4e275f2af95ced  mupdf-1.23.9-source.tar.lz
 
 # Locally computed:

--===============0220597063178288726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0220597063178288726==--
