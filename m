Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CC6606A31B
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 17:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dvsaso8s
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AD1240593;
	Sun, 25 Oct 2026 17:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FyarTYJVBVUj; Sun, 25 Oct 2026 17:58:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1F6C440596
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792951095;
	b=ht5rRQ60cssu+V2C7y93K5fZH+ipYOxL2tj/EetJc5vhZ6E1E4YHUSap/ZpL+VYe8Dq2
	 iPfPXJAMjTz3iBiYZ5N52XoPm4me8WuqoxPIoToa3ZyQX85xdbgK7qW5U5NbSFsG21chd
	 RqQFcGjK0Snp1icyTM9mbTWbBdQiQ98Tst8qcaxxIGdWZIEQ8nimjwYjlPTQkE8DXuKOL
	 7kKxQadEdcBCvXIOXjM188YL0onSAZJp5pio6Bz9P44Z/5WZPXyoOrUOh6cQdPDiQWCOB
	 mBP6wFD6RB1vtQqVHgZFCwxyMdPC7GEVYQEIDYlLXfzdranhu4ZShDfnYF++cZHZ9wQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792951095;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/1NUbMSce6AaGGkJu5X05fBEx46warRyjFrHUubDHy4=;
	b=U6Cmxag11o9h5ibhKRRBbLpWwCvpRv4yprbHAe5HwBYzE5XNKQN5DmrupCFymbIBb2Aa
	 9s6zaQE2bALD43NxUFvNaQn46cDtX5NsbhBdEb+77oHJT1sPrVx96TGSvoi2SjxwEBgLO
	 yNijQdpDUGMex7SRWEiuxZIpfj21r+SIK0faqdpJSn5bLmS2r6EOchw1+uK3Wcs5F/mhe
	 MUWHsxBU0RWNl9WsKAJrcX0NgY9Y3kBPMQwOrP4Ab5WYlcO8fybNEnqLS/4r3I7h4sBMG
	 d+GMsXsQa94usdU+xE4Jierz4trNaatL9d2u2hWRX7ilKNgXIFYhr+BhHiDW054cUsQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792951095;
	bh=/1NUbMSce6AaGGkJu5X05fBEx46warRyjFrHUubDHy4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dvsaso8sfup8QpTN4srcKs1n8G7CWHRQMs3GqNivkbwuKR4UzamtF66d/IzsQSSGp
	 WriFA+kBtr5445K8juaYiQyTJIjHqpGjLP3wr81Rqw7R6n3BfBfr7Uif+SwSQ17Bkh
	 73ecQvlfAuNY4nnYHwBwJfjhxFRkkunb/2rv8IghZAYPp8pkHtA2KlF/SVyLGeWwNG
	 79z3oLCgG/Fgqlrc0cNOkjkttImO+RWILy/q682L1rtplGZCt0UAoeSBZDmRX/6Ts0
	 2GIJfnRX+0RDYlzWJ0PTP96bN0GikR2DvEmRbG30izFop25lYqsYcpXoC+mYVST/Q9
	 PV+wU+Pw1zhdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F6C440596;
	Sun, 25 Oct 2026 17:58:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EE1974D1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF68440596
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a-Ss70i2c0xR for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 17:58:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1842C40593
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792951093;
 b=lW6OcpQ4MiMryVYl3JKwLuCTEzS9pIcx82zV4aer+DoYcGviRwDgOkwDShQx/+n0veb8
 npzgeoYgGbTnW5Q+HZeBg89XWJ5ONJKdvXmHadYm+bsXHXgoVi2KH4nWEwkHDZKz3SKuD
 Fvp8Z9sZR+nstRXyxw6Z/wPXIQY+K7oO1rFMbi7aoqcK94oCtIUQURuIONlRfF9FH+7IP
 iUmoIyZW2F3uNXUOftuGx3R3ddJJK7DDWr+6DxhhUi4WsB5TGpGZsrvtcX/O7k0u2AXKK
 lSkGETNt3EVZFyydldtq6KHtKO5w5lWSsnCgU9B1U++22YySTmCgBmRnLV5m7TEOfRA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792951093;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dgCWGYTL2Rjug3PBv9T1YuYuHQejR6nUGcI8uIzAs8E=;
 b=j58XTlFJNJAfs/XnFAZaK9pVvcUUtVfYB0oyvH5rjLSEqqPyxvzes6TfpTVL50cGMQM5
 +jLoTr+ZHKVwKMD+pzn4jHvQL/GI88tTrw+WZLEOyT+qaYTAlRVWa6GuJk3JQ705hOZSu
 J3c4DBpo3zxan8plo6Ob8LCrFUQRDODnOwkVTsxD5HlyuuLaXZfQyV6LxFcEOgDMI0VEk
 jnEnR0YFWhn4cP765i3GNU8DncW2834iKuxw8Aw0dEAeQim0NONrF5KTaQ2oRodz02ZIZ
 1GSgGHVRn7r1dPg6tKxKBmzpjbgj6Tsfd8GeA0OgqfKh5TS3qlyAG86Q2HQjjbsdweQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1842C40593
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:58:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C83C999CF; Sun, 25 Oct 2026 17:56:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 18:57:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44f898e7c5e4657e6b2af19af992e9209f408bc9
X-Git-Newrev: 805712402c095789dbcd37fcabae1435940c3427
X-Patchwork-Hint: ignore
Message-Id: <20261025175647.7C83C999CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvmtools: fix build on i686
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/805712402c095789dbcd37fcabae1435940c3427
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The patch set used to bump openvmtools from 11.3.5 to 13.1.0 contained a
patch which is not needed anymore due to upstream fix
https://github.com/vmware/open-vm-tools/commit/36eea633611e678f3ea17a913c0990f319135c48
available since version 12.1.0.

The patch causes build errors on i686:

hgfsUtil.c: In function 'HgfsConvertFromNtTimeNsec':
hgfsUtil.c:135:49: error: 'sec64' undeclared (first use in this function)
hgfsUtil.c:135:57: error: 'nsec' undeclared (first use in this function)

To fix the problem we remove patch 0010 and renumber the remaining
patches.

Fixes:
https://autobuild.buildroot.net/results/d37/d37be203b0b4d46c052427ea2c469c624b26504e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...nvertFromNtTimeNsec-aware-of-64-bit-time_.patch | 51 ----------------------
 ...zation-discards-const-qualifier-from-poi.patch} |  0
 ...void-GLib-g_free-macro-redefinition-erro.patch} |  0
 4 files changed, 52 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index c7558ac8c4..60516b3098 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -686,7 +686,6 @@ package/openvmtools/0006-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch lib_pa
 package/openvmtools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch lib_patch.Upstream
 package/openvmtools/0008-Use-configure-test-for-sys-stat.h-include.patch lib_patch.Upstream
 package/openvmtools/0009-open-vm-tools-vmhgfs-fuse-fsutils.h-fix-build-on-mus.patch lib_patch.Upstream
-package/openvmtools/0010-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch lib_patch.Upstream
 package/openvmtools/shutdown Shellcheck
 package/openvpn/S60openvpn Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/oprofile/0001-musl.patch lib_patch.Upstream
diff --git a/package/openvmtools/0010-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch b/package/openvmtools/0010-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch
deleted file mode 100644
index df69be32d6..0000000000
--- a/package/openvmtools/0010-Make-HgfsConvertFromNtTimeNsec-aware-of-64-bit-time_.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From bedbcfcf347ff1a11d1a54f8f780f560e4b241a4 Mon Sep 17 00:00:00 2001
-From: Stefan Agner <stefan@agner.ch>
-Date: Tue, 5 Sep 2023 15:03:56 +0200
-Subject: [PATCH] Make HgfsConvertFromNtTimeNsec aware of 64-bit time_t on i386
-
-I verified that this function behaves as expected on x86_64, i386 with
-32-bit time_t, and i386 with 64-bit time_t for the following values of
-ntTtime:
-
-UNIX_EPOCH-1, UNIX_EPOCH, UNIX_EPOCH+1, UNIX_S32_MAX-1, UNIX_S32_MAX,
-UNIX_S32_MAX+1, UNIX_S32_MAX*2+1
-
-I did not verify whether the use of Div643264 is optimal, performance
-wise.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-[rebased against stable-12.3.0]
-Signed-off-by: Stefan Agner <stefan@agner.ch>
-[Bernd: rebased against stable-13.0.10]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- lib/hgfs/hgfsUtil.c | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/lib/hgfs/hgfsUtil.c b/lib/hgfs/hgfsUtil.c
-index fcd7fb726..f86061562 100644
---- a/lib/hgfs/hgfsUtil.c
-+++ b/lib/hgfs/hgfsUtil.c
-@@ -131,13 +131,15 @@ HgfsConvertFromNtTimeNsec(struct timespec *unixTime, // OUT: Time in UNIX format
-       Div643232(ntTime - UNIX_EPOCH, 10000000, &sec, &nsec);
-       unixTime->tv_sec = sec;
-       unixTime->tv_nsec = nsec * 100;
--
--      return 0;
-+   } else {
-+      Div643264(ntTime - UNIX_EPOCH, 10000000, &sec64, &nsec);
-+      unixTime->tv_sec = sec64;
-+      unixTime->tv_nsec = nsec * 100;
-    }
--#endif
--
-+#else
-    unixTime->tv_sec = (ntTime - UNIX_EPOCH) / 10000000;
-    unixTime->tv_nsec = ((ntTime - UNIX_EPOCH) % 10000000) * 100;
-+#endif // __i386__
- 
-    return 0;
- }
--- 
-2.47.3
-
diff --git a/package/openvmtools/0011-fix-initialization-discards-const-qualifier-from-poi.patch b/package/openvmtools/0010-fix-initialization-discards-const-qualifier-from-poi.patch
similarity index 100%
rename from package/openvmtools/0011-fix-initialization-discards-const-qualifier-from-poi.patch
rename to package/openvmtools/0010-fix-initialization-discards-const-qualifier-from-poi.patch
diff --git a/package/openvmtools/0012-glib_stubs-avoid-GLib-g_free-macro-redefinition-erro.patch b/package/openvmtools/0011-glib_stubs-avoid-GLib-g_free-macro-redefinition-erro.patch
similarity index 100%
rename from package/openvmtools/0012-glib_stubs-avoid-GLib-g_free-macro-redefinition-erro.patch
rename to package/openvmtools/0011-glib_stubs-avoid-GLib-g_free-macro-redefinition-erro.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
