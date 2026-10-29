Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A5C606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ElbwYFzT
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EA9A81297;
	Fri, 30 Oct 2026 14:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2m4ppkN1iRTh; Fri, 30 Oct 2026 14:07:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6639A81289
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369250;
	b=ZxzbWLsyiqqIRP15Eh2wnJHnYoZBGQKiQ7MgSAP2M6zqqQf0hPMOcMQ7YRpKqhPE5YFK
	 9CU+ecz1kKVzRIGY884MZ48dMnQRpZSamy14djL//JSNUEvr1ON6yhYeCJL7PfSZJ7KbL
	 fC4UHlx1qSHg/zlcvncejxWTogawK953znNIxWgV9RL4zSP1xKv2YOOfPqTg+9B8CaQV/
	 xcXTpftEHZ/f/lpQQmRnEv2XopBlcEoEMjdQHrOG2ZEJGFerTnIaoySQumVf3jfmG/pft
	 WJmPlwI/ufti8lAM2ghYNmx47RGELN01v8tYxIpi+gCNa+Au7jeh3jbnvEJlxoQoOuw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369250;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=GECC5dAAIUr8eyQIBCryk5AyJ0O0R9iTfm1EX1BWesU=;
	b=olbNzv6Jya5f5E7F/I4OFjiqjZDDWkeZ+AKHzYjFDHOnuRQBqwXX9k0xfQEEtbvkln8S
	 S2mty2boOgF1LHyf8ObaMIsYvNSjAAl81c/Oo73lGQx8yO6tpAC9lfEJMv9Qcycn1PIHf
	 X6N4qX1N9hnT7yXzL48IfUwrCipzF4XgkA4DaI4qxgEzdJDaZjam+7Cb41rvehMf9kRvv
	 X7YBvotwO42/E9oCRgs5/ub8VvTsCL2amsxjm80m6Gk0rmkfuIj11E+VKJxW/5Ye1jGTC
	 Yh0qRyeoeJdCWlI8rPRGtHzR9EBSntH4OrS8mexh9HgGGw3dhBXIyEiBCRjBy5XFZ0g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369250;
	bh=GECC5dAAIUr8eyQIBCryk5AyJ0O0R9iTfm1EX1BWesU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ElbwYFzTHP2+ynUZN/MMKGVvRQexAdVt+JXkA2lVSGkDQMa7Cw9LgwwF4eurS8bd/
	 v7hYIBxKSHAh19b5vkIJyjikI1zaedkHR8EboaTVLKLFod1L9F1YVbJHMJoGiesXPk
	 g+GgFFgVigOaAQ3mLoHcJQUMLPj5v3ObVH+xn/koOaZiRoubq3JnW4clVzmmz3yi8j
	 dsgN2PaUlQgk5Cgws2boeC/az9Z6URhW7Dz1Yj2s67ym2R8S55OyW1hLFQzlhVCMHm
	 UaNB/96qhwPGzXyyHzob66OxjL1A1WqrPcxgs8oqcT39P8LO9Cu8dd89fbO3j0jBBp
	 7y9ZAKKIfnmkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6639A81289;
	Fri, 30 Oct 2026 14:07:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 72005D46
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57865811A2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5NlDXQOsg00 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 65ECD81199
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369166;
 b=QS8HRP1xzsHq1oKeTv4oM47dPm0Enz9xFV0ZAhD5PfAUHQF+oQtcRshr6c+q0Unljr+Q
 C1atNRYsLMNnIqwYJ8S7fmFCTqrDNiXQFQ9wcnqlJl3g271bYPvkyOp5kh4OGnWiWDlam
 SipAw0l41KGCrIPAUjOWsER1ZLsplJ85qWm6FjcWpgcahZJ6j+g/nvdY9dbw4boANQ+F5
 s0mvtHaU7T+YWoixByQo6d1qY0lSPW9EFwHz8rZ5ulHULEm0/IjFJE3SuGDh7lqdRoS4L
 84ra2ayutouYVv1fK4VaSqyrWqH9e+xINxoXSO+1HN8hJBIlQIleW22k8xw6FQ2yy0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369166;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=RtBR7OqA2zkq2YCTqYHbRNQErMzKiivtMX7QMfMqIW4=;
 b=ZIx7Iyy87DLnx5ocnyg9KvXUp3+INP8RP4TyTPjSJ53T+vq2QAtJojbluGzVZ7qMdp0s
 3EoNKlZen3/U4DSP4/kP+qRTwiPf12+DZXg3OUPyzektDqxGlLD3GLtAdU7TNMik2f77L
 WX/aawrccX1IgAn8Kh5aDJ2rcJRVEH1HtNoQL091Rj83wWudwd7pc4xif53stkvvba8fw
 3yMC3anEjdk6ldzGn3f27LiWc209IYHwlHynDdMQCqvrKs1sHDXawt9lkObj2f1cMn7J0
 8HJBvfAA6OEfuoXxT8gs7Zv8usWw82i0LhTJ61ttBKCab1VP9UuXvTiI8wGjZO/nD/g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65ECD81199
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85B229D38A; Fri, 30 Oct 2026 14:04:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:58 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c1f8c650c784637bb56abbac7c0fa9f02fb2a3c8
X-Git-Newrev: 7280e88ce53ea302ba9ea20ab1ad9b76b906d447
X-Patchwork-Hint: ignore
Message-Id: <20261030140438.85B229D38A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libnss: bump
 version to 3.119.1
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
Content-Type: multipart/mixed; boundary="===============0368448252613874719=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0368448252613874719==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7280e88ce53ea302ba9ea20ab1ad9b76b906d447
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_119_1.rst

For release 3.119.1 tarball change from nss-3.119.1.tar.gz to
nss-3_119_1.tar.gz so let's fix it accordingly.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0f303f3abc4dff953f249eb137edfc389e774320)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libnss/libnss.hash | 2 +-
 package/libnss/libnss.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 1b15364a93..0581592c63 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
 # From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_119_RTM/src/SHA256SUMS
-sha256  e8412db6c9d6f531e8adfe8a122ec33a8fae920681ff47231a1349bdd399f0e9  nss-3.119.tar.gz
+sha256  1387b8478e6c681c533b1f7b0f4d4ef7f58307c1f7e3a353622ddbf841328283  nss-3_119_1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 43b1b60f98..db71c0018d 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.119
-LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
+LIBNSS_VERSION = 3.119.1
+LIBNSS_SOURCE = nss-$(subst .,_,$(LIBNSS_VERSION)).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
 LIBNSS_INSTALL_STAGING = YES

--===============0368448252613874719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0368448252613874719==--
