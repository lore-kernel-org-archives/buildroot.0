Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0099C606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=piqw09bE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=pj/bVLmZ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF34B81162;
	Wed, 28 Oct 2026 22:34:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id luIByRTqmu-P; Wed, 28 Oct 2026 22:34:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DB3CC81160
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226887;
	b=nj8U/EyGtoeCa4GhnVmuZJbFccQOKHYAfG1VqrahyKfwu7xKg7lHo7GlIdzEFYjDCrnx
	 zUsxCNtDCynzViu7teimK9A7uhqqtXDjancnkuNCxE+OQwC+fYhT5ZBr4nYdvToyX2JFW
	 iAQFntA9p6Fd8z6zIGSDquXCFqOyy/D8uCTW4UbZGQbk7sHc6MMih7SnRns1Zv8+WL2lu
	 nDpQdXhx7k/jJ/UO3B28s6WZhGgwbBYXUY0dj3V5Ba/iDvqFZjt0ja+3ZrBt/Zp2gtBEu
	 yAGVwh1BR2kFPwQ5FMWPQPbmoYrALwjdZKdYHbOSiQnwI4E9y9mN5J9Y4oBMBYas1bA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226887;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9trwtsarQCzk0FAAldKVNNCAOjZ1PRG735S+DD+FxXU=;
	b=nKXuX0KObqEvsIFkSnOJVlApRrlpztt0yij+899acBw5k5fefKY85eYeIJxbUg15CpBA
	 ENUxi+uRrDfW5FQWSkMSfthXoSMjSkg/pDOxCt8HqM0A/3jIj0NBjUm1hiUqX9NzemQwa
	 BPgEUZ2RlDJHNsbRo/ZKztsq1KEJkhee76C4z7YPpR+Zoc+NLvEuZXWdRgt0XSgR9QgHo
	 sEFs2c9Uzx50bu8Pk9F4OFbH7az6nP+Z2vxBQtkTvH8Yg0Z35UuIgb6AW2+e7VzN62aUc
	 3IXGEcPlGiH/6WMjd4b4jE9OJith4N+5ZgQ2lp9MDqJ05fqUJeYku/dIvUwYFXQJuZw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226886;
	bh=9trwtsarQCzk0FAAldKVNNCAOjZ1PRG735S+DD+FxXU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=piqw09bEkCBPN5EEWJXHnxUIgS0ZaHKQb1xwS2950hKJ40mnpnM7F/G3ojtNPlhZ8
	 H4XMIm3ZLW6UaLi+YvPK/EF8AiC1+6DNE5idREVy43H+Qptn8HaT9XOsS5TgNr4VQ8
	 MAJmQbVw8WI4qgiKr3a5IeZJCFCUVnd6bLvMjsXf2ZZY3LxnlQj8AlQHiBTGPzSdda
	 Exz5x2BsFNpiSlp/KorHRBxJR4pTDHPL7sSEpZwjO2bNVgKWFQ1rCD3aMJLjS0HWFD
	 PsYcMCmNanR9avpSnEurDieVrYIebEfWwuFWgMLlE+xLNHb4ExpdnMenW0VzCmfmDD
	 Ud76Nwfe4namA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB3CC81160;
	Wed, 28 Oct 2026 22:34:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 891122E5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FACD40808
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SW03P3-KLGmS for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:34:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7C0774054E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226884;
 b=gINXZUSHJn55s8iA77iSS+hBrq3ovVDXyHJ/fePXgfQ+ET8m5sLK2TQUIjOYy5xSbKkU
 6WhosoS1irCIyrPzMBjHNlIpK1H6/jGYAQZs2h7JPd5jLopi9YCHrzo6kSoefu0yY0ejR
 78nf8H+7NzTprd3KWdiD6R3xKypbevRK6O0kr4fzKp89Um2e5SxSvCntse3xq3SnOSTZe
 MuKhMMZHQZuIRuRZynA6XM3/UiyCO2Hy1epLi+MeTAriblADD8CeMVaRyo4hdve9T/2/b
 UeePf04AcxQjBdcAGbVlb/h9gRwIl2l8xOEt9i3Er4oUOu3ZCcBV3VuNt4BOmDc0/Mw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226884;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=tv4fTsumW2i7Hx7FVBtnvjg7WZmh/dAHLmZMEtyfA4U=;
 b=gVGSkfFsaBov+C8W10HqMtcm20h39HHYbFyAag0EqiBwSWYX2+apMegOvXY6afsdgj8f
 sMPyt5dehYy3QpEG/v3Fv534umEFY+69XBK2qWQYHm1Ue+Pdz0cKjnZLEgqbmHV77Ld23
 BFhI6UHFLXlCNOvaDnDMRXb2PbGf8Ka0Q32khytCMG02BjSkQIUbWiyOgH6ERbx7N9XwS
 hOdHGuCEDJQQs6SKxV0VKD01a357Mcc69mz32uULYbBLlBvFv1ir2P/XNtjdcE3VmvWck
 0PN1D5871JGxl/5JbYmn65S/YCOtfHal2rjELhkmgaH5GJmXQctuLg2XZEKbkdSuThw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="pj/bVLmZ"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=pj/bVLmZ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C0774054E
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226578;
 bh=tv4fTsumW2i7Hx7FVBtnvjg7WZmh/dAHLmZMEtyfA4U=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=pj/bVLmZgM6aul7W7TPp9YmO7F111Q6cUJ3In3016gNWL7LC4kDbVFprfwyLdwlmx
 oeW8LyQYPLvxYvIo78U2RCgVU6q5zDzqixV8XUQup0P5aS7cewfLK6Be+SRHCazEg5
 q/E2WVund+dtmHSESbkUPVqz18MlkQw52mKt1Kmrl+8b2B657Fa42ZRJ0hvhYUdUjA
 +XLdt1maW+6yHX2soNObt2yP54+0+Rp1P9upWQKKThWHoFZNOnQHE8CnP165GT1NzB
 MrRFtmtPbY2Gp+Sx/kFbvyeEiq2uBcC6084I7unXC5arnh2IbZiwp6CldtcKa3Dnm0
 3X3+INETNLO6Q==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 nxpDjWQP5zLpplsfi0WbOA5neERQvowDPxiMD2op6I8wZJAxFRNOPFhn5bnRwvvlCyXiZ7pIe2m
 O3f0vQaiFb6itfMZjakfmahncb65gb1w3E5gvT1Q1wZNgcO49Pm24XL+Q0a0iF/BTQd99U4tKC4
 kIKRQnP3s5xMyBiAoTfc/iW4EGgXw97NmVLdGz0JBQvxe2kX0YnHQSKMsl4yFpk25R3dHlHkA++
 KV6OYO6b6wj4NEz7jZHIL/uPptp1f5i6lxH63jH5Fxg7G1SZ37D97YsEwaqpxWl1913tuFpsg1Z
 udOfQqqAPYglTV4iYjLu8MMwaO+dBBtAwU/eRZYDOIDf2Sjme3zeVastlfJ4tgIuRuHaiGQAoe8
 FtE1utTErdHG2nkgLq+/+E5C3YrQuzk+bA1VESrhMuK1qAGxmvHoSlYmYoaD4d2Us5SD9FFoU6x
 jm0lW+oL6ZKKkhax+iihReeCPwTLHsf2no9MiGllTz7xhR/FN6UMnS8vK1mS8jTkfP+1KBukOWs
 /pTsvunPCpFkMMTVVPc+j2QRbnA5X53kQdB6OzzJO7FsRHeRnJEDqXvncTtoqHPY6oI2zeGSYOG
 3Amucg==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2E240A4C6FE6
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:29:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42186)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC9K-000000001i7-0boP
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:29:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:29:27 +0100
Message-ID: <20261028222936.514451-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222936.514451-1-bernd@kuhls.net>
References: <20261028222936.514451-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 10/18] package/kodi-pvr-plutotv: bump version to
 22.3.1-Piers
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

Replaced dependency rapidjson with nlohmann-json:
https://github.com/kodi-pvr/pvr.plutotv/commit/c6d0c6800421d2245922a497c3ff2994136ab374

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-plutotv/Config.in             | 2 +-
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash | 2 +-
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-pvr-plutotv/Config.in b/package/kodi-pvr-plutotv/Config.in
index 37441283ce..29e6d8c485 100644
--- a/package/kodi-pvr-plutotv/Config.in
+++ b/package/kodi-pvr-plutotv/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_PLUTOTV
 	bool "kodi-pvr-plutotv"
-	select BR2_PACKAGE_RAPIDJSON
+	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	help
 	  Pluto.tv PVR Client for Kodi
 
diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
index 7381749ea2..f3d4e6f985 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9b65a30f4a5c0cfbf1ab669f06a3afb0cc7b2732ed6d6d4e768d16fd10a0da02  kodi-pvr-plutotv-21.3.3-Omega.tar.gz
+sha256  a56bbd15ea5eca3143feba281fa6f0f6dfc42ebed37e886d7ddd18013cae4f8e  kodi-pvr-plutotv-22.3.2-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
index 898b0aad0c..3bab7ddb1a 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_PLUTOTV_VERSION = 21.3.3-Omega
+KODI_PVR_PLUTOTV_VERSION = 22.3.2-Piers
 KODI_PVR_PLUTOTV_SITE = $(call github,kodi-pvr,pvr.plutotv,$(KODI_PVR_PLUTOTV_VERSION))
 KODI_PVR_PLUTOTV_LICENSE = GPL-2.0+
 KODI_PVR_PLUTOTV_LICENSE_FILES = LICENSE.md
-KODI_PVR_PLUTOTV_DEPENDENCIES = kodi rapidjson
+KODI_PVR_PLUTOTV_DEPENDENCIES = json-for-modern-cpp kodi
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
