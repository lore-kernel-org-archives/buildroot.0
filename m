Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6840F606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 06:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JW90750B;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=jwk0C7T/
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C17180C42;
	Tue, 27 Oct 2026 06:33:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9QRp_99xOfV; Tue, 27 Oct 2026 06:33:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 548A980C23
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793082804;
	b=iOKuKA4ww8wOevcFMd0AXvMjwKuz1o3swZWBTgHVgs0rcm6Lsxbnytx+XFU5UsyEL8mc
	 928elyL2eQUGg4/IEvsVMUIa4s4k4YMhktHOBJoJ3yr7ERA3v9AtAIQVvkzxcuIC+GKep
	 oz+JcKnMkeqdf2iUJCXyB7JM5phehZLeQQ8g7pDYDNzUypova+nGF9FifykkFJIISKTqd
	 wSd/sgDw5q17Zj8viJtIqHn410t8YWdfxdfgCIgcZ6n7+9VDpbhoR9Gf+yFydI/c3g2LU
	 A9NOo4dTEBmjHCMErRInHqDMZYK/ssjH+lfmSGwNfnfkaGUN0geKXhDTNoYUn7nk/wA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793082804;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5ygnNcCNGJEbk8YkoW+NbHVF8OyRjWjEjThyxchy/hI=;
	b=f7Jv+y9zlbz3v4IjHthSnlIybmE+PrsypDcHg+fAL+aXBI0knmf9GainRQ1dFsBIiMzi
	 xc+RDdif6u/OPpPjeG13COKJt7Iw7W3KUPWfrQiAgsR6/OfnSPD8J5NN/Dx0WAqCsYjHQ
	 wUI89Nm+gnM51wWgIhqXE/ecT/rFSHBAD7uZOsy8QdliU2DXFi2CjDHPy8gcZLxWRsbI1
	 Z0r+d+UU1FJtFYT2MHqoRFIj7XI2iADk01/IXSw3rN1wWbbigXq9Flwym4spVgZYWjBY0
	 9Kf28SaEo3e4gDgcjKZ1p8s1+P/TtHa5XgEkICYW24gFm8QFWw99kTgY+KAq5qvIPcQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b="jwk0C7T/";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793082804;
	bh=5ygnNcCNGJEbk8YkoW+NbHVF8OyRjWjEjThyxchy/hI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JW90750BPmmIsVECgMJMBKQO3vsJDdhAZwIf5bN4VqJOj6l48l5yxlOuJNm/91Iml
	 8lG0Inyn3Mj/9tt0hkrjLT8nZIB+FB98yEwXHJDddbJQ4/TrsWf63xax8GiMb+Py3k
	 BxmmWuUDiqkk+N6VVlkZOHNwaJKYVodTC/9OIevD20gxYJfTJzoLbipZaV7SzPNJok
	 1dyH/dEoioG0cXocItcQwwa2ov1bfztMmcEJgjRhS6h5bTaTNMkl1iHfHLRYKX/FFj
	 bkvmuDXRXQkcKL5TKgd2i5bpLqRgtN6pObjffDwOLvnWpcWaX2ea0391umGvTAkxq6
	 8Afx1jWq7g29w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 548A980C23;
	Tue, 27 Oct 2026 06:33:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 31A9F120
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 06:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EAC380C23
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 06:33:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WzOtGIG_92J1 for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 06:33:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 39FF580C1E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793082801;
 b=rBUZ48RY4ndONWrspBc6UeQ7WgkY4GayhfxW8o6V7wk04yjKrU7+WDpUv+xsyrQo/qHU
 B/iRNwitXtGMoEvyxsuAHJwhYyGtR1+Rj9I0ZenvoXsjLkeK7F0EEewpnw/7pbSTt6xq2
 5Y7rXhEEQBO+9BTt1ypip2sTfbeJeuILabfcxGQgGYXEP3UIGlSX8rPKmtGlWEYBTk2Md
 SPQq+ZLEVwhAJOh61/2XDYV7eKZ8N3RHdl27zc9keqKP2PphBz/T1+ZL+V5IO4vzn2LQZ
 0DjcfGm32aiksa+CNlXxfS+fZLiUs/Sf5Oa2JbYBUulQ08xJvbsXStuqUyO9jXd9jNQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793082801;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=01XDY2XIoyQHNuRupSaSfIPKzSWD68OdkKskOHbjMnU=;
 b=RhvupneWCYXf8ipOLueX15nvL1+ibrf6ebniZc02HNi2tyrxlCWMmajaoICrfrPgdL/s
 RWhSS3/jLKg8F7tVTrFB0LzvGSxmV8vQDSKPnSgSibPRrXYhI1CAmne0zB0mXuv3iPrnl
 Qa/6bFwsOBb/bpFlsWNJYsO8VCG+SS63JTS8xgM3llJ2L6A0YzwClwdAuCmhgUD3hBvEN
 XjmH0vw9i6PQQgihgzFTmUi/MZupvEROKwIyGbqYHxwP0sHZKMjqTXnYFXrk7Z/lGTth7
 55bRDBsueNi4FoQW7dCnFRJYu5ieT+ATmxCP0QAMRexR+IqbnCFkIKS24Tc0T7Vq4dg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="jwk0C7T/"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=jwk0C7T/
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39FF580C1E
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 06:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793082799;
 bh=01XDY2XIoyQHNuRupSaSfIPKzSWD68OdkKskOHbjMnU=;
 h=From:To:Subject:Date:From;
 b=jwk0C7T/2HvnLRBSs0AH+q52Uu7PTpeQm8IBsC4sx7PHbTx2SF+2Qs6uUETX+BLc1
 wLUfJwQgLzxxwOu8t+FnpIzO8GfldIVS0FNYDHsaAFT0RS5GyhlcjFVAsN7kWakMzu
 EH+vFnFcFwn7PWHupfyEqaOjd65sKPkQIZ1ABYq+xhOE4UkhIoLD2bLblU5I5ucws7
 pwgMZjZgv32MHh2atz6JJyKwackRHSuJmIgY8BGEbHmsIGa1bk5kb1mrKxs78bYxvE
 MkXwOUtuRmvHP5TarejIMN+Ox+Q2GEWawr9biQkrUc+EmFaI3VGuk54q2qpqce28iV
 eioFR91tQoc+A==
X-KAS-Sym: v3:f51bdf72230551df:o3CAfQ6dMI/hkGE0743aV4QYNInxoAhD7k1lTRNFSXU+Z
 fX1xojLKMI7yOhYMUUaZY7KmF2FY7o11YeUG4UyzztqTAskRhIoTESuGd5zgrDWzzjEb66KqoXy
 FQp+Hs47GpfM9aJUR70yjTTCe1yX0P4bnj65wUro5O7AtQOfjIkzSXltfLEVwprdoUcYVTm4nOd
 UhTxJr7jQelZWkKOSnBzWnD15pwYr7/+wImFnY3xL+Y26Y8Q52Mo/SHbvZpXO7mGj3LPh2JmrSQ
 VQjo5FToeK9ehSOfbIQkXkRjBS9HDh9yFL0eeWaimt1blueLiZgu94rAfYoHpm8DJcSe/2/w==:
 oIX7Y3dLUwahc0xq3HPDL3NzU+bd3speaizjGDLIK+WPsafMme0wtuMOJ062eYJyEjPK7B95bV6
 1MyGlncT5Ayhr3SgpFPz2x1erieTP+LnRFlCchR+mtPMTNAtZfTlU+2vrcvXU8YWuAK5QFAZOm8
 +4Vc/dsV5aa6TYg9RajrNTMEWqUzgnEo+KhLltgLWWbXy1jihTppNjjA7gQcKarUlg7I4AbcuPQ
 rnFSX3Crb5AW7v1QvdPwleRPCJB+V2D7gJa4xaSBWaMQ0CFP4GDETE+3s8ZMstMaqp63NoLLnTU
 DHmYBbbpIF1LUPok7PG/QXZoPReF4M6zK3yQr6g9t/FxYnfIkO5MAVTkfLMs9W7CRFmXXp+GzVh
 UX2nZ92LvB7vW6qMnT4ec+s5V7bJwb4nVbBi1lH7uexkeZnIRRossJMCoxT/SqXBgXpg3HJ6/kR
 G0zZoo2OtJqv6ivnJmSxpS74PLLhlmbsLmwqpvWQqYsce4X2PuJ5+AfQNeB2ibJFJc5xzay1nfV
 gbemh9zNEMifZQOQNTy0EhW5aJCZ5uBOCYWkqMVF60TCNZk3T3Aj9wljiXeF30CFfSavirAfk2j
 oQ==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E9997A4C6EB6
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 07:33:18 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52044)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xLakI-000000007yT-3evy
 for buildroot@buildroot.org; Tue, 27 Oct 2026 06:33:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 07:33:18 +0100
Message-ID: <20261027063318.33340-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/shairport-sync: security bump
 version to 5.6.2
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/mikebrady/shairport-sync/releases/tag/5.6.2
https://github.com/mikebrady/shairport-sync/releases/tag/5.6.1

Fixes GHSA-vfxr-hxq9-9h35:
https://github.com/mikebrady/shairport-sync/security/advisories/GHSA-vfxr-hxq9-9h35

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/f03e170ec0454aa46468e72dfe8aa0f51990bb88

 package/shairport-sync/shairport-sync.hash | 2 +-
 package/shairport-sync/shairport-sync.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index 1eafe03b53..ed30ad50a4 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  20271e220e859b8f60a707597187564d3bda7dbf69dd61aa1357ec1656285246  shairport-sync-5.6.tar.gz
+sha256  0747706e19a64ec550ec8a6a5c26bf8e231a4d032de31644f5a5daa0632c41c4  shairport-sync-5.6.2.tar.gz
 sha256  5ffb12379c3293e48010d0ed04185940e107b54e48b520d58d847da53a153c33  LICENSES
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 7fd1a23eb3..0d0b4ca404 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 5.6
+SHAIRPORT_SYNC_VERSION = 5.6.2
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
