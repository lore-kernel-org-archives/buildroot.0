Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65D9D0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB2A883829;
	Wed,  7 Jan 2026 18:03:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DtF8bmrG6Whz; Wed,  7 Jan 2026 18:03:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1296F837B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767809019;
	bh=oFkvNHpinN5nOPyET7IQNzMHasyDtJ8fQRy75g9ltqo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NAdDNlUvgq9ANRcjSrZ1mUGq0TWx5sYG23sRPapxV6EawHVDkE8HQhRRZdBYYStB7
	 T7DXc+Eu2helub3h3y6D3moruAhV95+W5C9QwBxTgkHcMz3gxuF1FKSFyLwvRze/bC
	 5oUyvbOQ98lob+7WCySbJ5Xk7QRMtdh7wxfYJIwOW3miVVnsJl21Zyv0Hxff+F5HQw
	 3O9Uolk9rhteb6hIN0B1bo8zU4TH9CCd5HLi4z8RZU+dTDt1D0w0J2dk7+biopnUsU
	 d6+I6PNw9uggClXhIespHEesWiiG+07/137mqinKdxBsGtswBkGTDpo8os4H5gTdLw
	 Ow1fRrILfakeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1296F837B6;
	Wed,  7 Jan 2026 18:03:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1313425B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B04F080F37
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LpGcXCK13_bx for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8285C81421
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8285C81421
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8109D80333; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:07:25 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: bae0e9a4534c569869dd2596874515403c1959b3
X-Git-Newrev: f409cf24525ad3d83437576c3bec5e5b0b00a21d
X-Patchwork-Hint: ignore
Message-Id: <20260107180115.8109D80333@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/dovecot: add CVE
 trailer in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=f409cf24525ad3d83437576c3bec5e5b0b00a21d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit eb0dde58b3f0fa6cd3120343094634fc8a13412d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch b/package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
index 04b8f5392a..99a2b83563 100644
--- a/package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
+++ b/package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
@@ -12,6 +12,7 @@ Fixed by moving mechanisms and username_filter from struct passdb_module
 to struct auth_passdb, which is where they should have been in the first
 place.
 
+CVE: CVE-2022-30550
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  src/auth/auth-request.c |  6 +++---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
