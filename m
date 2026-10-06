Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4C3CA6006
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CCAA40674;
	Tue,  6 Oct 2026 16:30:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9rZMHRwEqUYh; Tue,  6 Oct 2026 16:30:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 76F5A4061A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304221;
	b=p4ZhFexYr3MYi8F6H0iGnJq0zGljj2AkJdHQq/rje/QQn9eVOVTf0a+ym9g3rhyAQ5n9
	 u417lOvxIpWiz6O76rK2dauoBlu/C/ED+CSiKFbLeLEThQpUsi64V+gpn7DkytyioYoJW
	 kYQWEPOZuwAfh2llfgJIhYDIdY0f4l6ntMCkXz3BfKf392kulFFeeb8WGGppYBi5i8RNp
	 R9SokS1Uz9aum7484c//0gbi4Znl9jtb6BYDeEQLG3iTucfTxbkYJVuYKuP7PoAbg1VB8
	 uOS23RZjGDg/fIcsOXtS8OAcjT8h6ufiQso3JTvd7hOPVX/qEy+MO3OqRoQ4cmBzATQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304221;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YBt32S6Uf/6Uh5i1qWElljGdcI32pZDk1Er82WSVeRM=;
	b=eRgKwgAAEsgCOuPBj4LjSwDWyKf4uAk3ds9hbdDm2ZxhysiIfWBF/9fRRr2BPgMhYdF4
	 YuB4NFaK//rodAzzijnOPfc/sm1Lw4Ud0GOZQ9crHxdgw0M8cS05nmQXDFyJOsDrETyHN
	 vKhn5nly52toV7fnjRailKCt5Pa64Rau568Ejx+B73yQLinyX9MlI8LMz5T3VZG4hs2GI
	 xRg/APBqeP6u4DKptbak3/IEs1Q/jh7y06HWhdBPX550aLg6xTOu+1qZ6lKfJQzNIfXhJ
	 X8qCHFdzl7CmUBVG+8v+iYSNPIy+LQk0DR5ZNeE5/CoJLIspwPSqOADI+ysHdkLY1+Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304221;
	bh=YBt32S6Uf/6Uh5i1qWElljGdcI32pZDk1Er82WSVeRM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aUWkD0pkxPQYpUbgUBqqrSmTMurwemTk098YjU3l/GZeIUgKCAZZ01KigthyNgqd4
	 9QELuT193Tv4CaEvN+eu67lqpjORteFhMGlFSYYk1NQ8xc2GM/RDFIhLvDPjWrghZK
	 CrEU4MwqX00r7jlCncOnFm0/CfZt3obYKltJ4y+h+0K51hd5PGbBEU1QzCeKTfysJn
	 XZO3vC9aqqTcCT5JaTS699cdVgM2pwet2o1VyxfKOcUeXTA30ITJ1s36ctptHbQF/Z
	 bghXt8063/6Xu/3WEYzskkKXu901ODS8YEi3XsM0juv87hyBv4/0SxIV3C7Oe9git1
	 27G/+O+gKlKFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76F5A4061A;
	Tue,  6 Oct 2026 16:30:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C48F317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2243980D8C
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3qFPwba-Ywp5 for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:25:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4763B809B1
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791303910;
 b=djPLgF3V/LuFx/peGRIKiaPOylA5lwM3S8Utbshl/rHXiZu1UmpxPWfz6NhcDOWVAxvO
 EGYX/6cWaKBXVosS1i6RrzowcuZth9YnvqcZeKBStkwFENzMPNcPd/1n8iZpNY0MYWVrP
 2EpR8klXvzOwqc8YJEe1GBMYhT2YM2fv3zoTSyYou6N2XNwXPuOx76ltb1gUM+uRaY5m3
 16P0FnvDGdEkUJ63rXYcQwdc0Sgrbx4gXQCxtJmkKBri3C2oQWE18+F0/Kk5nr/hv6B8n
 vMP76EPFdnvi617J8MZs75amXJ65d+vJ8YPab1dEcFL7gZkjNNthslv/TbjqsLgc31Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791303910;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=XwKQEnzBAHqTeZySi1o+lNTXj4vtAZN/G+QMQLgp4iA=;
 b=rreq17/Fl024IxTH9uowxnsxEF44jc4DBOv1uJNpsMZnyiKqJVf1GAHUVXqnmszbPGBq
 QDr+9yfe+5fpbMkh4C1nz1R1OxUTRTZ02Xjz60gFDK37jNvAz9+evTgbbpMSTTtKUP6Dk
 KFaP1YK9Q/BcqPebLgr22oNnR/ZaeDywoB+kssrrZJcZvgEZhjzM5O8U+OZXxvsp68Huc
 Ta8MShTJ+8mK34i+VWT34eScmLyL5YWOphkVUDBNCGW97reAdeoDwWIMhWXi3W/kPiAhI
 FIrh7RGTuG2J1dWQH8x2fdDX3UY8856xr4e/5+pVy8nXPWPaQM+f7i2aAjJihK9QLSw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=I0GhpHC6; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=I0GhpHC6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4763B809B1
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303704;
 bh=XwKQEnzBAHqTeZySi1o+lNTXj4vtAZN/G+QMQLgp4iA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=I0GhpHC6slz9PhR5fhzQokJsBVIAWnx6sk/0NlzdglGgJEGQIXdjtRg3AYXHs+ZSC
 1TadyvETTMKzSDKHckrczjzTY/7UWGOuom+jS9U/x6VDUZLCsxOU15gokr7la7gKyo
 1Fq3cUfP+V8Cuy6P8emzkIWHIZ3ZzmD8RWNlxkJey0gmO1LLHFNK4LxFRxYcyXMUzp
 nnDGV4poOOshnQCoW5c/YShFNUiPUMvmAXp4GZcsDHRBVGt525t3KeLWb0ov3CK8IM
 lu8UwTrDa20C48Ysd5PrzpkSMrWz5FyReYs33dhd6xrDTVbYcz9yBl+vlTkSSGBTYw
 FZGnuMWIe1b6Q==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 xQgeRKEplDYmGV9Ft88OmvX3rM8/QSwyFcHqyE7x7kbmF4l3wIw5U8l+AAEHndUBydeM4fWroJK
 Zld27jw7hW5xvtlr9QIhikPqvyWzSdRXB68V7Sz1TJGP6rY++UVzvr+/GcciPejLBRNEF4REq6+
 bLa19/T14vDF1gCSs8NKXjSzZp185Ch7AKEgcagFIl8HetZJNybRcSLtbE1oeq7cCELhurzWqGi
 6NiiVK/RbUDGsman3AmVzny6V37A8gk8ZhlEYP0chVzd+KHtNs+SCEMvo+c9dQqLSS7+QZSsxx2
 etCuYR56AcwcP9ne53i0OS560p1XjTZtT2JTOKrzfGKPKJdNUg/BSoA5miMn949ZqzvwBJTUz2i
 lT3b0+xn7/XCxMwLau/MKXZQxrapV6KnAviEEuZ6somj80U4qvM+42FWK/DePlXRTTaicNc76X5
 /+WUmoD0CjFDTlPCR1+NlFwCFvWv1HAUqkbrsWJfOGZkyNXQuj6UxhEm4wxy1Oknq/aNHVHoFvQ
 OZXmzizOs0JU0TblQf2IOCy8wm6/i+uHfeZGYxxL9qCX6zTxNDyfiN2mHdz5HLK9Kx+Cw8eKT3/
 6uQ2ExM=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 74AFCA4C50B4
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uq-000000000ir-49iV
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:49 +0200
Message-ID: <20261006162106.3439373-69-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v8 68/84] package/bento4: bump version to
 1.6.0-641-6-Piers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
