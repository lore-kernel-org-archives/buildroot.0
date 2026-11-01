Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA5B606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 16:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XQQvpttN
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D48080DE8;
	Sun,  1 Nov 2026 16:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2naS2cMQR4-J; Sun,  1 Nov 2026 16:21:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 37E6780E0A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793550068;
	b=G1fBsEBdk1erItcoCqThz/fQfnYKbiKSvCtdBs2RJyqm1FofzFupgZfaCrkRw66LnvAg
	 fviR2qpqJcYKvhNbJlyuZj53GYQn/obo0nhqjCQvsiRVRczCGx8l3n/dctG5TB6U9WPZf
	 nwIu8XjaqMDVD+DeMvUSmUbvQC7wPpSlkK2moKq6J7g4TF4ZtheOl6h2p9jPLjHxkoXpf
	 scL3pC4j6yQkR+DnUJJ5KOvLrDWkj1TKTuqTzzCJ5s0q/08OJmqUl/lL66zzx4qD1snDv
	 5rCyehDG4qcJ/69ry49HqXFvavqJuB+HHcS1+Qcr7cRwJOMnAPLGStI+iFHACijVFaw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793550068;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/IIGsaSNFtP583bgSaUP4LKl/qGDZDt2mzriFELCqUA=;
	b=BTl7lz3AganhcL2/EfOZQXvwUfJKqu6nVCynZBr0WoDebumxeMYZCr3e1TyfWlLXXCg8
	 d0md8c2VLuJ3/y/bjxpSNZexRYriq2JqW4R4V6L3Wi/+/twWRafyXJiXUgBGa3JHMdhxi
	 qp/FIaE7N2MM9lj2hnoIJC8PH1pSNW4jNV8Esc9/xtrfcTpg5sqiEUH0jiNV/XgyliuZF
	 lpgLn0OtYaNll9sWjmW7Ge9irmXG1UMvztm2PeE3CnPkqNH/fIkWVIOzP/UDrF/0+c7tO
	 h0J5DBgy50X1QuPYNVmJuzqNp7Z6MaOMrYavescKBjWOWNsLNT9+CBNEVBARpkG7wCQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793550068;
	bh=/IIGsaSNFtP583bgSaUP4LKl/qGDZDt2mzriFELCqUA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XQQvpttNjb7fQHVTyNVwHmaPp9DAlGln7unAHBr5OguMJG+i+8coIv0s4sMIJf5RI
	 CGAnsfvP7bK2cfhBU7PmLUiUAsbSHRMQBnRtD1kWLy+XO/vdNISNN8nmS0hcZhCJbC
	 xa4uiSt5wFJYv98MT8buPKdSPGxGW+hSJL8qqhEwW4qG/VfQ6gGVYBb1NmNLabzUIa
	 zLfdEJxnpAAfKt7sW8hzC68KFONLZ4gqYpUiJyYToaWsAYXlHa/jswq5yG5WKJ3Dkl
	 7TcvC8N9o/g5EId6nmIAiH4RKR4Bw2n2gz079x7oJGObYAl+KctWNAmw775vLTKhic
	 a6YcS5c3hLkOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37E6780E0A;
	Sun,  1 Nov 2026 16:21:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3230D3A7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16972405F5
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DeqkALzG6q4P for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 16:21:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3CEE440621
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793550064;
 b=S/vi6UmOhonxXs9loWbwE6kr8r2lDevT6u7xnHioOh/JTCbgDcr0gwBGiMVDaSgK3ilj
 AmiWVTPnNNyes6a/IRerzx+u2loxlaS4TKYgO0KyS4bHe7jLj1Mue6tDdEILTJadb9Jar
 3HVJfq47RxLEF+fz1d/tbq3pDw6InkPhTi7fxDfpLDBEkqMvMO28GKb7CEHsc2JNguI2V
 n7TWzWkZlWwKJ4Ut95sHLj5QEjDHC9Qn4utE/1PloARgxCMRNFz1NObEiGejrTZm6ZNZo
 jISli/lM/wnuUzru9b4ZmFh+qygigPF/V4lkxQg0Dw/tU+fsffW6GXMtwmOt1ZuTI3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793550064;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=NgA/g5oGDjZ06NIcPIr+WgrRr6r6w/cgd6L8wWI1M3s=;
 b=FsPo28GlSfZKVmyYKxvd/sS991Uz5H/j980c0wweZljXF3BJ3AbuTgENIqeuYqEXoDzE
 sM/DSZerDYBP1/rh39JUYNCreHhT4Z+T4cXNFak9bAGeOPpAtCWD1Rb0ziuUT/Lu72++R
 FxVCwJiU3yhAYooJCxiSOo7zAYk5MCLp+zUMzRd0SfdLMVfQovsY4no/rDTCxO+GqqmbB
 R5EH0IYyN38ifc3Th5taCrGiAs5bV0Ua7KNgOjEC0GXEt25HEeXEsUftv04E13ta4Jjfh
 5bjEynZJLbsyEvMZSBDIQ+jCNMenexumATyNN1CRM17uzOfm2u/0Hh/NjbEACUIZLLA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CEE440621
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:21:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F17449D4BC; Sun,  1 Nov 2026 16:19:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 17:13:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7fe7315835da41d02d19198e6a6ec9bca23ee77
X-Git-Newrev: d150cdaba473ac6c1bfadb9751b5a836dff0cf39
X-Patchwork-Hint: ignore
Message-Id: <20261101161934.F17449D4BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-pvr-waipu: bump version to
 22.10.4-Piers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d150cdaba473ac6c1bfadb9751b5a836dff0cf39
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/flubshi/pvr.waipu/releases/tag/22.10.4-Piers

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
index 08a15e9f84..68efb3a6e8 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dad83d50c2cc4584139a1e3b6def77c23ef800f69e5b4ccff70c54376e14476a  kodi-pvr-waipu-22.10.2-Piers.tar.gz
+sha256  0ed514daf78e805c02517f3c9a7c732d235ab7b0f9897e82d68b384cba724154  kodi-pvr-waipu-22.10.4-Piers.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index 5f86322f65..9ed62e0da2 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 22.10.2-Piers
+KODI_PVR_WAIPU_VERSION = 22.10.4-Piers
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
