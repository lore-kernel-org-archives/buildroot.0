Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9D0606A32D
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NRbJycAU;
	dkim=temperror header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=dmgsU1iq
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9017960697;
	Wed, 28 Oct 2026 22:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIWDGmWlI0mW; Wed, 28 Oct 2026 22:28:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B5A8360709
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226523;
	b=XY0gZFLzjVbsFFRqzduS3TxPCZzjoVjczXcUY/6I6s6naqHcFVYQ+kNn3LLCvcFx5LO8
	 Qb5iVyhSqwD+oqb6qn4L2wlQoPVJRDQ3H853dKhgQixIT4etcHhBtgajSB/XEPDzxctQw
	 5KEqLQxCqhyXmPEAPdWkTkbQDjaH4sUHoOy0cExjsHy8IO6dP8GGTzhmmZ5R6XsN4SU3p
	 3q95qxLKJOLr8cw63zhDNKU3yh2HpOA2WGZEO7ga8FmNtDaSyKFBmVmcfgeGzg9/Ym7Nl
	 D0e86wU0Y01/cM5GVoSmIXdpYt8k9TnKcJijZrl2olhcoA7RNx1g7g0u410VHev92sA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226523;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YBt32S6Uf/6Uh5i1qWElljGdcI32pZDk1Er82WSVeRM=;
	b=YDBIP14onjWcIyITet6U4TGLA/cOmNrszbBHT9gIa5VoPRJmRjJLPOLxqvoxSh7PrQSg
	 1ml7s2tTBahCPKBCp68z2zlUCouHyeWLBg7BGd3bLYPGA2AMlt7TRwVeycX3ynZknKqHw
	 DpgQoIk4Cd6jBjB8F5KsFYYVOy9tyNioWy7bG+sZbfvodQHI1Hp3JwVKLLXuMX7WJuDIf
	 AlKRX4xcUx0dcgYUMJF3Q+Nj3H2Xi6wXEtse04W0PQ6Ucq/W7rkL6JQ1sr0PONjxpt6p+
	 tNMVmVvlcYrGNgMSIk+P11s1N/MOSZJd2vPDlPrK/1D+viOA6JZJ1k2/B4W7lbMqNbQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=dmgsU1iq;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226523;
	bh=YBt32S6Uf/6Uh5i1qWElljGdcI32pZDk1Er82WSVeRM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NRbJycAU90a3L5H/qzRH9q8NVQ2IvbJOjI7AnXNtW5g35SfkXSbPRdzVKtWtc7pOF
	 bvcZej3dzzHyw9j79HVCNNNPW06n3U9zTRld5iTo+Dx/M5IC/UUfPMJYBorPfog080
	 +VMBRLeS7D8jrrQt1hYVMhamXzHQ4TYoLWxNud+LCFcLP5IvBaj0ibBoxZNz9cOw6m
	 ggQxNHTiBG7P823vksg8lFKbrrZgdXRLk4ttK5uH71NtCGL1QRSMThbJh/tpl4xPOk
	 MQL82JxD+MdaUCiwFjHtelre6neNYnAxcKe+TZhrJcdoylLOkl0U3WupyTaZib2LFQ
	 38FLReSwa6Plw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5A8360709;
	Wed, 28 Oct 2026 22:28:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D6422A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EE4B60709
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eadd0OGyTjom for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:28:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DD8B160697
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226521;
 b=qPsKc0XuY2Peux8MPFtycOTN3RnRgMR0IMEZpu2ExnQbb+BXkVv9GuwYyZCEAAZDxdCB
 cM0Bx5pFxWhwTuOR84kLKTZWJ3U5RdIRpbHV2i1cJ3ISf8cNrnwzaJXQlEDMxquQSvfbH
 BipTfgtzGVgKAOddt7x1uhvUmiEJXGlSMiJHQGpt/UzDJTVEyPgGS4MLcQWpjGmGdI5oP
 Tt91TwOBzte4nSGaJMweTpPTOC/6mAlSvrl226RrGbMWTFplG4Nna5Drk2hjCC0jLEDEt
 VQhjyXx3Lw3MoSxKFi2JNdDk8zyGJOs9mhjFPMBlM24Mkx//91RGX4VwOY6pe8o2R2g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226521;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=XwKQEnzBAHqTeZySi1o+lNTXj4vtAZN/G+QMQLgp4iA=;
 b=qp49xcQOpdr8YQeUOqCnBcnZy0eKlToczvSWjfhs16RoV2tFc/lRDAhgWLUUFn/0FCl3
 w9abAfRp30GotyKgfeTMNW5/nIMchgbm5lMykMrAAca6DlBVgMnKFo5gr7PYzb4ZrFmlB
 19uP7hbtYz9e7vp6E9Czw2WppAISGlAJaHjFeDzBsfL5ykC+hom4JZpHhZf3ljJ91rQe9
 oo9ey4mjaDHo8cbHMG1ktcmCY6qMDDUMe5oVFmY4Nc/jhiOvRDKMTxe0czZcEfqZCLMRy
 cMb3y8WZrnigWkarvXF7wXh3ftYbv7kjprW14/l5KN638Zipi7YjFr8Zvn0R9PNwFNw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=dmgsU1iq; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=dmgsU1iq
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD8B160697
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226503;
 bh=XwKQEnzBAHqTeZySi1o+lNTXj4vtAZN/G+QMQLgp4iA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=dmgsU1iqVH45YW07nEu4e5Vik3KRCSIDJadrzx3HAJ8/1aUXCEJ/kkkBrdHSASe2B
 VbyCMPn5Oz29hndBa2X8W2+poxxmOPNQfJIKBhbDcjIFYUzYuvpF1ogzYxy/PTJKrT
 0OvOJ2TkNbuNbGX1H12KP3ff3EC+qngdaIXwGyMq9iitJ5L8GtGmkWcLK5G8SXm2Vb
 H1R/t5IR2DT/yxLU4xNZcnmOZSU9dKbzwJllvX0cZscX/N7zvc5oWpNiWaZ5rH7d+i
 Xe3KfcNhrK/2dAhLOKLmLZEjFt3Um/o6Fgn8hlB0R9Am4WRhcjMM8IwhQHFvQG29V4
 eVXnVRtH0C7Wg==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 321/tuoZU7kt6rZYZrEnvY+bXIIab6c4Y5fmg7wYC64O50JxJkmNxRdx5irzkK9dcG2m83aaZzf
 ctsSyiH06as31TCVssdX73ZJGD2vmfkEK2BxjQ0AWlu61PCNadB/stj5wQAqxWmHnc+3OoG7ekx
 hLKTCchutXIdIiEqnx3C915M0v4VGvmDvT6YXgEphkNcGi3gQfLg/lRbVYsiDxh6gSWjany4gQ3
 7e+d7Z0W1dn2Xag+76xG41SICqJXRoHcDM5n0wI9XmPqH7uUa5IVJa2C0hkkCPQ4veMU7FY0h3x
 ckVFYq+nAz6ZLFSCZQ3KUsPAe2pROh8Aj5O/rUechq08QvQ7+kka1liuG8wwmTtMYNnjohlTmfE
 k+kHKOC5WjHr1n1OYhZQoM70XDpPgMzPuanzd5+6Degwc+YpHlplcE/CyRcBoJLxDDOpET6+HaL
 KKp5iz52c3grmNRB6yZFH+Q18UxjupdHKbfKkqWzfMc6hRe+i7x3dKLmCTVt/5aZPIfLQ1qUkB2
 tYIb23gg5nlkbmtnprXOj3izTt8tjnlE+M+NA4rnaOEK22/FpaA6+kyWBO5zPHiK/wUAdlcwU4c
 F9Y+
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7D0F4A4C6FC2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:28:23 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54844)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC87-000000001Tt-1tGj
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:28:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:28:02 +0100
Message-ID: <20261028222822.490779-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222822.490779-1-bernd@kuhls.net>
References: <20261028222822.490779-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 01/20] package/bento4: bump version to
 1.6.0-641-6-Piers
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

https://github.com/xbmc/Bento4/releases

Removed -std=c++11 from cflags due to upstream commit which added
compatibility with c++20:
https://github.com/xbmc/Bento4/commit/9380a868a74252fa53c80174a3e942168e6c0d85

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/bento4/bento4.hash | 2 +-
 package/bento4/bento4.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bento4/bento4.hash b/package/bento4/bento4.hash
index b933c74d2d..bbb10785d1 100644
--- a/package/bento4/bento4.hash
+++ b/package/bento4/bento4.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f1f8cfa4f7cb651b609e587f825607cb4b06fe5b08af876fd0154a434f9a5315  bento4-1.6.0-641-Omega.tar.gz
+sha256  cb5006cd30889238760556e6148f69be34fef4dc48e8d895a9822f805504a5c0  bento4-1.6.0-641-6-Piers.tar.gz
 sha256  7daae92c8628ada28def8d096fe2fde298b72ec3e2d64a3c408afce38edb361b  Documents/LICENSE.txt
diff --git a/package/bento4/bento4.mk b/package/bento4/bento4.mk
index 569e320a2f..bb91c9b65b 100644
--- a/package/bento4/bento4.mk
+++ b/package/bento4/bento4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BENTO4_VERSION = 1.6.0-641-Omega
+BENTO4_VERSION = 1.6.0-641-6-Piers
 BENTO4_SITE = $(call github,xbmc,Bento4,$(BENTO4_VERSION))
 BENTO4_INSTALL_STAGING = YES
 BENTO4_LICENSE = GPL-2.0+
@@ -20,6 +20,6 @@ endif
 
 BENTO4_CONF_OPTS += \
 	-DBUILD_APPS=OFF \
-	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -std=c++11 -fPIC -DAP4_PLATFORM_BYTE_ORDER=$(BENTO4_BYTE_ORDER)"
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -fPIC -DAP4_PLATFORM_BYTE_ORDER=$(BENTO4_BYTE_ORDER)"
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
