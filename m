Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723EF606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 08:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hRj0UuDC
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBEE660639;
	Sun, 25 Oct 2026 08:56:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wqdSirq7U5GM; Sun, 25 Oct 2026 08:56:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 428806061B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792918591;
	b=pYUvvuRrjPvfOe6SGD+NgDDZPA5LT5X6wYejaiKLf52JslZJB8lNpeT2RMB5ySFBOFdl
	 +Inz49i7GuWkBZNHISC/tRHanoSHBVz0xtQ/iKJipwvNAf7I6Mmmb90K5qbGuhTChrHMr
	 VgFBPjWj6VkbLVvM9qlRTLYcYEunQmxZ9uq0keSzvKPHuFqw7eEr93N15C9xdGBGg9jM4
	 D92HcpYW0PMra+QqwslrPB6KFfeMUO/d3LmGCIctQaRB3z1tTDtJZeSRGLKHJzRYgQQHl
	 DCrSvDS2p4h+5mgbEOYF2Mne8B6P+6clDTwS4gElm5FikFtj1Day/lJS/eZ6bAXM29Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792918591;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XU5hVezrELkCTpVn04ZxEhz/6keUiK6NRRcm9lDaiWM=;
	b=DA1BofoUbS2YOMwTmxR2RPAsnWX04klG0wXFiSTfQLQk4M6U9O3BQ0EnMiJ48IqBxW30
	 nec5Ey2a/f+KF4zuPr5mfvlrAyPIpbE/IMahRd5Heaf95lQl83PVHBwDEP6T07zhf4MXx
	 xX3/plKYAYYTZTly7dX/4Wv24msCGDI2uk7TwKRqEKScRGsQuDcpGwUg7aZ6jIWWbTSMK
	 S4/SQTV+UOuXuL/rEUK4vmyn+CghiEBcz5cGX5/YrpWL7yQ/F/jkKOkIEHkPh6XhQrG2z
	 etGG2HCMdNdi0W6s5ERf+7OKK8P+7cZ7pY5QQyiOuUxNlNOp7NtI/5PdPP2gE8cXXKA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792918591;
	bh=XU5hVezrELkCTpVn04ZxEhz/6keUiK6NRRcm9lDaiWM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hRj0UuDC719KLz2K2SPcySkCLJi6lw8jS9J6KPz+YoBFuNdcg/KUR9IgwG3kwpnHo
	 zd7VdqOXJ6IxWOq8l3eO93KYwk+dd9kNAZanQBd4iQn8UyZNr/svlUCw15FHkYs8aS
	 KAVwvv6mabOCyCt+plIy22jlJX//kiPkdTcwJkQvtJLPz41ut5zJBjt0dTmwh3cMBA
	 +25ROedJix64duMALQjv/ls7XpeyIiT1f9ngAgT0XbSyppLEhuwOvlX64cWH8pP6om
	 iZSRiBB5oepSlVJ2mXCrdMS81t10Oa6Zy8EklGkvc/899sQWyoNfXlgW3s432qgShX
	 I6mZ8qMKNlH0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 428806061B;
	Sun, 25 Oct 2026 08:56:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6F0879F
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 08:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC940401FB
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 08:56:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u4q8VZrWJRZU for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 08:56:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B1A38401EB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792918588;
 b=OQzvZAKzYv+TY/2Hn/eZ+6JVQvnrhTUCtZgK7SU/Tio/irxcWNoLH5SlcI/2r/+iyvQu
 1SdLlpxP8ufZxlHf5DVYV8HgBKHYyPteSa6j0Y6jUuP6Jw/S3BJH122ejNf3RgVUJHRRf
 xtnRAk4CMCY1A6u11aTtmKeVAdg6HX/cwL8/TKvvDonxXzUpQt53yGRct0LYYhYuGav3X
 shyI/rC8PsY9N7xXcZFFHYlyD8Mrq/qHkr5z1MHBccwIn+Nc+nqKCQvUxf9KQYA49fvbJ
 GVkPMyn22ruqoOEN7tB7GUusCA8TKiIT78G0BpIDe6Q+PIlw+6CS+Lqk1v16r4yICUQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792918588;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=eQBIpnrrx4DV8BbWryRzsAWqGyecx3ulzQYHwrCxhMc=;
 b=Kltwb+0dn7/CPtzlYv5LH7gjvH6eMl+BpxfOtBw/wIOyQ2VZH+hFau3HI1RdJKu0fFae
 z5NRB2ZuaQF+mZwht6GSP1sFaHpCQsXgdnpgn45QzhEnBMDKtArHiurYyUNx12EKUMXv1
 A7WQB8XTs2d/fiv1LB1O2TlF1dJTp5swq2OTOowpbdkY1NC/6MJVDoAqHC2egMYMp+PNp
 MfuhjQpuoS+Uh72MH4YecxRKlIqdDbUEB+1Cr8DzxB4lcV1QElnp586aeYgp97W8HOxkC
 563INO+MNZuLL5FWTv0RBgemvNCZ2ePMLy6oNtVh0rv3XZEtwowYlYFXjNRMt/49Q6A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1A38401EB
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 08:56:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F1479CDE1; Sun, 25 Oct 2026 08:55:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 09:52:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a416a8ef097250ad6acb9b073880ed2a44f7df62
X-Git-Newrev: 90d7316e9bd5117e0b36e0b00d6ff445d0956d2d
X-Patchwork-Hint: ignore
Message-Id: <20261025085503.4F1479CDE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tailscale: bump to version 1.104.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/90d7316e9bd5117e0b36e0b00d6ff445d0956d2d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The tailscale v1.104.2 change log [1] points to the security
bulletin [2]. This new version includes the upstream commit [3],
which updates the Go toolchain used to build upstream binary bundles.
Buildroot is using its own Go toolchain to build its Go packages, and
was already updated for that security issue in commit [4].

Therefore, this commit is not marked as security fix.

[1] https://tailscale.com/changelog#2026-10-21
[2] https://tailscale.com/security-bulletins#ts-2026-013
[3] https://github.com/tailscale/tailscale/commit/42347eb178367798658c731f9126b5d2a4a63370
[4] https://gitlab.com/buildroot.org/buildroot/-/commit/4e0cd646932be3631f87f37ee08e5d6c09e2565f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: add commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tailscale/tailscale.hash | 2 +-
 package/tailscale/tailscale.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tailscale/tailscale.hash b/package/tailscale/tailscale.hash
index 761fc9b1c4..c75034a872 100644
--- a/package/tailscale/tailscale.hash
+++ b/package/tailscale/tailscale.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  40e552cdf23c09c413fbb2f8f9744502a1a923bbb7a899708912dd201c689240  tailscale-1.104.1-go2.tar.gz
+sha256  6d57857ff91c06ab9b7af465e023c27e27a1caef55e731e7a9f79f144b4bd3cf  tailscale-1.104.2-go2.tar.gz
 sha256  a7ca6186a7963a0a60740f6047760eecd7a0234e8c38bd7e1e0bbcb324bda45b  LICENSE
diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index 0031292226..b07b3f9631 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAILSCALE_VERSION = 1.104.1
+TAILSCALE_VERSION = 1.104.2
 TAILSCALE_SITE = $(call github,tailscale,tailscale,v$(TAILSCALE_VERSION))
 TAILSCALE_LICENSE = BSD-3-Clause
 TAILSCALE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
