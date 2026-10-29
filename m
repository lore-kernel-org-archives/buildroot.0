Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8651606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kQg3EhYX
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94BF881248;
	Fri, 30 Oct 2026 14:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IgYXVCixyY2K; Fri, 30 Oct 2026 14:07:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B29FE81228
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369237;
	b=GMCmr02VVdzQLM5+CFheMwdtzKqNXiGt+mmmKvZ0LyENgD4fHEFEufb9p47/2nVwL21H
	 Op0P0xdPwZd+TlxiVnAaIczP+oLpwyDNPbZGpYmbxtui5MCXoSV8xwmG8eV+fAxIyrrbo
	 3asFZvKCP4RfGg2UUccToku0jw05BgPf7tolpUDBMuwx5NOFzxftgVxUjQ+EEbJ7yku2s
	 OsdSHRj6wuJEoKR0y6KcBBOTzg+MKi5hLt+xTRoHC6qBifDkh9NFxjFrPcZQniTChpXQf
	 Px3u+WGgaTQ/+QU2h5Q7PTDnoGzNHzMCkwqs9AGYpQpYUmg+FfOOR1s0UyXMbwWs9aQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369237;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=3KgzILu3P2T/SpUR3x+lhhsp+LM7+ko8SpDBPF5kTeE=;
	b=gYluPNjzRsm778BpWBpr9PZEpLkzyVjH/kovWcle3uqP+8wGHWB2n9iKa2WoWYlf84PW
	 Jkpm7mZDVEjBsQIce9Vyf4TcKpQv0K6GI+92mTEK33WFGkbOzNf/zN2DWY6oGgneSJwvZ
	 5cCu0s/1aE64czI3jwa1TR/MdPOuv+hOgmB6SOij7/MxT5WB/W1qoqurfdKeSDkwsMx1C
	 nRcWHKHPskTvSaGP6enU9HrXPYnQBORHhuIfwdxlHd5iwJZ7afTzMIxrmIhPAQ7ApIZMl
	 jh7a2bKLOR+U9O4OZ3wF97q4G1b6hT8tKi/LiKWLkQeCVUnJzm52YEkx3hURMX9ItJw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369237;
	bh=3KgzILu3P2T/SpUR3x+lhhsp+LM7+ko8SpDBPF5kTeE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kQg3EhYXaq2WOQy0iwIfpT0ZoSAI6iyz70GS9kwfOjul2WJuAN76dxmO9h+BJc6Cd
	 K1idfuu5hozR+ZWCoriCYDLxm3v58mmsQbExJWi3bKms76sqmM9CUjX3EglT1RcuUU
	 wmx2VXTPZ3DbQ7TLeiMcxuPPP6BSkDkdHm7sspDAGarwdmfCCWnW+H/l2C55Fp1Tc9
	 0dGTCdlJPnmmRmrj7SxOHpulrHj6kRecP7F3S1I/lhuk1OvRgexU+a01XrU8+IW9Gm
	 OAcMdKwSd3W+zmIJdCGb/N8G8s9mttlfo9/cpcqiQTNMTHyqtMXy4UbE3pEdR2NwXE
	 1DBIx0AR5NOpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B29FE81228;
	Fri, 30 Oct 2026 14:07:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DFDFD38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 041D640B36
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cWD9cw264ATW for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 36C3340B33
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369166;
 b=c6PF7aWc3612MSFrUkR6A2D3GJBIl1osutT1qjsy1HnNFk0scww9xo2Cvsq4f3aeq8qP
 TRENzr7IaK4gDz4T5qT+xd7fIcbQXXiYB2a5MY2MfZTcZ0NbKq1NY/+oVooXznzp5jFHx
 ZWI6q8CCNR6YSXwVB72Pp3wYqjDjmO2yVejsBoD+oVSlEXnW7KGl7fQiK1aSnw8yi2tHz
 lTLQQs8nWTXGAbwv1UQS/D504CVBiqMkovRQUzJORd9ikRcuisnXj0P0BjuwkZ3J1b4WO
 dRAbdQdiN22+aD393iywgCmkj5H3s8yLrNCyMlUdL8xPHZmkfTSJB6joFozCtEKAWEg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369166;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Et7k2cKZ8COmKoxhBKF01gGHkvhWNXpoFxXyhNMztm0=;
 b=ZS8B0cHBUPj0I1i4AvMYRUZ2oEJ3TSfELd3Ml4aCm9R20yy8kZ+H3nALHlyyaldGTbb0
 EJYDQYfd+c+ZKbFBBcNbiJ7KDr7K8Vdp0ECTE8QN1CdiSWkG0bd+pAbeQBm59sNTy9VbF
 jbO8QdcCoz/kWt/EL5SqEP/0PcV7F88/dvB8biM8h1nMuLdPbd2gVYhOEgmiHPpej0v8/
 g1ACoLWiN4g2KoG3TRzBDcHlHudF5HTip0M01QVlws3VHVCwjvuWsCcKvkLF/T01LL27q
 nx5ESeR63e4KHkkQu4X/bfWnb3vSUBfrrLZZyauikHupOFTo0HYxG/PYr9e/9Bem/6w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36C3340B33
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 561019D389; Fri, 30 Oct 2026 14:04:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:58 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 56ecbbd904a075c80122e3248b8ee2bd78f44f9e
X-Git-Newrev: 52e831017449cd4388d459ca2ee6772ea05a3f60
X-Patchwork-Hint: ignore
Message-Id: <20261030140438.561019D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libnss: bump
 version to 3.117
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
Content-Type: multipart/mixed; boundary="===============0745428256172516327=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0745428256172516327==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/52e831017449cd4388d459ca2ee6772ea05a3f60
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_117.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2827cddd1692c14c4d8c7d5f297293cdfb08e73e)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index c839d58b80..cf339697ea 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_116_RTM/src/SHA256SUMS
-sha256  3938611de4ad1e3b71f27f3cd5ea717a5b5f83bffc9cd427e6d929dc67f2bb73  nss-3.116.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_117_RTM/src/SHA256SUMS
+sha256  5786b523a2f2e9295ed10d711960d2e33cd620bb80d6288443eda43553a51996  nss-3.117.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 9f05a3f582..12a1a7c140 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.116
+LIBNSS_VERSION = 3.117
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============0745428256172516327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0745428256172516327==--
