Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66169606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nLQHO+Qk
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1316E817AB;
	Fri, 23 Oct 2026 12:33:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zWOYglgbZjj; Fri, 23 Oct 2026 12:33:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4D1B381692
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758777;
	b=Kv+ELa3U9cRwbD3FhryFGwytb3k7t78b/GF9mNQy6Ll7FczPwjIz87zM8iqsG+FfZ3oG
	 DuoVpGAg2Czx5CL8b9fOHJ3JAf9UTLuZsvspYKNwiRyPoZ1V9DuxtPMyuKUMdM9xJoI+T
	 tyeQstc/QIfYlkInPWrVbFd8A0VGvh+Y1sOBoBmAZGD6haGebbg5rvFNgj5uc5TaQNS9J
	 eUj/ol25dKa7QfWJlq3jA9sqRyt7kp5LFRieb+ZVGQFipdat7SbsVKT+Q1U+a4qEgQPba
	 70wOa/e1rKnZYhDl+VKvr2M0Z+SPdChwOSjESjdV52mI9n7c6dfOQSHaAw4PG0T7/Gg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758777;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ahp8iSj0jgXr8akw7WJ2ePkvCIQx8qAU1cZYceJazcw=;
	b=ApnicGGwFY3urzJUz3fRbrA7WB5yHPbGwpkOnuVullzsUpDzI6afNMqi+XEAW9UAYqiz
	 ECcJb8+aXgN5SgQBojhcNFulmTBm8+/qdPcGrRE4pbiCoWOHMDqrNoApmaVcHl3qBR35B
	 6IG6KV16Z4dduruVw4LACwUhQV9DFCRWf0b7LLozvBE5Fe0UdACM2BWo0F1gMatcXtiTz
	 mV0+Pq2u1AW66CL9cr/pu7Q6gpbC7ML1eC103qr5IrfSnjbfYeZF8g/mz7r94eWUF24Qa
	 +nWXWiJY9oejHBTW/z8Wer4kLZcEPR2hAAkhFRBhv0Oi/mJ+Q2fKK8nnDyTQgs9ZDOQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758777;
	bh=ahp8iSj0jgXr8akw7WJ2ePkvCIQx8qAU1cZYceJazcw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nLQHO+Qks1dy4ZE4bLmx+cuw/3Z0SKPcUsxTGmkNI7WDoulwrZp8AjKlaKZHmJZy4
	 yDbUEVqIi5w5c38V8zUvXkowXbMRYKxKAjlBbEtB4tVMTJZ66fpwM789zqPhWUPN2L
	 Ojp1tfbKLngKgYP4r1fKcNvREIWgmQtHmStVPOZeB0pUiBwNgTl3CNB6+90md133rQ
	 CAMwnzShhTz1yE8RtKgi4jRrqcOWpWkKrDiDOSQwDlsikIamAUBw1wydSV++X7jDqG
	 itQvkaSdLRU2+xgspKPmtyNzkDqON1hRRs+wymh2rZ0Mrzikyzk8cipHSTKdLBwMsQ
	 JR2gpkUnuEVzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D1B381692;
	Fri, 23 Oct 2026 12:32:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B0E8712C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 968776068A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eig2pY3zAOvj for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:32:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E73706067E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758733;
 b=piSKprO3RgwW3HmvruExDSXs6FIN6h6I5RKcNfij9MLWHfyM2clUU36F6XD5HI4wIvCP
 3MPe+4ycMjNMeOJCWaF+dYQtq0kicXsLM/kIa3XZr49WXMiy7k3mFYr8dXKbIxxgOS/q1
 JEDGvKyRAe9KQ+0pSsRRVnWcAxANJnqmdcwOHJFG0LMudLiegDpcYAOsVhQVGykZ0htly
 Qq6vMqgBGZ2gKfo2cbrKErEaOwmrFx3iMz3KJCdvSndhRfE5t4FtpAoEx9+kKprfnsxBs
 2DUvhz0ZgxYmQjH15qqabnJVQyP/4EQjBat7BkF/Pd897XNZ3E0aVY54lu6ZtB8IYrg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758733;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pzkIzpb1+5+1SEXR+rvdrIZxzUaB8fBiadLnkoORxtE=;
 b=hX24xgLlfL/jhV4X9cNi8AyO5PahXWr3dlYJRa+SStEzY+DJg12yYfSfkVMYwfYWlxwf
 1BlE8F1vJP+f62VV2IxLghpQPjbajatyaVdy55Nl7W5V/xvy5PnxyBCyHSx5FIaGEuAhx
 E3Y+RRivTQcBZmF542yyE2XwDWYTjvAW142dntC71OVnI3MRYvUrWbRzKEmvljNkfe7LZ
 FZkxA2gWzitArLGNrrXeZuWdhz4dywIfRFiasUuMLJdRSU9+wnkB6FvUJo4SmHUQDUA1H
 +z7mg7xXHoWoZuUQFwvNpT/xVDH6G3BZyzxxa82ygAGJn5gCdU64vrf3kcExARfUvLQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E73706067E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 687DC9C669; Fri, 23 Oct 2026 12:30:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:50:31 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 34a50e1a0c978ecc2fa449737c3b6529be5936b2
X-Git-Newrev: 64ca99d8b18169bad6fcaa57f5974acf28b7d359
X-Patchwork-Hint: ignore
Message-Id: <20261023123049.687DC9C669@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/bpftool: disable
 feature auto-detection for host build
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
Content-Type: multipart/mixed; boundary="===============8525406638432967807=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8525406638432967807==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/64ca99d8b18169bad6fcaa57f5974acf28b7d359
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

On my system:

    $ readelf -d host/sbin/bpftool | awk '/NEEDED/ {$1=""; print}'
    (NEEDED) Shared library: [libelf.so.1]     # ACK
    (NEEDED) Shared library: [libz.so.1]       # ACK
    (NEEDED) Shared library: [libcap.so.2]     # NACK
    (NEEDED) Shared library: [libLLVM.so.22.1] # NACK
    (NEEDED) Shared library: [libc.so.6]       # ACK

After:

    $ readelf -d host/sbin/bpftool | awk '/NEEDED/ {$1=""; print}'
    (NEEDED) Shared library: [libelf.so.1]
    (NEEDED) Shared library: [libz.so.1]
    (NEEDED) Shared library: [libc.so.6]

Host bpftool auto-detects optional features by probing the system.
In my case it finds:
 - libcap which resolves to my system shared object because
   BR2_PACKAGE_LIBCAP=n.
 - libLLVM which resolves to the BR2-built one thanks to llvm-config in
   $PATH. But we don't have that marked as an explicit dependency.

Avoid the mechanism by hardcoding FEATURE_TESTS to the empty string.
Goal is to make the host-bpftool more hermetic to the host system. If
we ever need those features (future xdp-tools package doesn't), then
we'll add the dependency explicitly.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bd10a0172fa27be4d2d9a90a756319dc8a3371fe)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/bpftool/bpftool.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/bpftool/bpftool.mk b/package/bpftool/bpftool.mk
index 1b765ba38f..94be9f6754 100644
--- a/package/bpftool/bpftool.mk
+++ b/package/bpftool/bpftool.mk
@@ -13,6 +13,9 @@ BPFTOOL_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.GPL-2.0
 BPFTOOL_DEPENDENCIES = binutils elfutils
 HOST_BPFTOOL_DEPENDENCIES = host-elfutils host-pkgconf host-zlib
 
+# Disable the auto detection of features on the host system.
+HOST_BPFTOOL_MAKE_OPTS = FEATURE_TESTS=
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 BPFTOOL_DEPENDENCIES += libcap
 endif
@@ -28,7 +31,7 @@ endef
 
 define HOST_BPFTOOL_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
-		-C $(@D)/src
+		-C $(@D)/src $(HOST_BPFTOOL_MAKE_OPTS)
 endef
 
 define BPFTOOL_INSTALL_TARGET_CMDS

--===============8525406638432967807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8525406638432967807==--
