Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E59CE66882
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 20:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2641A811D9;
	Fri, 19 Dec 2025 20:51:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vPFK20DAGKWF; Fri, 19 Dec 2025 20:51:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56FC5811E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766177486;
	bh=tUSDoaZNOcpQmwS8VHAyrgBbn9SLzWJHGCwLDr4eMsY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pK57oIGdJCqMAyyw0M8ymi5mqgfB3xw0esHgMIsqDWSL1viNwZ8T2Cl+aDdpd4t7P
	 ANRNG7+czjOs+elgVzxNlltVkX6QlNpFRwa0vtRZJmTgnBD+eOvF/Quv48djMRKB8E
	 DRFaQBJc8b6Zbfdl7S2JUAhuOCT9sGs1NhERbwkudDvg5TLPKJHYXr5CQcTLcx3MxN
	 BjVMGU0Q1vh582HnVyXKMt9b4kyhlPPUP0WBF1rH4a+9nBotuHiNpYugZ3DC/3tS0o
	 SzH+fyaXlwen6/Ck+fI+MBRhaDCdT+xl+aksJ1P+CMoroYOjopQrmlQn6IsEZlOGul
	 ATMr2OJGXN2qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56FC5811E2;
	Fri, 19 Dec 2025 20:51:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 39714293
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 20:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 203D660653
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 20:51:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7vF3rBDdf5tc for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 20:51:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E6AB6064C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E6AB6064C
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 20:51:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E3E586A69; Fri, 19 Dec 2025 20:51:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 19 Dec 2025 21:49:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11d6d10debc81a64de901ec0217b8103c0f366b0
X-Git-Newrev: 78d0a586a8af51385df8f749549e5c9ab3be7227
X-Patchwork-Hint: ignore
Message-Id: <20251219205123.5E3E586A69@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gpiod: fix md5 hash
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=78d0a586a8af51385df8f749549e5c9ab3be7227
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit b243b77ebe5eedf8fbc683d5539d9bf386da4420 added this
package including a hash file containing a typo of the tarball filename
for the md5 hash. Updated comment as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-gpiod/python-gpiod.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-gpiod/python-gpiod.hash b/package/python-gpiod/python-gpiod.hash
index bbcc7181ff..dfaafd4d4c 100644
--- a/package/python-gpiod/python-gpiod.hash
+++ b/package/python-gpiod/python-gpiod.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gpiod/json
-md5  62cf044aa3214d0ebee6aef78db2aa52  gpiod-2.4.0.tar.g
+md5  62cf044aa3214d0ebee6aef78db2aa52  gpiod-2.4.0.tar.gz
 sha256  9243a1a59d084ec749d1df4a1e2f238ffb9d94515b0d9f5335460175143c3aa1  gpiod-2.4.0.tar.gz
-# Locally computed
+# Locally computed sha256 checksums
 sha256  a2b24e2158144b22a77a6a404fc5a05911612c5b99d7ab6d0e2addcaeb7514a3  pyproject.toml
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
