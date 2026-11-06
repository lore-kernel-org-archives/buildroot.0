Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF896606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 17:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jzF7NGyJ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8948C4095E;
	Fri,  6 Nov 2026 17:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O6iZ96bDS_Sq; Fri,  6 Nov 2026 17:50:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9C03B40944
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793987405;
	b=jCPxy0L7/tOdk0WriVCjtPS/RBCxXsrVgylA/M433gjngiYpsrddgvI3XmqMPLXvIeoe
	 I/RCz1sQa2YJ/InG+N4YRqwuwbfVsJvh5cebhaSmZ6TPT1xOWsPYhc3eXT7Jda0xYlAin
	 NSxZxGF/BKZ8H+aiBn3FPh3768TyCzvsWbEPTqz74YkVoWiBnK+MfXlSWkQJQtM2eLGmn
	 7uIu4gJfdJ4Cia2eGq/+kfeB2N3434fXit7z+94qUJnpAifpfeed4Hf4v9emLYzQl6aJm
	 IPtUgIeF8Ab2SdBAE+B3DkLNacDp5wK75BphElU5wgIzSLBH6CFM5d4CQRtP20BMODA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793987405;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EpUW7a99f/MBM7Pou4Pn9UN9f4bBJ3lZrCPnCESfh88=;
	b=fq5O3Wy99xsiaS+vcluEloiFyFVfgeKRQ7YIVThG9H2rc/QYgn4ncdOlAXydoNqdG5EC
	 vIu+UdX88QJsBHrSxpCCiV54d02DdUicQxL7Q+DF9ohmp4Y6IZvBhA83cW/9GIGQzowty
	 HnAg4+6DS8ezgNjPd8Psd7E8wZwHP8ZYHl8ivQalHQMiyB4MPJyVVBqk6ky8NYuEUYGyz
	 lGCXhbsI9kG3MkmqBVPnOzeITyXv3n39lRJlTQys9E09ULjbIjYSnxzG9sAZAkvAef31y
	 wLmcJ03LBeFneYzo4XBnqiGiHrOSXSNkqPdiwIlWpQmFJC+FCPQ4hS3hXLcqf76HsFQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793987405;
	bh=EpUW7a99f/MBM7Pou4Pn9UN9f4bBJ3lZrCPnCESfh88=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jzF7NGyJvSqm2AP0hGVLpE9Lh1Wc8cRQSjP4HS3mtB9udKBu2VnIDEYPqOGxm5M+d
	 Q1dzKrDb+ef+S6hzSpa1EKW9D4P+kO3GV/nSJE6LneW/S/ztlR5L4K6+DEQPADp3KY
	 YTgmSnepCkmNYrUfk9eQSzpQbs3SSeG0luyEZZRb/CuBmsSsfip9cJufHvOhYL5NZ0
	 udCGOYJVPF+3kJjbp/mOKYsbS3w9SZ59bkNhJde7P9yCXXOCSMsmLFsc9aHmJiwvVe
	 eSCYQhQHTaSmX2SVh+j7F3efkWvFfAgt1GxNGIbqXjYYw2EDVUdZNpFJhVHFZ5svoX
	 RwXPer1XJwY/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C03B40944;
	Fri,  6 Nov 2026 17:50:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 472664B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37A4460771
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aiziUFNH3SON for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 17:50:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7A273606EB
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A273606EB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:50:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94F3B9E0C3; Fri,  6 Nov 2026 17:48:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 18:45:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b48ba5298d455a39587ba87a6762e26144db2f81
X-Git-Newrev: 0a3712d43d13ee145114323246227e4c46450dbb
X-Patchwork-Hint: ignore
Message-Id: <20261106174831.94F3B9E0C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libplacebo: bump version to
 v7.387.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0a3712d43d13ee145114323246227e4c46450dbb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://code.videolan.org/videolan/libplacebo/-/tags/v7.387.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libplacebo/libplacebo.hash | 2 +-
 package/libplacebo/libplacebo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libplacebo/libplacebo.hash b/package/libplacebo/libplacebo.hash
index ef6d5bdd10..bf895042a3 100644
--- a/package/libplacebo/libplacebo.hash
+++ b/package/libplacebo/libplacebo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8fb4d54ad9339e3530446f13b6a670b3819a00e295a55f675f0515d9dd94f52a  libplacebo-v7.360.1-git4.tar.gz
+sha256  a50147da90e108c8b6b367c7740c2049d055f2512621ebd8f2f972278b5937a7  libplacebo-v7.387.0-git4.tar.gz
 sha256  b3aa400aca6d2ba1f0bd03bd98d03d1fe7489a3bbb26969d72016360af8a5c9d  LICENSE
diff --git a/package/libplacebo/libplacebo.mk b/package/libplacebo/libplacebo.mk
index c3a2822fb5..6c492c8678 100644
--- a/package/libplacebo/libplacebo.mk
+++ b/package/libplacebo/libplacebo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPLACEBO_VERSION = v7.360.1
+LIBPLACEBO_VERSION = v7.387.0
 LIBPLACEBO_SITE = https://code.videolan.org/videolan/libplacebo.git
 LIBPLACEBO_SITE_METHOD = git
 LIBPLACEBO_GIT_SUBMODULES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
