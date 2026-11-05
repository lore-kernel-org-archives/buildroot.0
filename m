Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08685606A32F
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GvGdLyXu
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1D27814EA;
	Fri,  6 Nov 2026 16:08:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lEz4l32nQ-23; Fri,  6 Nov 2026 16:08:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 64252814C5
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981320;
	b=A2gxKchSRSKQRRc9FEqKXAciUc8ndJ+OGk4+oVhZ2Bzw3FS7Qvv/c++Hu5Nvo/+D//x8
	 9dWhHkK2osa88N4NtqR/c1CJw3bjLE7W217g6nKkiDfLf/N8AluSHLX2j9+UbAWvXUEmu
	 wkLGKiua8fYs5K9iPipdf3aV3rTS1hfNzdXb3C4TAAFdyPj+ypAX6QMrFOQBoYHFOHesV
	 1d1ds81P3VwO3hyrZJiqvFSWCdjilawM8k1VHsOnJk287J34EPxlrOqpNk+q30NrtwV34
	 IaKvHT2hHB4Kro4GEWxbTSht/wNvVc+OBUn3KxyqLbb/bqyb5T9030sGyU9MTpHfgVg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981320;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=A+HMG4dN07Y8AuNdD9s7Lapo/+owfN9Jt4tXHN+yfeE=;
	b=R98FlCVAg9diwutmWy6K1ii1NBbu0nvZhtKKdRMVi1g8o0qZDuZxWMPhB3fiHpVaLwbE
	 mUWb8stPt6CHN0nutsH9V5dVNwFKVHSsAhdYR2jgPRwYYV+kt8EXDxVEMlgMmjaFoS0X5
	 GofCRDwWGk8uw1ccWuTw7nQe+tK8mRQ5oWVt2IwMn+ayZUdzPOLqY2vmDxOc6zpA3kA2N
	 9Xgg7RP/pXzxnx83o3g51hOncPmPLnvW6aTWffnK1qvfvmSmeBWfBEZ1/FNwVBBh83LmT
	 0DcuGyUl1BPjXDVOhTA87JJtwIXdNbxi6/BPy6eDq06fFYv7ywURlIhq+a6wFmfrqTw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981320;
	bh=A+HMG4dN07Y8AuNdD9s7Lapo/+owfN9Jt4tXHN+yfeE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GvGdLyXugvbgBKwcQGzkVklhuAWwIRI+Mpe7L66wAWKhLSwWCknT0vzKMNOCjOiGn
	 kIZqbGmJCQ5jSluR/ptJrvIg8TQ/5yGqMrya/FQmrJt8uJ8vdjlrVHLixRnRIs/N1x
	 WkP2mV5MgjwWTNqSGa5cYcEqPO/x5aMCcogKlFjE3ESDsi48vGnuQXra7utv9sx6XJ
	 nI+EC4gt4SNhYNQoprDGtMm/SII3ngvvPFJyFEL3JRT2Cq8eoj/Oy9TUeQ8L/asDd+
	 wctcMPLcV7o3Bv7uHxc6wVEaq6SdtvFs3tUzvOpndWwoCMhBXza0ia6xGH4PPH5cBH
	 SonUNQykoRahA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64252814C5;
	Fri,  6 Nov 2026 16:08:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F7914B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41A7360890
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YI86SHrz5l42 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8AF41605A7
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AF41605A7
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B40819E0B0; Fri,  6 Nov 2026 16:06:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:57 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 606696492331577e201889857e5f769972db8ad3
X-Git-Newrev: f9eb30c33d22bb8e78cdfe876fc9a62cfcd72df9
X-Patchwork-Hint: ignore
Message-Id: <20261106160653.B40819E0B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/systemd: bump
 version to 258.12
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
Content-Type: multipart/mixed; boundary="===============6564827430939196044=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6564827430939196044==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f9eb30c33d22bb8e78cdfe876fc9a62cfcd72df9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

This is a stable patch release, no changes to options/services. The
default for the dns-servers option in meson_options.txt has changed to
use different domain names for the Cloudflare DNS servers, but the
same IP addresses.

Remove patch included upstream [1].

[1] https://github.com/systemd/systemd/commit/3ed9869c4780846b4a5380bf921073fa2fac0730

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 210e86765e62428633862d74e6daf7447f31eb45)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index e96d3ba7ad..cb652998cd 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  6bd311c25f00d634ae3b4544d582e27df0d4166e6ba3d403b18b3129d7f44cae  systemd-258.7.tar.gz
+sha256  5062da9c9b0b6fd3ed0efaa2c6ec37be2e634c6e516abd6275ee42f85282c891  systemd-258.12.tar.gz
 sha256  ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3  LICENSE.GPL2
 sha256  6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d  LICENSE.LGPL2.1
 sha256  c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  LICENSES/alg-sha1-public-domain.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 3223915d40..1f4f55f465 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 258.7
+SYSTEMD_VERSION = 258.12
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \

--===============6564827430939196044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6564827430939196044==--
