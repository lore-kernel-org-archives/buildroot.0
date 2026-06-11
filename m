Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E20BCD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F36E66117A;
	Fri, 12 Jun 2026 11:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oeE7WMtQt7ki; Fri, 12 Jun 2026 11:24:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00DE061168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263493;
	bh=3QiPezjNRlkOqREYkpfAzQEVCiYyBnwZ86IgXvMC7RQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lTQ0hc6CImQD2IR6JKoQjgQ3T3Rn3VGUIP/XqHLnmRt0BqzcxPrJkT9Iy/PSR3BWY
	 LXJxumXPAm9JAx/hXivlZkyL/xzMVzBkedz7wgiX2v4qckMArxQGqEhIdhbyHn9ekX
	 Ufcpf/Ru6yVccVk/1Zm1uH3KMfh8NMiBKYTX38pqpw14lIs7ntnalGYU1m5b+0DKHO
	 6kE0w51H/U+xKQABu/kbhYhsgxPYVdL46vKZjWKU8aJcPJDWSN0dbWASYnDgrgY7Am
	 2+0TEb4OobXIRzOlh04/rLRaz8vBUktipCR0VL71cod1YNIpC+PMQSX2V3xU0tjDHH
	 QhP6Mz+lZynPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00DE061168;
	Fri, 12 Jun 2026 11:24:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D88FEF4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BF1A4067B
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVe9-ZbctKvn for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D687040670
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D687040670
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B040A880EA; Fri, 12 Jun 2026 11:23:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:34:57 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: fe9dc2ed1d0077e1c024069356e716fcd85aaac3
X-Git-Newrev: 4855845127a9eb3e872137b3011b818b8094115c
X-Patchwork-Hint: ignore
Message-Id: <20260612112349.B040A880EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/privoxy: security
 bump version to 4.2.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4855845127a9eb3e872137b3011b818b8094115c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Fixes the following security issues:

- Parse the chunk-size with a dedicated function and reject "unreasonably"
  large values to prevent silent truncation by sscanf(), integer overflows
  and misinterpretation of the content later on. Heap buffer overflows on
  platforms with 32-bit pointers were alleged as well.
  Commit 5b3bb22b77. OVE-20260515-0002. Reported by @TristanInSec.

- ssl_send_certificate_error(): Store the generated message on the heap
  instead of the stack to prevent an alleged segmentation fault if there
  are enough certificates in the chain to exceed the stack size.
  While at it, replace another variable-length array that was probably
  unproblematic with a heap-based buffer as well.
  Commit 4963aa4f08. OVE-20260515-0001. Reported by @TristanInSec.

https://www.privoxy.org/gitweb/?p=privoxy.git;a=blob;f=ChangeLog;h=d62aa6bf0b2cb26100e4ba8e528638259502711d;hb=0c5225b6844dd1a838b80d09d715a6c4ccbda2c6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Peter: add vulnerability info]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 283a7a15b287bac53533eea140f9784648942df0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/privoxy/privoxy.hash | 6 +++---
 package/privoxy/privoxy.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/privoxy/privoxy.hash b/package/privoxy/privoxy.hash
index cfb6f5a5c8..2678a4ec25 100644
--- a/package/privoxy/privoxy.hash
+++ b/package/privoxy/privoxy.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/ijbswa/files/Sources/4.1.0%20%28stable%29/
-sha1  6afc12dc38781a37670c7e4bb69700900123084f  privoxy-4.1.0-stable-src.tar.gz
+# From https://sourceforge.net/projects/ijbswa/files/Sources/4.2.0%20%28stable%29/
+sha1  deb927b172a3b473bcf246ea848ba6ed931274bf  privoxy-4.2.0-stable-src.tar.gz
 # Locally computed
-sha256  23e4686e5848c74cb680c09c2811f0357739ecfe641f9c4072ee42399092c97b  privoxy-4.1.0-stable-src.tar.gz
+sha256  6f91267f81f626c416994db89ab62f4d09246eebf4754b81186e13a18ee9028f  privoxy-4.2.0-stable-src.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/privoxy/privoxy.mk b/package/privoxy/privoxy.mk
index bfd4996292..9bafc1385d 100644
--- a/package/privoxy/privoxy.mk
+++ b/package/privoxy/privoxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PRIVOXY_VERSION = 4.1.0
+PRIVOXY_VERSION = 4.2.0
 PRIVOXY_SITE = https://downloads.sourceforge.net/project/ijbswa/Sources/$(PRIVOXY_VERSION)%20%28stable%29
 PRIVOXY_SOURCE = privoxy-$(PRIVOXY_VERSION)-stable-src.tar.gz
 # configure not shipped
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
