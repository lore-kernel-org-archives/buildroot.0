Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA6E606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Po91ZFZm
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56B0960B99;
	Fri, 30 Oct 2026 14:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id efBUdzqUo7Sm; Fri, 30 Oct 2026 14:07:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 769FF60B2E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369268;
	b=phpKQsEbZsHqGP/fTIuD7OZLS8oyx6JrI394zNxjkoKKCU46tPcnSowLgX60XHYk4OgE
	 rQXSNeHbxcOsUYPV81gup/dBAPiJtNrHxR4+nAAQBL8M6KuURlCu3DyeKIjacNvGoDRVE
	 IjeUH6TE5rOneVltf+GqPy+crzMdfqOUTX3ShQpPM2drcpZAEztfONnSQ0cJX7IQLnMwC
	 3Q104TOY4gHnNhi5wuY00+vTXbpEmxqVujCHfjn7XkqENQ5hcAfOnvPXDWm3iK+ZCNOrq
	 P86xZCJPUXES6DRIEY5rC8wJRNzuwd7X5RcvsDYGElPBgKUxh+MFK37Vq1BkL9IIroA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369268;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=idQarWqq8GfnSaa8sGx6TMNhVKOlRTDqLjleVOnmv4c=;
	b=f7MyzXYntKKt9r3UJkylWCp2lo9eYJguCI/gna0wSgZJChwFsWxNakUpC8bV/qyYzmex
	 YqGkvnnDR84CSkDi1ptUzWohMRHsF3MauwXqe/lGiwKDyJbNJfX4KLkaLcRrAD0WEn+3i
	 DPhrzYL9YSIym7kK2jSInHaM3RRUVCudV+wCoZXJ3hvzqbqxXVC6otInnMzQcGOWAU7Ur
	 0xAKe6w84ML93D/lZnWAxATI4JTLtn1hVOHlAOno13l8DWVDQbkYB9liYYxYKejKIQpfB
	 BBAJE9C/HogP9bkLxXwlzO3X58UuwKjsDW99zC97Oi0o/FJNsTa611nwKkRGrQ/MvSA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369268;
	bh=idQarWqq8GfnSaa8sGx6TMNhVKOlRTDqLjleVOnmv4c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Po91ZFZmAqZg9SECTZVk5uQUADbHCpBpyfYyrLQmMGfYbQXZXo4vzVRGcR5VMDEon
	 6FnUF6PjGUKPwWJewuZAjzR78LFOle0VQhnUOXyXq5yDYuIKfe9zn6XFbijmQ6paLA
	 bvmKWWACqCzkN3bxSN7iKlOJLVJxTH9GDgOEp5vWuO36ttaLh46taFlsYm8Z7YNURE
	 qIocd36Hni8dpYSH8O8u+qSuRxs+uQPNhIUb/V/Fow7JmEky86RfMSoxEzdygLA4LS
	 /uRmVpaKQYobMIXs6+EUkxJ0JO/YCCC3rB3SH1pRiqDLp67lz2ShnADMTuhlPbBu2O
	 j/zbgIYu4b+Cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 769FF60B2E;
	Fri, 30 Oct 2026 14:07:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AE8B0D4B
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9551C40B39
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XlyXueS-VA7D for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D47B140B31
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369166;
 b=ZRby7y4GwG30Y8sV4GT2duinXzSZ0fnM7MUrE/TAoJajcA2QUVFoH3n1us6Cq8OVIkGm
 HvrJj4dinu1GbMycH6MF9jYUqYSiGCFJr8pe5NNpFkR6eXc0nMKZoz/sdDmNYDEjc2Yh6
 eX1kWgkcN19MatEUZkP8TvyKVxHX3VqZBX+Y2NSVuJRpv43g8wV6/utVNpMsZnvDSOV4u
 7FjbKcW7ZnV9PQzD/gNfZ8MnLOcWJlSc2yVTH8IySyDmjdkzb2PutaHHIrKUsPl+sWx+q
 msNSsFv7jwDg+6hvRR0IrTYsswfUU1sdfnbHAJY9Gw+siB+n/Q2x4Lf7ZYFlztZaj3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369166;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Cmb+1t3PhkCr0VLpqXPP5RD8dp1z2xA6GVOw3rUqAxw=;
 b=I3ChBgAX/itKYeDV4HmeklLsx0btnyYy2OJobRCe5q50rwusP/7jQqk6K7q6AJt6Bw6i
 Ip23fMCNotaz23OU4tRWUXGPONoduHz8wbgDo8KaPP2pS1I8/NqzuH2oCF/OhB2tHQuOX
 +ACutqU7tP81iAxGkWx0/7gepKCxDvDK3w1psfSFyH+jrPVy++Zm60PV6BgURs3/6cuhf
 cX42uorLgCrNh1wG6tSHrtEXql//3yCFPLibqIjRrUxhPOpDe9uyzpi7KrHh00P6WuTZE
 EyJxLHJ9hIncoRvd1uBH1j5YvKzhV8/as1zvaQKh/Kg7FMqqb0DW9xj6mKD8niIE7Qg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D47B140B31
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00FCB9D388; Fri, 30 Oct 2026 14:04:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:58 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4f473230ea85fd2c34406dffd4cb671c466187af
X-Git-Newrev: 30ce2661c530f5834a646dbb30e6f5bc7b595436
X-Patchwork-Hint: ignore
Message-Id: <20261030140439.00FCB9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libnss: bump
 version to 3.123.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7448807253315552655=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7448807253315552655==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/30ce2661c530f5834a646dbb30e6f5bc7b595436
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/4b5e60e1b567c823a2a9c3a218d7122868d3c4fb/doc/rst/releases/nss_3_123_1.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: fix release note link]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit aa3603d9df9834a43d5758cade8c633e1d52887d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 31c1315783..0f5ec9c8ee 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_123_RTM/src/SHA256SUMS
-sha256  2145113398a269779a7390515a1638800836b130248e33f93243268c026d4e49  nss-3.123.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_123_1_RTM/src/SHA256SUMS
+sha256  42065a3ff780a9710a3dddcd1cee9b9be2aa40628883cea851d562eb58b178b0  nss-3.123.1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index a47856b03e..3426995368 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.123
+LIBNSS_VERSION = 3.123.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============7448807253315552655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7448807253315552655==--
