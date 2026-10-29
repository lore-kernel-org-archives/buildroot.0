Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AD8606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KWgyYdOz
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3564C60B66;
	Fri, 30 Oct 2026 14:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ceiCRXMAAHo6; Fri, 30 Oct 2026 14:07:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5061260B7D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369259;
	b=XpnLnXWjzKqHGGlWTlIfADgyarot5jo9lXGuW0k0zGQKYbD38FgyjBSA5ykQVQ5zmXeY
	 sHIFWQzb4T08a3Z2EbZRnUkZF+MpSrM2aRbXpJ4leHSn4f7004rmo+Ek/7I58JGlq2X6B
	 DBg82trh814lIb+Qj75YHgMZ4tO09iyinJ8/qTWdhqd1wXiW0682vdmXrAYLrWcCuwrBb
	 S++U8XDXmeyqnfcC/ZEEoHHMNHtM4P883hWvbbrKc1PL7oADruZhWvZqiSzkYLoOptcHO
	 mn4ibMcLQcBhMNZEyiKMH34Bg3ScMiplQ7KdhKiYUtpBtR0Ii/JCqb4Zr1SaaxbSLxg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369259;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=6rOM7SydZOkHKUK5tENHVTI2BOxIp4EeDtKJtwEq4f4=;
	b=TrHlWWteA2F5rO8eg1dmy91HfGSM9WC4nDYfUAcwQSdFbLsVGyRcKCZQfBtUR7YaLvDs
	 QDllAzWgVQdBVSFt7qVLMqN+evVZeFc/pq+MFaLAlN78M/8yIH+Hos9QwBkM3pivIE+qq
	 tWr3gqF03zyim26bP63qvlg4Ykik4UY0zv2Uk5m6kB88o87LGpfuB3o2vvmuCCyAw0dWV
	 BnRiTfnWeDTehLuh0ex08TGUfquHWhGm8M6Vfe3rnKDlpxzbLHKpPHdmq6DxLxCFZ+VVB
	 0fx6Rsc6Qr7yKJ4YevgII3Cwm5cXzZI/ANoXny5kW95cRZUccc1oVm23F2C6KzLSeqA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369259;
	bh=6rOM7SydZOkHKUK5tENHVTI2BOxIp4EeDtKJtwEq4f4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KWgyYdOzSp8OIJdaLBbfKD4YUJz+dphB7se0TlPxvtFBMakS+/gxRSrvO/YS2nozo
	 plO/RsKlzuFCcIawo4bMpfG5GoQZDnylDdgFRKsHPFilnvngwqExXJTZOoFL3wtCwI
	 7IL/fyCYI4+nkuiI3MmJtCIxd4FSrXdDwSt9lb1q0wSqmP3zb/7oUuBDa2ahKqHFvz
	 f+v2CQIy6ZfXoJGlDSUDvyInWwY+7U/6cZA9vNf3BU1KIYhEZ8tAY401yx2DnEETET
	 YoZKxBrI2/M9+XI4nLU5AF6i2bkfBLKdkXGvd1eg5fqRtS1PE5vCptbx0i3eieXGXB
	 qXBX2DXny678Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5061260B7D;
	Fri, 30 Oct 2026 14:07:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 92CFDD38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7673D60AE5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MVJobLnVlguc for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BEC7360AF3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369165;
 b=A1NKtThcv6qzDPQTUW/ZU2CPPQGyD64mNMnW4Y+2G6A6SVf1CyBavkA8ZNRnxwjPPwfR
 Z+D4Z5rJfKfFXccuFoaGq+D3vZDW8saCiANu8KghSTZhaOQ8Q7Bp6GErQscDlMDXLAzyF
 EybyLrPDbklstz6nWIbljFbJmcjplEsbrFbXssJbgzSIithBYOM2p7oLsUqRcwOcZ4j2s
 nvwDkqkRZxP7OV0w6MxVWptL1jTmVZsSzk813T62WIRXM3ZpTPXqjnvQBYG2yfvo6wEqR
 u/KDBiAmHASFjbGAjbH0sWwyiyvocPXiSdbXs3GWFbTkincjhYotpmdrZw5eQMYw5lA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369165;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=+xctvRHZ+i+LZhci2xf5VOA7CFZM2jEdQMIruoOBX7k=;
 b=pPt3gmzbmXGTUbX52ZrF2fSDHm0pgnbI9QrD60th48HUFbHvGVgs6fI4TSQTO/hAQ7n1
 sbgPyRd7twaipmXkZMYuDiTaT2PzNVkZBULvD84/Evji/tVCH/B4ykhLOxzmdhFvrYTei
 NEhwsc1HwUtMwrxDhVK6NE11lpSVldMJppUuUWirPdaFP2A31/dQes889Rgk6nO3hDY0P
 SiXyf8he3rSUfqvoNrkcox4AmRf0bXLdGv5cdDQWR6NsX5tqx/mSpRir+NmXH1j+C6ZcN
 dMmwKFr2YUpQ6xIr5dXrciwh4lr7vwTPI4nvt6QpQbWPEPpQju//TsauD4SEG5QmwNQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEC7360AF3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D27949C668; Fri, 30 Oct 2026 14:04:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:57 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 900b7af13138a00f1ff11eac09c1f3561ffb382e
X-Git-Newrev: 8d226856b25d69f540afcb0ce46e554e2211b61f
X-Patchwork-Hint: ignore
Message-Id: <20261030140437.D27949C668@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libnss: bump
 version to 3.111
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
Content-Type: multipart/mixed; boundary="===============6336589074742196143=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6336589074742196143==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8d226856b25d69f540afcb0ce46e554e2211b61f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_111.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b5b88330a7c412b98ea55a4af2765d5bd8e4992e)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 9b9252e77f..03e91e4212 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_110_RTM/src/SHA256SUMS
-sha256  9cd610c40422a07771b9b45166be2d052ea2f00b605a7928129e1f2071b3ae27  nss-3.110.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_111_RTM/src/SHA256SUMS
+sha256  5a4d5a44e91ef03cdc0c4897cf616e3c92f4e590ea835d3e0ccad8b005bd73c6  nss-3.111.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 83bfa422d7..1ea6af4fd8 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.110
+LIBNSS_VERSION = 3.111
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============6336589074742196143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6336589074742196143==--
