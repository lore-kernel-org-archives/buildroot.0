Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BAD606C8B1
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 19:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OLUYhACa;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=q2CkYgRP
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF13340825;
	Thu,  5 Nov 2026 19:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Df5vQ8nddWBZ; Thu,  5 Nov 2026 19:38:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 33A974079D
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793907498;
	b=aHGKOUl182KRVviZEJe2VOKjdEWAfiObVMo8gZ8ws78A3TtSHY1/2TsvDpdfzxssjbu5
	 Yi1JFaZtLd40ec9uhIuGTKN2SpNGSn3IHKbbX0ctaIlm8FEmEHkTXL/LTy8Ld0wJRQoYB
	 yJTi+e0oTMIu+qiBtin0NqS/Rdgbhmf/F0BTC8kM+DVbgb+cRKNAf8G9/pVv3UzkQyC/b
	 KvvF7bEPCaaOmjdWDwN1G4G5rtm26e+R6+Ok2ObJjMTf3q2fw/HmQc6Klu7xXem+uUdF6
	 L+DSrx8mJ/lxxAIKo/2XVludnJX00IgLhgN2EzdYwSQy7yvGCuGD5wgIsruTIeNP9qA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793907498;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NSnn1SfcHlcJAmcekIWgPXRa449C/34gFPrFygg82vk=;
	b=MW1UUrVvtaRfRF/3alLN2vm0AASal5p7J9+L1peZbtVVbBkwCQXMKFX9Jd1N/1lx2icp
	 i8I1L8eH7qXgbfDZyzI3nrax2kr+ZBWmxFzvP1aXXRGNIvvPPNH1+hWPed5hDQA295LoO
	 xNJ7w32oNpwgshRRwMC/XYdwseIv3iLPogXQeBcQWxYN9Wt5gJu9EhVNF2bzhiM8IH+08
	 ZN0ut/ecdEbXybq7ZxRptSJB2I3P7VAcNldJE91Qt4XHesdNxEEhvCLRz5R1rQ+Nyin/1
	 l9RY7VqVPt8mlzc2xMmY4XbHGSqPHjaIdd/Su9+50LsveSVcWkrYQmGo0K3bZqh3Xdw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793907498;
	bh=NSnn1SfcHlcJAmcekIWgPXRa449C/34gFPrFygg82vk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OLUYhACaxdMUogiucNrcAW0fuw6kIZ63OdCMaPqCFz3PgiFQ2122Qqi4KY6ke87Hd
	 24CmJUgNP5NyjUjWjMhrenee7vAEt489ShIAbPdVu1lxDG8OC/NmEhMv+xpRjjeVz+
	 A+CqFM9foSHkyZlyxDOG4jrINhYAaGwDKBza7jFzSKU7cR3voObiCgsapxHe7hu7jt
	 1mqWvI4hH6ceN6gkwMkFEWnLiJhoNHZpfDFbzQcn5D7q0Ki1B7K8Uhhu5SVKTosGeh
	 GSl9CBj823x4GjMYGo8agbB02mPSB1rpeqFwZun/tBRT51pZMmd363+Dh0TGR/3Uav
	 K9aFCYkfZHNoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33A974079D;
	Thu,  5 Nov 2026 19:38:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EC8BB00
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C35A8119E
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 70bOWA44H5fC for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 19:38:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2C32B8119D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=q2CkYgRP
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C32B8119D
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793907490;
 bh=0ZDqbkfUp2S3vPZbidb2qMm966sRXlfIfNzeXPqzKhQ=;
 h=From:To:Subject:Date:From;
 b=q2CkYgRPDmrwTE6qqIq4XHYYutIc09e2+2NdrxuSxu3CZltOwTB+qTBPOI9ojS4a+
 OXl/Z82jpdo9OQ/B7Vu/ECqShOQOaD69MZQLFjZ5a6Tex4iUtBCZO4T7tRKHKh/6I0
 S209p0EqIv2hEww6Y7tk4QKLwfZOsskXlyLvB1QbproG33kNH6pCVo0Ax1+uoGIf4i
 cnKI3DS+4WBGqEnjsQTM+XuPwE88/znw2XVFbofGs/AGxDccDbxshkNdM9Bb23DAFe
 MZC+huE5s1EkojV/ZtlHBT/bocQod0R9iG6APjYB68FQYIQ2iW4M4LUqyotZV5jHiO
 gD6JJO0vQxfOg==
X-KAS-Sym: v3:f51bdf72230551df:sSrSTGA2dX5tVxAfZqtVGGfjaklUNQ2SxJDQgpgexWpWd
 rHN3tPXifPKvWZ2Ci7gAFO76e1dx0IchD+nsVOwiRHpnmjLE8iHQ+eqvCw7wAPGHTPUnD4kp0MF
 7qrh/7cOvjnV88EAy6aoxNDi142/bBsqUa0AxDoErNMGTtYzy3c5JBtPrPI7Gei4rhimEkoTJ+s
 MPVez3q2kzN5dMkYozQijQdNxbBwvy2Rp/v6o29IuldJc5RyP6pGwQ9olynsh/fRW5lkMPr8M8w
 cp2ovXX44GxAAbcXTtsMOdlLxhP0rayuq1kk6uJ2gbdYaYAiOm2n5rCwEiyuk8sYrGfhxV4A==:
 KZSX4q6GcBX++uuK7TqKoPP40BzI4UiacNyXJohhRybCU6G+nJAZpke/G2d1pdM4vXqHBcRPqNt
 je9DUJyr8kkquwmoZAmDoOWg+Z9HR/Neu2Rhzkc38raH6q4mdfLaK3YUOkcZn3DJu5envrFRIv4
 z7bXqVvv0lMHNJLUTpLBuiFtsAU/h9LbumDwqtBpVjyxHQVSkzh4M6XTvQ4VT1K8yGogWh/gk3/
 h0cuFHMUuwxLj9APyLpn/2+lwxy6pWm97bB7M/SXz/6nVfxE4vw7z0DShPb3/L2SdM3ZiV7OpdR
 9uU6Jt5Z7Wj41TToxki9rqPwtr8OQMdwXnTlVoM9v7rU2qjsryCGI32A0GMG0dFkXNjrq56AAMp
 v9lBAXrMhpyPAPYB6XhcSpeJjrSIrvAk99meEfFI8gm+Eor0+D8L8BaLJNBpE9jeyBhfwHP+ksd
 L0jzR8NEES6Prwbz6bsmaYu88OQ/shjoJqJOd6Zp7p8/2lV4pglVL1NC+GZkE4acCwrOEP7fB8n
 hCZVx+ZTGHX0EQLkNDcD4eyUMEsPg2G3ImYIJRmQhmqQ99XQ8Q7pAkyHXwC5qo/ABI8rhp7b13S
 yvc=
Received: from fli4l.lan.fli4l (p54a1b33d.dip0.t-ipconnect.de [84.161.179.61])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C1A05A4C382B
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 20:38:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37222)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xP3Hm-0000000051U-2cLq
 for buildroot@buildroot.org; Thu, 05 Nov 2026 19:38:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  5 Nov 2026 20:38:10 +0100
Message-ID: <20261105193810.681969-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/openvpn: bump version to 2.7.9
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
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/OpenVPN/openvpn/blob/v2.7.9/Changes.md

All CVE's are win32-related.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/9934047949f39a4493a4e30fdabed59387079281

 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 9274a853f1..0c4a73a59e 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  c070d1d2440b5a6fca6c2c68645c98cd492116ac36ef4f0946177115532c8e36  openvpn-2.7.8.tar.gz
+sha256  c42a6ed892ddfe2d6e3317a5040f19bec5827564affb2fe3f2b3904a94daacb1  openvpn-2.7.9.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 01c049cd05..16f9b7201f 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.7.8
+OPENVPN_VERSION = 2.7.9
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
