Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDAE606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 20:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=amnYu15u
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6107F80C3B;
	Mon, 26 Oct 2026 20:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TZDM6TcxL3QJ; Mon, 26 Oct 2026 20:23:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0C9E580C38
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793046182;
	b=nEgNOThMFTmhnCNVPOXjP72G5arnrZvRkIplOMeAZIqZlEzhi0+OXc4tVZ0ZD1XJu74E
	 eOFc/gqbDPkQBNYyQxJqhJUSEYc9WvUAKm0X1UJHhPMJD/8qc8l5G6Wc+g3V9LWZMcUjB
	 2huExj4C/qn9cRq1kxTgNusa3tCAHgwQIrk5dQaHCFP+t2AB8mVJFUwUjm0GoTIrkgBSo
	 QD8/sIRRfod1KIgw3uUr2Rrm9V4Zk+xfzfqpSetbQY41zX/Fl0+KxmBlbfuSqcrXxl+eW
	 PT7PgK/DeZxXPGbnk7KYZm2ld3/tL9As78tiwfvxKxTjyzVm5Cyrr0Ohpebqj6r7v5Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793046182;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=a2TDwKQ2/H4c+IlkQZ9C04+VT7XKToKGp4aVWCwfjeM=;
	b=GV4kylY5q5oq4RsiyNMQ+ewimBoaufnDasuDCg6QEF+RB5IWC1d7GKAJIU2nlmn0A4Yb
	 2gm7GLDV9uUR/onkYleOr3gdlx1fEHtzN+uxKYekj1IFJ49ii+acJjeq6rCIdQjKhxF7n
	 Dag8DJT1iPYtUaT7KK0gxhI5AQ+BIhgZiLbBY+ad1UP5XS9cW5HNvw/pyVF8ftW7wEc5H
	 0KbUCKDsowmaNOSawI9ByeXsiNr0LvPihVKs4qgMAvP4Gq23Bc6PTS81iqiykkNQ1A0n/
	 Umy4v/eJ5NKcSOd6F8/7DDaTc1m5YvqU+FH9irEMmTTV0TjKatgNi3LuumzpaYq0oSQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793046182;
	bh=a2TDwKQ2/H4c+IlkQZ9C04+VT7XKToKGp4aVWCwfjeM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=amnYu15uO9as5kHvSqfbB/d2nSN37oB1keXuuogjKl0KbHhLOz/8t9hSSSwE5Uk54
	 44n/V2pj6jopF8ENy9Zys2E0bitQvNA+iDyjEyTuoUhQQQOP2s03o2f1MyChT6FpXo
	 pxfuG65gqDHmuQqlkWXO6nK4uyYTTi5UNkF043DsczGJIsyMrbUoqQRkqlxmDcNsk2
	 TEMbK6z2UtdBXePTXsYKZLUyz/o56KVcF3MA19dWtz0gPyK5kToCM0ncoD7yGs+WhM
	 6k5hgKUfjCFtuYrz3uHbSa4COjmW5xYi8Dapx/ex84zkEX4VwpQQrvKIUZCTyV6sV4
	 8BGHOCRTWqmwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C9E580C38;
	Mon, 26 Oct 2026 20:23:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C97AE2F5
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA6B4605EE
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1PsyqB47UaUq for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 20:22:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 65406605E0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793046174;
 b=hQQQRlf3It5h7fPJ27KZuSJXQoF/7QrjOlYcxW6COybqx8i5rFd9RiSrPY7mKKkQth7G
 7Urj/gfO+bE8qReV6oCwFBzNELNsY19PnNf2AygsTDBmswvYLKiWI98vdUvmZnn9h9SQa
 jW3ZHh05/pm1vFIsB7Pu0Iam+1ej7Y5P6iGmNMXdQa+gmmTWlKPapbj6vvzzn7kunQed+
 9VA6ZPah256vQvACuIjtzNY04cjIKKgrP7xAx/SoQKjzhh5hYBnHEGndgKaBPHyzXht14
 HCP+3RhggEMprqCPkxtcQXqCamhiKA5JO99yihOhP6rXAb4NylhkYDI8CkpXLvWOOzg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793046174;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KpFiB0y7+JfzZFSQQVpy7onFE8kOpCYE1wmg5F5V94E=;
 b=gnygtf6Y0A+ZIxQdxyOFXUUnARaa2vkOhBt8bRzvxjypPSsXXt1jDwOgyPJa8q47goKS
 spwSUQu8Ze20DPIz2BJrMB39N6RGr0RNFt5ygtgFocnVGyrMuADC42uBAq/lZRJ/makn+
 N1oCt1BVFQmrmkU8MS65rvfYkoogp2TrAYQLl/8svbGXkwL+PBB21Efv68AhSuQ3E971q
 tzjLPWrYrK4BT1j7jNwq8zxIvG5FM0RVJjvchHABWbD3h+eWwv9nQE2XpeBQlmn8OcJFt
 FC/5aOxWTIwTZlYKY6jvTlVWz20EZyoYf+Y5R2das9Q8k2cSzEcIBPOSYqL8ECpUE0g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65406605E0
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:22:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54EB19CFEB; Mon, 26 Oct 2026 20:21:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 21:05:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d9a90578aea2abc970656c07d2f5436ee441b93
X-Git-Newrev: 9af3b214be63c7fdef33bb4e4b9a922f2a653047
X-Patchwork-Hint: ignore
Message-Id: <20261026202128.54EB19CFEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xconsole: bump version
 to 1.1.1
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9af3b214be63c7fdef33bb4e4b9a922f2a653047
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://lists.x.org/archives/xorg-announce/2026-April/003689.html

This release fixes the man page formatting and adds an optional meson
build. The autoconf build is still supported, so keep using it.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xconsole/xapp_xconsole.hash | 6 +++---
 package/x11r7/xapp_xconsole/xapp_xconsole.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xconsole/xapp_xconsole.hash b/package/x11r7/xapp_xconsole/xapp_xconsole.hash
index d8181fbe5f..92851f7d4a 100644
--- a/package/x11r7/xapp_xconsole/xapp_xconsole.hash
+++ b/package/x11r7/xapp_xconsole/xapp_xconsole.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2024-April/003512.html
-sha256  0c775978cacdda76dfc8b5a97142f145a177d26220dd307866d9dd62e7391189  xconsole-1.1.0.tar.xz
-sha512  1b5b1e1e15e3b988c159e924ac5c51734c4e37ed112815fc6bf6e36f80e840ccd904a4f0b0f27191e0dbf656d367a38873fd493a266887daa111e5266eebf37e  xconsole-1.1.0.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-April/003689.html
+sha256  d412abbea2423f2930443c43db1c83d7d0cf2b677419b86ed54aa5d47f072322  xconsole-1.1.1.tar.xz
+sha512  8024ae0dc1bc3512234ee0a2bf66dcc665daa2af67056f680af3e7f330952eb5fa6dab0442a4b4ad54df3d35ef4ec0442e7c0c6cb9fe6d9b70b2038102ae8bef  xconsole-1.1.1.tar.xz
 # Locally computed
 sha256  a29ea5dbcde7ba1695c95949be6303d1ca1de0b7786a38b60f33eccf03506f9d  COPYING
diff --git a/package/x11r7/xapp_xconsole/xapp_xconsole.mk b/package/x11r7/xapp_xconsole/xapp_xconsole.mk
index bd4c43e321..cdebf5accc 100644
--- a/package/x11r7/xapp_xconsole/xapp_xconsole.mk
+++ b/package/x11r7/xapp_xconsole/xapp_xconsole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XCONSOLE_VERSION = 1.1.0
+XAPP_XCONSOLE_VERSION = 1.1.1
 XAPP_XCONSOLE_SOURCE = xconsole-$(XAPP_XCONSOLE_VERSION).tar.xz
 XAPP_XCONSOLE_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XCONSOLE_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
