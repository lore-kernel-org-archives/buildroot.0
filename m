Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7530E606A31B
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 09:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=L1t6pLHV
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 486F2409EB;
	Thu, 22 Oct 2026 09:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XX8do65YPtC4; Thu, 22 Oct 2026 09:34:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1B96740976
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792661688;
	b=OtvAdEXrgDeFOYL46g8XHVl6/bOTv8xijk3YuqEdU63n5bmPadTWf3QAYPn154pagUXT
	 7SeinDD7khE6NTpAf6KiHr8aC0Xr9314hsLCcN9GkXEL1YWcMeGCiKd6DcrDjnhM17hvI
	 LMHoAOhyQT2Vhjj5+gaA5/xzVDKror+hrISG5PMIoEJ1yyVXEgM3Ks2UfDCq9FCnFjxoU
	 8ok5e6X3xf3+H3MHsZ2yaQJ5a0z5IG8Y/DkOKmBWiPElI423dU9H/sK8ddZX6MapjhTpg
	 F3ByvfRMg7Ebf9iK7mLk0N5Ny4MBEQyufHm/JHilSrSIuw6Q4oWC2pkEU51N7O1ki3g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792661688;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=dR7CPwNzq4+CpDb7jPKlIVKVb7HlyOpIL/hFvGt4g7Q=;
	b=Y4T1LQvfo7hoEZ8faih3SVXlYOwKaFq3ki9k1sP1BPJr79pbxNu5gF6ELUv+ztzygLeA
	 D3EwKPP52o1a95X5M7OGD0EAunz4TFgGwLBxPf8E7OiQ9IRX0SR+As7zAwfrJYVPEAs/r
	 yPvT+ZYlWEayMerKrzKyX78iq3KiEPqJk5dZSTLjGSxMS2yDJaQZYzv+6+gyIXq3PFcmB
	 8UxdZyoeim792rOUAsdroB2u747d8Lg4TzDUZMCoKwnwvqJkrPl4pglzsLpguUY4xx2rz
	 f5cdP05XBsE4PifujAkxwTn1jOdy8LOZhs5FAQx+K0NGeNGteiyUIzQcNohHHP/jwBQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792661688;
	bh=dR7CPwNzq4+CpDb7jPKlIVKVb7HlyOpIL/hFvGt4g7Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L1t6pLHVt3xVixmh+o9FBCl83OQ2JmLGClS9hreLhHcemo5f8DaBrizG/7Rk0rfBW
	 k5wE8cshUq6ZwdZvpl6DzoWTXS/SRgpd/tAAOKH+B1oFUze8WJFe3HItMnBacO+QJF
	 WaH81D5eHktkO1A23n/+cd5spnpQeZ3zXn+aE1AkTOfXkoYx4gUo6HbIdIII5latXl
	 OiNO2YFJAn3GJVL9P3VoaPz4Fklu8Q7grXhz4aRDjDUIfOG3fbTEKekc2DSEM0MeKZ
	 bRQlCTYNasf2k5Fu37J/gEUsZvsj2N06G9VQUEHiviTDhbhQ+r0Xpp6b96Ap6R1NWJ
	 OHQkBTj9WHcBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B96740976;
	Thu, 22 Oct 2026 09:34:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5634D1184
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C080811CA
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5S-R9u-4sYoW for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 09:34:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6617D811C8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792661673;
 b=X35injBTKCpDrLiZi3sgDIhsELU6NRhT3xVhmWM1wynHQuPuqg4qlLj5/XrX1YZckdTO
 rekenQoEyKRab4xUazqqRP5XkW2zUfEJlFp0ie4rzaxga/znxPBPIQQVdCFkC7WwzWfz2
 bi0hVq294MZiZkmaqH77BdW++LOIIH3L1IZeQpigxociZsVYn5Xv0SwRK9ZHgrVHdH6nd
 5fT9OZDIjvQiOnxkRFWUX/qSTS0uJ4alCv57KuHMj4nWnkBHtl77eHULzpV29UxRFe0Df
 ZN6nimMr/8fRBJMNmKPKFuT66KuGIHznFAEWSGckZFzajZI7llELF92xXsDoQdcvuYg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792661673;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=NsRkCo4Plt23P2xwBlsfEVifLyC9CDO+9zikL5QoULQ=;
 b=rju0WDHejQlxaQ0QcSw5vBYOjkmBy1QAQaur687e/jXyk90rM6IVtSpVAHOWoylktGOy
 82ew0whEegqB6JKDGXQrQjcMOk2Qldc25Thl73ihr6ywXd+IgRwN1PZp7dbGeYveYafjc
 6vlMRMLe0RfNrttq5PZu0AgYHmOxFDF5YnXx2zYzj+fteZyK9xcqId8rLYaYovGuClWDV
 FZc9MparrBcr0zNICI3FUFWGF/SXZmG+tbcNXscei4vPNa4ab0hLzrmBWtoEJOCoM5jC5
 6RfzLuCzVR+wAcmkkIZAXi9+iZ4xz95V7QMLqQmGMsvoLW326fVq3XAaItLMYzArtUA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6617D811C8
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:34:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F7519B985; Thu, 22 Oct 2026 09:33:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 08:45:40 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0f238d5a207bae39f6a6675d305770bb6fafffa3
X-Git-Newrev: 24b11a34d4323e6d795540f43ba7e394ea2b8719
X-Patchwork-Hint: ignore
Message-Id: <20261022093309.6F7519B985@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-scipy: fix
 build with GCC14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5538965177996262042=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.9 required=3.0 tests=BAYES_00,DATE_IN_PAST_48_96,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5538965177996262042==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/24b11a34d4323e6d795540f43ba7e394ea2b8719
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

When building python-scipy package with target GCC14 the following error
would occure:

../scipy/interpolate/src/_fitpackmodule.c: In function ‘fitpack_bispev’:
../scipy/interpolate/src/_fitpackmodule.c:255:10: error: assignment to ‘npy_int32 *’ {aka ‘long int *’} from incompatible pointer type ‘int *’ [-Wincompatible-pointer-types]
255 |     iwrk = (int *)(wrk + lwrk);
    |          ^

This has been fixed upstream with the patch [1] introduced in scipy
version '1.13.0'. For more information see [2].

Backport this patch into the current 2025.02.x scipy version.

[1] https://github.com/scipy/scipy/commit/fdf3b908eeb93203c1847c6fb4efd12e88c37ce5
[2] https://github.com/scipy/scipy/pull/20135

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...define-F_INT-as-int-rather-than-npy_int32.patch | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/package/python-scipy/0003-interpolate-define-F_INT-as-int-rather-than-npy_int32.patch b/package/python-scipy/0003-interpolate-define-F_INT-as-int-rather-than-npy_int32.patch
new file mode 100644
index 0000000000..f722c4ca37
--- /dev/null
+++ b/package/python-scipy/0003-interpolate-define-F_INT-as-int-rather-than-npy_int32.patch
@@ -0,0 +1,50 @@
+From 53796772ed735c1564863fc7ca8d902acb628167 Mon Sep 17 00:00:00 2001
+From: Ralf Gommers <ralf.gommers@gmail.com>
+Date: Thu, 22 Feb 2024 09:10:46 +0100
+Subject: [PATCH] MAINT: interpolate: define `F_INT` as `int` rather than
+ `npy_int32`
+
+This fixes an incompatible pointer issue that shows up as a warning in
+Windows CI jobs, and is reported to break the build with GCC 14 on
+Fedora 40 in gh-19993.
+
+Using `#define F_INT int` is done in several other submodules; this
+was the only instance of using `npy_int32`.
+
+Closes gh-19993
+
+Upstream: https://github.com/scipy/scipy/commit/fdf3b908eeb93203c1847c6fb4efd12e88c37ce5
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ scipy/interpolate/src/_fitpackmodule.c | 4 ++--
+ scipy/interpolate/src/fitpack.pyf      | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/scipy/interpolate/src/_fitpackmodule.c b/scipy/interpolate/src/_fitpackmodule.c
+index 0e913d1c7e43..dc79b2b28833 100644
+--- a/scipy/interpolate/src/_fitpackmodule.c
++++ b/scipy/interpolate/src/_fitpackmodule.c
+@@ -28,8 +28,8 @@ static PyObject *fitpack_error;
+ 
+ #else
+ 
+-#define F_INT npy_int32
+-#define F_INT_NPY NPY_INT32
++#define F_INT int
++#define F_INT_NPY NPY_INT
+ #define F_INT_MAX NPY_MAX_INT32
+ #if NPY_BITSOF_SHORT == 32
+ #define F_INT_PYFMT   "h"
+diff --git a/scipy/interpolate/src/fitpack.pyf b/scipy/interpolate/src/fitpack.pyf
+index 08cb0c141c98..a9535a83f479 100644
+--- a/scipy/interpolate/src/fitpack.pyf
++++ b/scipy/interpolate/src/fitpack.pyf
+@@ -16,7 +16,7 @@ python module dfitpack ! in
+ #ifdef HAVE_ILP64
+ typedef npy_int64 F_INT;
+ #else
+-typedef npy_int32 F_INT;
++typedef int F_INT;
+ #endif
+ 
+ static double dmax(double* seq, F_INT len) {

--===============5538965177996262042==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5538965177996262042==--
