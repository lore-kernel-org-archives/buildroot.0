Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470C6606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iLdnTRYP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qbP4XAIw
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2661040B6A;
	Fri, 30 Oct 2026 15:25:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rJrjN_wB0iIo; Fri, 30 Oct 2026 15:25:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B8F6D40B71
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793373902;
	b=j3hj1RsUEHUEx1sFfF6FUX98y2zPvEXOBEtYallsi2X27Y5FW0FygoJk715tbf+intaw
	 pVKMt7Qj8EbKsqr9ssLV6e0PQ5IVoKPPJmTHmhqBnTVx8o6h5TtbH4equl/ucjvfJIHbk
	 WzYzU7KG1AetKccWNqEeYM4QU6X+fl8DjnGZN0dQsWiMsDtryLlO9EmGA3nANk2PE6VpV
	 gEvRWzRBYwObay4dL/5ebFiQN5nSjUzSeGwvNk3zU5nQAd5uW9npfw7XRuBEXNj8UinL+
	 eEsHhwyI2T22Qlho7DJHgp/t+cD+gugJiqw3805+ip9uYOx40Eov8n+ysVkY1LplZhw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793373902;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=k0iofwqPJ9EMOJ80aY/AvbWCag1vowb5OZC0imry3lg=;
	b=Wa/rOsmNqeQ9Sgk7B51xUPuigo6bqp1CaYRP3xP3DvxxSnd4v2IJYcwWG2/lCc6tBhIn
	 PeWtZes6OJ1LNBqTV9dEVCH8WBSk9eA2/Ow/q9gOCviAgQRnVPxoEungehPeChbEPM4iQ
	 pPcb3VnPOAgxLg5Zw26rSXFNzJ7U7OjEOk3P19mmQDfH9T8kuomQ3ecZp8QiNNkdOlgPj
	 ll8ZIPGEHHxZJWPZGCCyYEBEczZvTuqqEd89IEPNHIZYMBgyDITxJAKP45n5VQVyzdy1k
	 WyFnGZRvU7zCBauoVRBCQgDUXJ3iN9dv/VSp9fI6IHv2pbAoY39vejY4kor5lN5PVag==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793373902;
	bh=k0iofwqPJ9EMOJ80aY/AvbWCag1vowb5OZC0imry3lg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iLdnTRYPq6f4yZ21gvrXq2GYokZwPu5mIy7N5Q2kgWZ3HJjrB6X/CSrGlRHaleChW
	 Pu4X8xUuSYfwwh6UN5T4cuatDO9mIUIGhLmA1Lu8d2Ra4ur4QaPcHtMtfdn9AHZC7/
	 DEt7j9NwtpXDrRAmnkpeCHrxO+mstzVQS8zAqW2yz2rbu5oEbfvT18R+8SRlqZkYy/
	 aTaYlk2QroatCZQ9eiGQKqcbl0sCpatSg221UDXXteXZySWg7+FCT/LwjhNTnRhUub
	 gmw65B42HQbG3NbYupGHKZlnhE0ADL+CPs+XWEgzOpCwYDsdb0w6UQwlESkHi0L1N6
	 utx5YSuuarZow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8F6D40B71;
	Fri, 30 Oct 2026 15:25:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 72EA13AF
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5822960A90
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3hHMpfd8hmzQ for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:24:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E55736087F
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793373891;
 b=EcfwFNqfNO1Pfc1SxQcVbCcySRlEOByH9lDzfyzrt6+y2txE+HJNPlaJOBnDKuJldt0l
 9ROwxXwCGMxxRr7k3YE1Hzz/l4a+cfj5vUxG6H7ds8lyP6Zl8+UTmyfFPxmCCRzPAlgJM
 VFlNkPs9LNJHBmMuVJ5k3P8a7lrsHVDAATrQKK+NFJ5Q9SqVNe/3PYVzLODcbxRFn7Ml0
 2vvRFw08FKry8LaLgsi3PmIk0MqCMxCKyEU9iLs2/wmpeKH4Y4zVzCqQxEn4WarDZPX74
 F4gYBxJ8j60bqaFSBXkZbYjHY27Ghlzc3YVJ0soxaB9C0R73tf9M1LGXeZNb67+M7/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793373891;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=K0qO4Xugb33XJDX1WQ/0N84/N9n06Pxh1ywr2KJJwQU=;
 b=RoorwE74z0Rce3eDBVXPkl4XU4C4N9nXXo0DW33dhPfw6cNdX//+aOV58KzEucr3rWFO
 mR+IH/rEO+uYdqVKmcsx2fD4s3s73RUaVX98OFqt1uTc8fEQnZZxhLIRqZa2wpVZNvMAt
 SwKdIhmR/9Q/SCSUahi5slmjUQmbR7nHuwPF4PLhiFdhkwzy+8UfIwtv2ggB4qRiPn4U1
 en90qINMn4prTV3rOunqG+uf/8Wwqe4Pm4IRVT8cceQBu65ZTi5AlXnSsQMa9FfkbSzTk
 Ki+q45tdstrcjTOfd48SgWRE06nk6aBDc+nWDz8kNuSCDAZk/Ij2cbRTqJAMjK31Ysw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=qbP4XAIw; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=qbP4XAIw
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E55736087F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:24:50 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48e0d885929so692642f8f.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793373888; x=1793978688; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=K0qO4Xugb33XJDX1WQ/0N84/N9n06Pxh1ywr2KJJwQU=;
 b=qbP4XAIwKCePYV4k+5Co0fCSwCiZN078N9vFazEMBCPQ2CW9lccambfCONtFLHvRno
 CjcDgrvaYHLAx8F5sVMrbfahmFkkdPb06W8MXKMFJALTMhVU4+slPu0CxyqrChe6+ZpS
 0CwdymoJpO6D34pkxe7c6FCSLmyXHIh7slIyBS9AlBD7777XVMcA8Qf7oYd7yDKWflj1
 f8sxAHV0MJClFhmdEAgwy9etkvUUEJfofXABraZWDSI2uREFll0i5JwN+ZamAj60A/XD
 PgVzwizCb+sqr7IUaLHhv4ZeCy8MQTA+LO+hbTMIlkFcZXkclHxe5aShP9VfcCCX3jz+
 caqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373888; x=1793978688;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=K0qO4Xugb33XJDX1WQ/0N84/N9n06Pxh1ywr2KJJwQU=;
 b=Mgus7Lb5wWswrMfnDKuRsKWSNSpEPMKkaJO7psRea0OTHnhNVbe5WqwtGk35eVEwSb
 0i5z0HvZUIYDYKODHZex6+Mtyk1WFBu2ysx+6IA/CA9XVHWh6hbofsYcuTNoqnJmFGxf
 G9Iu/70q0tQdykGJOGfj1pJ/uQMc46S/hqTQsXvQ+alPYEajUqa7UURUmmX96o7RLpso
 XfCY2LIGnAnUJxgwVhTl9vcPDOkcr6awOKPf0uVCIg/v9l66wPs4f6ZRPLOEuEo3fEx7
 SsmEi3CSO0FS4gPTHu+H+XxpYj1zuLZB7Ii9VYiq6tnvzuIitFWXUPz113kWChCw4WK6
 /Pkw==
X-Gm-Message-State: AFq9FYJUkcTxfZNmO0qDXYvoaG7bGwhbyPG21J4rkZlqprgf3k5I79XI
 jnjMGu7xVHpLzpKShwmXMDrskUcpPwwWrNHAnO6s5EbdE8p1ribNW+VsTcpD4w==
X-Gm-Gg: AYBFou3F1qrOvtFeogtVgJXvSKvu8i2cxP0eA/Rw1mBxQrzWG8dHpbKO88a3/wB3qoQ
 K8fpmHIkPVxzAyRns6/OQn1tnRrz56yoATGGknh62cW3cvIOLAt4qpiSTBh7dbilBvK/5GDQn04
 IIgxgQfzx5gJWIht24IXyJRcqdSI68tUqAsn4ZDCVRleIlcNQlAKRrpJlpj9UbmcCXnehK4S50C
 eCiDbcJn0shN3X5WoC0tYUapeVMT2uJ4t9ArZq+iR9c4Bx5gwXX24bikjZ4gCf3nu/Z0/oONH8I
 oCI1rtIiHUF8xns4sbQj1fAVO5jtp0osG5FSbbRjQLjnrSxPzrawkYnn+Jx3ztG27oXispKtOn0
 YrEWuLe9SQmsRNvkFTW/PIme2hitrPvrVO7TGDYTvrS4AJqBfe7pg7XWVl3/5DWtvyeiPqHfHYw
 kcm/BxjTWe5jLFh5CXE91InKlRjcXeP0GmC3uoggxfJBrnggk1+exK9u781n4VpUV+6AVXfX9S8
 7IG3B61My/9mjSF9kNW7GxUAU1QrKQ/YeNjL5UvnOUSOFRcEUq0N4ZAVohsUqv69EnYMWUfdfuG
 7fiqL0QpfpLfMj+sBtSBAEwNcmuunus9U78w0xomeFDnhvR/LjnqWA==
X-Received: by 2002:a05:6000:26c8:b0:48d:f14a:9183 with SMTP id
 ffacd0b85a97d-48e6e303b1dmr6446331f8f.15.1793373888301; 
 Fri, 30 Oct 2026 08:24:48 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b8c0b6sm3540180f8f.41.2026.10.30.08.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:24:47 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 16:24:34 +0100
Message-Id: <20261030152434.3738285-9-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
References: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 9/9] package/sysdig: add sysdig-legacy
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add sysdig-legacy, providing sysdig 0.31.5 on 32-bit architectures. It
is the last version using falcosecurity-libs 0.10.5, provided by
falcosecurity-libs-legacy, and the 32-bit architectures are now enabled
in falcosecurity-libs.

sysdig-legacy builds the userspace libraries from the
falcosecurity-libs-legacy sources and links them statically, as it
doesn't install them.

To keep the build small, it uses the minimal build, which doesn't
support Kubernetes, Mesos, the container metadata and the eBPF probe, so
it doesn't need grpc, protobuf, c-ares, libcurl, openssl and elfutils.
The full build can be enabled in a following patch.

The libsinsp examples are not built, as they are not needed and fail
to build with musl.

Patches: backport the upstream switch to C++17, as needed by the
libabseil-cpp headers included by re2.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/falcosecurity-libs/Config.in          |  3 +
 package/sysdig/Config.in                      |  7 ++-
 package/sysdig/sysdig-latest/Config.in        |  1 +
 .../0001-CMakeLists.txt-build-with-C-17.patch | 33 +++++++++++
 package/sysdig/sysdig-legacy/Config.in        |  4 ++
 .../sysdig/sysdig-legacy/sysdig-legacy.hash   |  3 +
 package/sysdig/sysdig-legacy/sysdig-legacy.mk | 56 +++++++++++++++++++
 package/sysdig/sysdig.mk                      |  4 +-
 8 files changed, 108 insertions(+), 3 deletions(-)
 create mode 100644 package/sysdig/sysdig-legacy/0001-CMakeLists.txt-build-with-C-17.patch
 create mode 100644 package/sysdig/sysdig-legacy/Config.in
 create mode 100644 package/sysdig/sysdig-legacy/sysdig-legacy.hash
 create mode 100644 package/sysdig/sysdig-legacy/sysdig-legacy.mk

diff --git a/package/falcosecurity-libs/Config.in b/package/falcosecurity-libs/Config.in
index 079dc1f376..a897cadd90 100644
--- a/package/falcosecurity-libs/Config.in
+++ b/package/falcosecurity-libs/Config.in
@@ -1,11 +1,14 @@
 config BR2_PACKAGE_FALCOSECURITY_LIBS_ARCH_SUPPORTS
 	bool
+	# falcosecurity-libs-latest
 	default y if BR2_aarch64
 	default y if BR2_loongarch64
 	default y if BR2_powerpc64le
 	default y if BR2_riscv && BR2_ARCH_IS_64
 	default y if BR2_s390x
 	default y if BR2_x86_64
+	# falcosecurity-libs-legacy
+	default y if !BR2_ARCH_IS_64
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # re2
 
 config BR2_PACKAGE_FALCOSECURITY_LIBS
diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 35f28bf6cd..f00f6c4762 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -11,7 +11,8 @@ config BR2_PACKAGE_SYSDIG
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # falcosecurity-libs
 	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 # chisels
 	select BR2_PACKAGE_FALCOSECURITY_LIBS
-	select BR2_PACKAGE_SYSDIG_LATEST
+	select BR2_PACKAGE_SYSDIG_LATEST if BR2_ARCH_IS_64
+	select BR2_PACKAGE_SYSDIG_LEGACY if !BR2_ARCH_IS_64
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	select BR2_PACKAGE_YAML_CPP
@@ -38,6 +39,8 @@ config BR2_PACKAGE_HAS_SYSDIG
 
 config BR2_PACKAGE_PROVIDES_SYSDIG
 	string
-	default "sysdig-latest"
+	default "sysdig-latest" if BR2_PACKAGE_SYSDIG_LATEST
+	default "sysdig-legacy" if BR2_PACKAGE_SYSDIG_LEGACY
 
 source "package/sysdig/sysdig-latest/Config.in"
+source "package/sysdig/sysdig-legacy/Config.in"
diff --git a/package/sysdig/sysdig-latest/Config.in b/package/sysdig/sysdig-latest/Config.in
index 2af84e1917..5cbb10f5fb 100644
--- a/package/sysdig/sysdig-latest/Config.in
+++ b/package/sysdig/sysdig-latest/Config.in
@@ -1,3 +1,4 @@
+# sysdig for 64-bit architectures, selected by BR2_PACKAGE_SYSDIG
 config BR2_PACKAGE_SYSDIG_LATEST
 	bool
 	select BR2_PACKAGE_HAS_SYSDIG
diff --git a/package/sysdig/sysdig-legacy/0001-CMakeLists.txt-build-with-C-17.patch b/package/sysdig/sysdig-legacy/0001-CMakeLists.txt-build-with-C-17.patch
new file mode 100644
index 0000000000..d033e0eddb
--- /dev/null
+++ b/package/sysdig/sysdig-legacy/0001-CMakeLists.txt-build-with-C-17.patch
@@ -0,0 +1,33 @@
+From 1b544d328d0afbde2f1443a3f4cb1ef332d65592 Mon Sep 17 00:00:00 2001
+From: Roberto Scolaro <roberto.scolaro21@gmail.com>
+Date: Mon, 5 Jun 2023 12:41:02 +0200
+Subject: [PATCH] CMakeLists.txt: build with C++17
+
+Abseil, used by re2, needs C++17.
+
+This is the C++ standard part of the upstream commit bumping the
+falcosecurity libs to version 0.11.0.
+
+Upstream: https://github.com/draios/sysdig/commit/954e6fc6238f21d4870a491395d68a7dd3062aa9
+[Angelo: only keep the C++ standard change]
+Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0309d66..cadca83 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -90,7 +90,7 @@ if(NOT WIN32)
+ 	endif()
+ 
+ 	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CMAKE_COMMON_FLAGS}")
+-	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CMAKE_COMMON_FLAGS} -std=c++0x")
++	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CMAKE_COMMON_FLAGS} -std=c++17")
+ 
+ 	set(CMAKE_C_FLAGS_DEBUG "${SYSDIG_DEBUG_FLAGS}")
+ 	set(CMAKE_CXX_FLAGS_DEBUG "${SYSDIG_DEBUG_FLAGS}")
+-- 
+2.34.1
+
diff --git a/package/sysdig/sysdig-legacy/Config.in b/package/sysdig/sysdig-legacy/Config.in
new file mode 100644
index 0000000000..dc485a0fba
--- /dev/null
+++ b/package/sysdig/sysdig-legacy/Config.in
@@ -0,0 +1,4 @@
+# sysdig for 32-bit architectures, selected by BR2_PACKAGE_SYSDIG
+config BR2_PACKAGE_SYSDIG_LEGACY
+	bool
+	select BR2_PACKAGE_HAS_SYSDIG
diff --git a/package/sysdig/sysdig-legacy/sysdig-legacy.hash b/package/sysdig/sysdig-legacy/sysdig-legacy.hash
new file mode 100644
index 0000000000..efdd73b201
--- /dev/null
+++ b/package/sysdig/sysdig-legacy/sysdig-legacy.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  9af98cae7c38273f7429ba0df628c9745bd92c949f444e180b9dd800af14c6dd  sysdig-0.31.5.tar.gz
+sha256  a88fbf820b38b1c7fabc6efe291b8259e02ae21326f56fe31c6c9adf374b2702  COPYING
diff --git a/package/sysdig/sysdig-legacy/sysdig-legacy.mk b/package/sysdig/sysdig-legacy/sysdig-legacy.mk
new file mode 100644
index 0000000000..c1252dfd89
--- /dev/null
+++ b/package/sysdig/sysdig-legacy/sysdig-legacy.mk
@@ -0,0 +1,56 @@
+################################################################################
+#
+# sysdig-legacy
+#
+################################################################################
+
+SYSDIG_LEGACY_VERSION = 0.31.5
+SYSDIG_LEGACY_SITE = $(call github,draios,sysdig,$(SYSDIG_LEGACY_VERSION))
+SYSDIG_LEGACY_SOURCE = sysdig-$(SYSDIG_LEGACY_VERSION).tar.gz
+SYSDIG_LEGACY_DL_SUBDIR = sysdig
+SYSDIG_LEGACY_LICENSE = $(SYSDIG_LICENSE)
+SYSDIG_LEGACY_LICENSE_FILES = $(SYSDIG_LICENSE_FILES)
+SYSDIG_LEGACY_CPE_ID_VENDOR = $(SYSDIG_CPE_ID_VENDOR)
+SYSDIG_LEGACY_CPE_ID_PRODUCT = sysdig
+SYSDIG_LEGACY_PROVIDES = sysdig
+SYSDIG_LEGACY_SUPPORTS_IN_SOURCE_BUILD = NO
+
+SYSDIG_LEGACY_DEPENDENCIES = \
+	falcosecurity-libs \
+	json-for-modern-cpp \
+	luainterpreter \
+	ncurses \
+	yaml-cpp
+
+# sysdig forces the bundled version of some falcosecurity-libs
+# dependencies, unless they are explicitly disabled.
+SYSDIG_LEGACY_CONF_OPTS = \
+	-DUSE_BUNDLED_DEPS=OFF \
+	-DUSE_BUNDLED_B64=OFF \
+	-DUSE_BUNDLED_JSONCPP=OFF \
+	-DUSE_BUNDLED_RE2=OFF \
+	-DUSE_BUNDLED_TBB=OFF \
+	-DUSE_BUNDLED_VALIJSON=OFF \
+	-DCREATE_TEST_TARGETS=OFF \
+	-DBUILD_LIBSINSP_EXAMPLES=OFF \
+	-DSYSDIG_VERSION=$(SYSDIG_LEGACY_VERSION)
+
+# To keep the build small, use the minimal build, which doesn't support
+# Kubernetes, Mesos, the container metadata and the eBPF probe, and so
+# doesn't need grpc, protobuf, c-ares, libcurl, openssl and elfutils.
+# The full build can be enabled in a following patch.
+SYSDIG_LEGACY_CONF_OPTS += -DMINIMAL_BUILD=ON
+
+# falcosecurity-libs-legacy only provides the sources of the userspace
+# libraries, which are built here and linked statically, as sysdig
+# doesn't install them. Don't build the driver as part of the 'standard'
+# procedure, it has been built by falcosecurity-libs-legacy.
+SYSDIG_LEGACY_CONF_OPTS += \
+	-DBUILD_SHARED_LIBS=OFF \
+	-DFALCOSECURITY_LIBS_SOURCE_DIR=$(FALCOSECURITY_LIBS_LEGACY_SRCDIR) \
+	-DDRIVER_SOURCE_DIR=$(FALCOSECURITY_LIBS_LEGACY_SRCDIR)/driver \
+	-DDRIVER_NAME=$(FALCOSECURITY_LIBS_DRIVER_NAME) \
+	-DBUILD_DRIVER=OFF \
+	-DENABLE_DKMS=OFF
+
+$(eval $(cmake-package))
diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index 3ee54a556b..4bd40f51a2 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-# sysdig is provided by sysdig-latest.
+# sysdig-latest provides sysdig on 64-bit architectures, and
+# sysdig-legacy, the last version supporting 32-bit architectures, on
+# the others, see falcosecurity-libs.
 
 SYSDIG_LICENSE = Apache-2.0
 SYSDIG_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
