Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857DFE92724
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 14:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F63B403B9;
	Mon, 29 Dec 2025 14:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BMdbHXKvfN8j; Mon, 29 Dec 2025 14:07:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8229E4040A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767017266;
	bh=MSZqfiWdd8jPvbTO8aDJl/5GIt7Cch9m/Hac6I8QnUI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rrLMJo0jwK4aD7rDHP4PwdA6eGxfTcIF7OXXYfGVkdUM/g5mwjnnfB4maKPnecOml
	 cjABd3tjRBViWgyuhp81CME3CCA13y32xVawqb87/PEUd9pFTPfxrWlOnZsdB96doB
	 vwXUyG8opR+piNDnAFRnPcHnnm9mbhbn/wN8KRkxWiP7OMyW3GjXXFoEZLByrx7R9k
	 6q4UvtI5aLMywj8ztsgwTvnPaM6ZpkiSbifv8/8qpyGMtUFjADY3wh5F+JYk8/O1LO
	 ZtpxoBsIui8rVzC+IvoE4uzUsTUqKRxx+Atm1u6GyfAfafguqS2LINGsAgZaiApye9
	 9ZdVeBIvUZAKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8229E4040A;
	Mon, 29 Dec 2025 14:07:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7117F1E1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 622F6405B3
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HceuSnT5Z0Fs for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 831A840259
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 831A840259
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FC9987B49; Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 15:06:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d0e4db4c458ebe202b32f52ca96ca2e3386a1b6
X-Git-Newrev: 6244163284a05ae38a819abcb7b65e03b04102dd
X-Patchwork-Hint: ignore
Message-Id: <20251229140743.7FC9987B49@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11vnc: add CVE trailer in patch
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6244163284a05ae38a819abcb7b65e03b04102dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-scan-limit-access-to-shared-memory-segments-to-curre.patch      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch b/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
index 05977375d8..015a8c4c41 100644
--- a/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
+++ b/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
@@ -3,6 +3,7 @@ From: =?UTF-8?q?Gu=C3=A9nal=20DAVALAN?= <guenal.davalan@uca.fr>
 Date: Wed, 18 Nov 2020 08:40:45 +0100
 Subject: [PATCH] scan: limit access to shared memory segments to current user
 
+CVE: CVE-2020-29074
 Upstream: https://github.com/LibVNC/x11vnc/commit/69eeb9f7baa14ca03b16c9de821f9876def7a36a
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
