Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB763606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=K16Duc/W
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9ED240BFB;
	Fri, 30 Oct 2026 14:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hdkMOP59XRZR; Fri, 30 Oct 2026 14:07:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 81BA640C26
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369279;
	b=VGCLEqC+3q9AhwxalEeC58whgw3jg2A1y54NHPN67znPkJdcrX6vJS+zFe6UC22D8vwK
	 5AdaVFxKBwi7RIdTxgVAXpUneQaP8+nvTNdiObNJXoyOM1dPT1SMrDH/lPxO+D1JmxWjf
	 Df4dqs8iDaSbpUdeE5sytEyp9hOnfGrBpNKPl6E6lvkVP83X3O7/gYHQY2/IJo96tKgO5
	 cBh8VIv66b+dIYOe439LAE7ToyKkIyWMo+FqZO1KeKJnUJsC3r/dRoNVXyzzI9f2TOMYc
	 ZfguQssdODhTp5gis9hI8j4F/cxzBfrdYUxSZ0stjQ+DOxYRWLLaGqQHX6BPQoXJKMA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369279;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=9vgJCBE9+s1VeNmPnFgZduvTEa0lqSVnFUVJN/dVRko=;
	b=F31G6IqA+hSoqM0bDPO0Df8AGvKlTwgVH13SF571iABfrqMlPiHpqKzRvrRir7speAmx
	 M/TO0R1DRjlV3VEho6+/IOCZhbk1UZp1UjZFWlUnsbzpXtHtfl7ZPgU72gYPbMSnHbtfO
	 95oQguSPOK10rpTFdQhniv/aR3UU0V4/xk4OXcN8VB49/Eg1oK2LwQk52pEUlAZAVZEtF
	 MDMIcz/E70uNzyhUcTYU42YbDdMDmSjG5sYMExalZ1pHoBkAvO88tYuoTHeR7aR+vpFsc
	 /LBsFoOoWMK0a5bFlLdD3UYURmZ+JRJeyYrYoLtdS76BiyBSJeh5pHKHz2s88akrDBg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369279;
	bh=9vgJCBE9+s1VeNmPnFgZduvTEa0lqSVnFUVJN/dVRko=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K16Duc/WXCQmnyC4lFfHD1QcahYekGeOXItmcbrwRq5kFP2qCKQjYO7CMjZIUVubs
	 0ESh/yQJLx3NGVT6QxeRETK7XyS9LlyIDEWN+KwjDGtzdtrWDGlK2XNfYkmRvNINUm
	 F7fbozlWnHS2tTsfe23edkeklNvUYeeeBdbOz5OnA64BXwQWgFkv1lIfxzhAES9rcM
	 ZumrSD49OOgJBLgBHZ/U2r1J7og70NH0X1qXQlQjEPkMZo9ODGojJW5a9r70zZ+LaO
	 CC/TjIR7pvivI4g8ZSzzYV6z93aHdfVYLQVpphjO/d0NMoD35yeroRNAQSftpmGcLA
	 rq82KI+kvX/RA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81BA640C26;
	Fri, 30 Oct 2026 14:07:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CA30362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D88060AE5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IOzO-fyLyJKs for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 42863607AC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369167;
 b=qgT5XzUh9f1sEirqBhdnoR8PhTyhdHy7yZka7PPi+LKW95ZVHhtNoXSGkIh7NCjLzzjf
 Hq4yq28Z55/XPIFge7vMuur3IHYhbgmG1s9h8vQst6bAgmdS4VlcraCnGVlbE2PCwld/8
 jxvn8SmUIK6Rww8PXAK6wqbAyp58dFaefCuFG9IncNQuxVKBY0hwnHjzse76NmXM6sLhN
 fxWNUGvBtnRSnvV9wxA5hI3IxzKZTqmkrecRBasTPNOMTyv7Ec0it1phVSrH3VLbKX6qf
 JnaPkySeEw5jn8+0Ok2bwlnwCwv+MNmhQzTzlT7DRVOxbWDTtv1PtjV7KhJoHAdE+Og==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369167;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=uHGUVjEiMTbsSi08LWYO2035lh/QvyAyIqDUQLpn5g0=;
 b=OzeisRc64UJRPJE3MqTUZXOSWE/K0RLqY5rKrOnalB2STojdAHf6Yo8/8neJaNImm7i/
 MVItyfW8q5Y7xsUuuBQdU2M/oy+hZdVSMuGRJl3HITe2uDJaSvvnoh1Xb652VH5fDz6CG
 aKmx51yN1wpOUTLRRecy/H0mo8lVJ5CWPUyJYE8MR3JsJtSYhFHnT8RaBmz7LQclmEYqN
 J+Q2ioGkiVe6nukFZ81iN+3YjzcVj82Yu4NCEyw7uAPERYR9pJcafpo1TlEHJmW1hkvsA
 IqGjqb8vb6zsf1h7pNy0hRHVugqD3J9oaUTCXpnVX4Vtqj3lpDH7aO4Ypu13h8BBL+w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42863607AC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6300E9D38A; Fri, 30 Oct 2026 14:04:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:20:00 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7ae7e06159f5e019ee739e511e3ffd946143391f
X-Git-Newrev: 071b1fa150b74ae8b06c1ccd6a8b7a7e06fc61d7
X-Patchwork-Hint: ignore
Message-Id: <20261030140439.6300E9D38A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libnss: security
 bump to version 3.132
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
Content-Type: multipart/mixed; boundary="===============4541685599137206955=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4541685599137206955==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/071b1fa150b74ae8b06c1ccd6a8b7a7e06fc61d7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Version 3.132 contains a fix for the eMudhra intermediate CAs ([1]).

For release notes since 3.131, see:
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_131_1_RTM/doc/src/releases/nss_3_131_1.md
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_132_RTM/doc/src/releases/nss_3_132.md

[1]: https://emudhra.we-have-a-problem.com/

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2cbf77c1164f454f1b2e50765bbbc276b0c7b602)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 02bbcaf00d..37922f094c 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_131_RTM/src/SHA256SUMS
-sha256  ca0005bc77e9255d9942103e6f9756cfe311a3df72afa99860709e386eb3c167  nss-3.131.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_132_RTM/src/SHA256SUMS
+sha256  ee9cf4837ba801141a804321c4462ad8f452ff4314275c6d5108a6b05af227ff  nss-3.132.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 6b4e68a624..209730f6b5 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.131
+LIBNSS_VERSION = 3.132
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============4541685599137206955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4541685599137206955==--
