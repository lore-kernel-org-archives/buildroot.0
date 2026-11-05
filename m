Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298A0606A326
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 22:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OjAQti2z;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=W6mcPsDQ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2EED811C9;
	Thu,  5 Nov 2026 22:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ulKAtk7dEBMD; Thu,  5 Nov 2026 22:00:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 12184811AA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793916039;
	b=HvivCS/ER3NEtFXSjSIkY9BdKgUXSRAjqNBVLBpW4uc1Xg3uPwOxnFMxFWQ2UyhslnLU
	 6Z+5Lu23iMp6AG3SVGDY7ES2OBrdrAcwpP5kCIdAEuEkrdfev+bKOkg5AeuT2rkZwtuI5
	 kgPAvE3ttC2GqnAI8zDFnOU0/Au9ScsBkxoTDthBoyGCBhkxpAbMtEyR8Qin0oHmY/OXk
	 Ng3Ym7IYK2ksSuQM8P9FNVZHoTMMm5zeifVvu2yz83vSWbmxj7Dotmg+3Z9XgtY4UDbQU
	 +ZV6VIxSdSGjsPjQjGKVL8nz81meEszwxuotQlWtXj5YvlrSKK37VV8jdElQaTZOcdw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793916039;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=n9z95iXoKKfmbrKITQRPQyThti4HCItZNuxZHRUz6TE=;
	b=dUGPH3ySiocn6wfMKoI57R0Rs4aQi0Ld4Tyx/GbE6Td1VM7Llbol3Wp5Y1dpRgffgt+8
	 eGll3iOw/m8TYu2KTWssq1m7csJCYpJ/Jt3Wg+uIb+vxRwcU3u6aQNJwRujAVqrkBTuLJ
	 ZmxlS4FZEdpD1XYaoLDaZiUqT0tBXGF3TBrJRk7Cc57p888T0TpS2PkfnTftvJkRM8BX6
	 C2U5fmjlvRw9+nJG+JLXm45L9IObeRR2jsU41NcsSV27xXWognyrvb6yzu8dfhPKN5BZB
	 fAmioIpUo5GQMwofZrIo89Ts8eFOOtp78B0z9DuOmLq9TrbO+fBreMS5nK2Q/4c5YLg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793916039;
	bh=n9z95iXoKKfmbrKITQRPQyThti4HCItZNuxZHRUz6TE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OjAQti2zT5B660WJyxULvhc3RSBMI5lg9WYeldVkqxhrYluS3yDuarmK2leV+LiT/
	 TydgV3XSz8zuUz7ohcv7//MFYXXLCeiFFdXH0Vn15/5YV1cRUH9+unAIwTMGb5w7FW
	 CfU0dOYNVR3/HVfKnaAC+fclBxEH+53NZwQtdU+xTYQ+P+cb8ligfjIVhQF3os/jmK
	 6iC8Q71Q1+5ZfXSC30/b6qQuALbcQKTwnQM4LwZ6BveYG312AxXcC6EJA/lIOVBT5l
	 3PRdyQmmmQkcwVRR7APkiR6QBPlywoLe1HBwf53wFuVU5uf/YnVO5YVEn/6Z9rh9C8
	 VR34XPrqlXdFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12184811AA;
	Thu,  5 Nov 2026 22:00:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0E94B00
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 22:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C26F0408DE
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 22:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YVP8BsPMOQ16 for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 22:00:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CDADA406D0
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=W6mcPsDQ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CDADA406D0
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 22:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793916034;
 bh=UeZUjALxL/bRQoj7HtE9hDY3xFq2XSs+6PQ9iSQxdCY=;
 h=From:To:Subject:Date:From;
 b=W6mcPsDQxRDgY48fzxnNvS3iU162VNU/SN4BVZZPGZOyjoqknGojR8u1COZfdmuIL
 mbLm/NCKQIL0Ku3q+xAo8ZbgbXjfJlUPVVo6Bg21C3PIqApANaYuJgeTXKlshI9IZk
 DK2q7uOAzJdx4s8CjnUQ+fgI262ZHIADM6tCp44omuRbspfBwaoFcGuU/hXCBLEI1R
 0+4R+OCADL+/L9U3TKrnxp3R9zLycWB5onfnz1lN7mgrl4a/QcQPYGeEzUE+aLc/KJ
 UbdDd+70Ox305huh0Pi7dD3c50tK73MKRVJ1dRvDdGik94PTZNfEQekRnupKRky2Zv
 nEgeaH3dAlUmg==
X-KAS-Sym: v3:f51bdf72230551df:oBFdRS2G8zfHBKRj6bG8Ba8AHJg7PXKupIQoU300YtD6J
 tzNbxyL69nUvBs0dh9dS989O1obLAFF6Hdf4ZLvvNkOyCHBtxzmxbHsHJBRDGOBayWkDMwH9NDD
 LQePK7osGqt2/g/FFH5/ja14WOBlEiEsA65gV8U/TFcLU/BUSQIV5BGXWlamtlPQFlpjMtWmzeN
 hO4BFtEMIEZ9r0iQ7LMNU5Z2+bNVKkVtYsbJxkV5wyr6okmE94aIwxIuLG+ZI4v+xmGRMuJdvmn
 pPNBFV2kRJ65+8CckieQVnIGJcS8hhT5jSeM+ux2U5EJdmruwawqxEhHVVwh5kCcKPfGu7DQ==:
 UoyWLdGfoPw85r3yAbM1cmn9xajLCOvGjTcvqDIE1uu3Gx2baVZszbdPMVtyDHsizXnbgVrdWhT
 P9g0D3ABaV7fVb9oqhJXvxjGl18rq4mJcfzPE0NSI58UR6kROzqhLiAjY9M+QfFslKYBFEOpyr/
 OEeYrH5qgr5rH/AP6WQD8t+F6YXW/nfy54rrFNtc2kF4tceNbjV8ZMXMthnOvxECnu5PzKMJ2RD
 Vq8+UYq6Z4QNtf/rgo1joInk+zgALw9z652bC9NQVHwG6sjkq2GPvxVNzxxYfYgBlCwWgMaed6y
 IlJ2e1Sa+Vdd9X4fj8dva3XI/g0lSKwV/uzUXaogKTDc/rwfcZW3wYYkS148JjTJ05WLBNcUh7m
 zOyEPi5IslHZvsmclzz6AQM0iUQzv3avD+u5QM3QykKex+7ZVFXfP1KUtFT4pBCJKr+0WZwYx1O
 7atp9ZXyKyDeYj8rxilKNT6CqgJpCjkSE+CJOkynWlRq6bXxmehWnrnymEY2TcSPTf/ij5K9N4V
 bJ6UXUv1cmPkP4mwhXFXhO5eq3xA7WSISvqiTapcWAap3Mb0LIZ4ciFBvJuOdtLzeEGcNC/bOLX
 y2iLTA==
Received: from fli4l.lan.fli4l (p54a1b33d.dip0.t-ipconnect.de [84.161.179.61])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 11AE2A4C3945
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:00:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37554)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xP5VZ-0000000053K-3p97
 for buildroot@buildroot.org; Thu, 05 Nov 2026 22:00:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  5 Nov 2026 23:00:33 +0100
Message-ID: <20261105220033.1642832-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: fix webui
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

Buildroot commit 3259ab9f4d88b87811bfae6be291da1e5a91b22c bumped the
package. The bump includes upstream commit
https://github.com/tvheadend/tvheadend/commit/87de3f422c7d9ac8bbaf537f452855ef1d410a80
that broke the web interface.

Add patch, sent upstream, to fix the problem.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...nt.js-when-caclient-capability-is-av.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/tvheadend/0003-webui-add-caclient.js-when-caclient-capability-is-av.patch

diff --git a/package/tvheadend/0003-webui-add-caclient.js-when-caclient-capability-is-av.patch b/package/tvheadend/0003-webui-add-caclient.js-when-caclient-capability-is-av.patch
new file mode 100644
index 0000000000..dab4c2deec
--- /dev/null
+++ b/package/tvheadend/0003-webui-add-caclient.js-when-caclient-capability-is-av.patch
@@ -0,0 +1,32 @@
+From 2b7481730a2daf88919855cfb28e6cee021d6f10 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Fri, 30 Oct 2026 21:02:57 +0100
+Subject: [PATCH] webui: add caclient.js when caclient capability is
+ available
+
+https://github.com/tvheadend/tvheadend/commit/87de3f422c7d9ac8bbaf537f452855ef1d410a80
+enabled caclient when ENABLE_LINUXDVB_CA was set during configure but
+forgot to add caclient.js to the webui.
+
+Upstream: https://github.com/tvheadend/tvheadend/pull/2370
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Makefile.webui | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.webui b/Makefile.webui
+index ed0fcc2a2..be2183b7c 100644
+--- a/Makefile.webui
++++ b/Makefile.webui
+@@ -131,6 +131,7 @@ JAVASCRIPT += $(ROOTPATH)/app/acleditor.js
+ CACLIENT-$(CONFIG_CWC) = yes
+ CACLIENT-$(CONFIG_CCCAM) = yes
+ CACLIENT-$(CONFIG_CAPMT) = yes
++CACLIENT-$(CONFIG_LINUXDVB_CA) = yes
+ 
+ ifeq ($(CACLIENT-yes), yes)
+ JAVASCRIPT += $(ROOTPATH)/app/caclient.js
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
