Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD754606A334
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 11:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cizOwJEi
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 856D160719;
	Sat,  7 Nov 2026 11:12:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id srRjeqZz2MPJ; Sat,  7 Nov 2026 11:12:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A42C7606C0
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794049960;
	b=otYdFOy2mTbYNOurzHXZEbIuXFJQZN74z4DIHGk5GRSfh3sxpBNSxFBqYnxKjwjbfJsI
	 Xm1UXLvHWpZt6MoIVOiQvwiQASXDb7a6RA5Bbg3+C0SzA/GSE6/RZSGwF6rxh2JGWrOcV
	 jdKqmLjnPzTx96RUGJJLcr1QwzNhAgGnx0Vft8a/so5h3XPqADAuO8Lwhd7g2MFdWlboe
	 mmHbrPLkiWmH5PYF3WNUQoimnv8CTuvicW9F9yNviVLfoJGY3LNzrUK6wOKLJygIqjzaU
	 MGGMpCUxATgLJshd5cZ/0mO3oKxPtEJ4l5LAjtEsRswr1FvjjBM11eZCY5VT47nWV8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794049960;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DZDNj7NtYeofsKR2XyTkwEAcy/G3n0zqwMX8a8pQ3pc=;
	b=MAOoBuObmep9hDMfJ37VYCqK5X8H3Gg5xAXCJzmOjh46Err4HTOXI7rqUUqmmUoaug3Q
	 gYKFQMnUAvtFYmnwUebmKb3noo9gsbzw8DXaRpadkH3LBFfVBEQYmi1cVvY6X4yFGyh+y
	 PCaWUHZC325KhQ657AgGI1r5fanMN8dFTcWIl4OZp5zQxA+G8a8ufXFHTXdJzqMwkbPio
	 cTmtcAQKiScj1ZS8RDs1KW1YAVnLI85J1vfppQpFLsTIT4FpOeEYyTR0Hf02Rj3JNmUK9
	 PGo5OaS2H64/fU4YOm5fG/RGG4KHl7NV8Ygpe+xVp8oI4Jwag4gXFjlybbShCQS3zYQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794049960;
	bh=DZDNj7NtYeofsKR2XyTkwEAcy/G3n0zqwMX8a8pQ3pc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cizOwJEiacXuJhyIVO+iTffXmLoIAA1jtSdhDKgFv6HDgoeNs1aHup6Iv8shjn3TM
	 JipHjV5X0ZATpTfPXYPk330WQoUSj9MEudc8MTGwhUl/+/dDX5PDkUsmNN8QuyO9BL
	 Kg3aYOEvpHOv2bUbj+EOBYXoOa9dM94EE+ojU4c08a3gllUZwWfwJVhuF0z6Q7vi+i
	 HKVTofnJXpjmkhaoqhuLeB1srWZ/ztXIZIREk0B0nNHg4Dj6r8TjBFho/35E2sGXbu
	 ZEXYsFvIsyM1NZzlU9geUka0GK54zApvBNVKCaHQ8CXPOyHVtfsSrgVLBWoTMKyrtO
	 UZWirZ7gapRNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A42C7606C0;
	Sat,  7 Nov 2026 11:12:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BBB3234D
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8F8B80EFF
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:12:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JiyM3zR0OaPb for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 11:12:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 176C180E55
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 176C180E55
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:12:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCE428B6BC; Sat,  7 Nov 2026 11:11:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Nov 2026 12:03:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17ba755efd2884e538b9677cee818e02a02c20f5
X-Git-Newrev: 027ec16004fa96d1c80570b529c3b27decb588bd
X-Patchwork-Hint: ignore
Message-Id: <20261107111105.CCE428B6BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apache: bump version to 2.4.70
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/027ec16004fa96d1c80570b529c3b27decb588bd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://downloads.apache.org/httpd/CHANGES_2.4.70

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 453a22b965..1de97a5873 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://archive.apache.org/dist/httpd/httpd-2.4.69.tar.bz2.{sha256,sha512}
-sha256  c5e6ebc66e349b87d7fc6916ae7cc2a808ed348003de134cf9e9d89d3e2cc73d  httpd-2.4.69.tar.bz2
-sha512  ca9c5808eef7a0d8d88148b0d2d6045b5a0151823f09afc786b283cef9990036a9c7bc53d043e2f67b6ec06db05f655aa961cb875fa7ad0911fa04fdd295bd93  httpd-2.4.69.tar.bz2
+# From https://archive.apache.org/dist/httpd/httpd-2.4.70.tar.bz2.{sha256,sha512}
+sha256  1eefd7dc95836c5872894ce8e6a37f773d5a6764f0766869d39b8bcf0b1bafc3  httpd-2.4.70.tar.bz2
+sha512  bcbbda8fba5a3e59d6a8b88551d401ff62f2df6bfbb5f6cfac9479ac1aa14a433d490a09e21ad164502a30bd747b43e67c7e43df4412f5dc40e1723a35e3398d  httpd-2.4.70.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 04400d5e4a..cee02f8d08 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.69
+APACHE_VERSION = 2.4.70
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
