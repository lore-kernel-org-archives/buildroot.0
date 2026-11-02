Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD9A606A32F
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 10:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OFmf5xNd
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30E6F40730;
	Mon,  2 Nov 2026 10:17:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GO3slclYi5UV; Mon,  2 Nov 2026 10:17:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AEFFF40706
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793614637;
	b=PDVI/vCZTry+hM6vlWya34JnSorjUG32uHU6MBnMYhB17QecQoziqRus1bEO39gCiPda
	 Pxi9LMYSeIr6jAijrZRPdmMrKqdNR6xx9/3qo6oZa2Zr36cJUmslmhTtR7nLyg3SOFxwi
	 c19tplZOttxwHm57S2lhETX2pZdpjlZlnOA/JQA/ptAvm4T40EOS6kfY+4t7MzC5UKp6v
	 N8jn/nrvnlamKHa4Z5vshIXhWRZ35uFjvt2SqzR3oMo47UwDzSMhFb99iZmr4eacdoH1r
	 oVPTMhL7/hfM4Fh+MNTEwI+jaOFhnoj4GrSlWE+eBb7K9N33zL4o82DVfFzl3OFh03Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793614637;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+Cb8So9JsLg8HGbLIf7rvn16FE1iqDj4FGv0aiVXqX0=;
	b=ruYP65A15mBwbDyKVIuYkm1Pg85ja6dmcTpPJnrBsOAUvxfZyvphfRBqa8u8evdImdie
	 cALTp7xG/wuQVjWk1weaq9uaKJF9+bf+wIXShXzYKmNc21c0LMe/yXPTtjPkKH6/Oav4I
	 1dbxUQVTF2dSSnuaLFl/ZPG49gRPkyFemBDRg1dnAsfvLy2H2cOzJjvtexKfvq9VNliMZ
	 S9A9X20mBRAxGqXORWyQs1ZFVdzwxoDx0xYS7QpdK+pIDSXycXDpIEAIjmJwaXqAEfB61
	 jW8LTij520S+66cOPQvEe0X0Z5E9s1PKnQMgDSlghkP576VPKDw8TWcAt3cEtDZ1tfg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793614637;
	bh=+Cb8So9JsLg8HGbLIf7rvn16FE1iqDj4FGv0aiVXqX0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=OFmf5xNduUDyQRvERp8pcvT/m29wcjorm0IgHUVBgA1u4BhfAUK+v50oPsitL9yIQ
	 2+rKpHg9PzND9+kmeJMwjYhLWnw9Ve16U4f3Mtm66gxS6hALIsyJ3bZcwmKbksYGfX
	 TsPRR2bYHs81WxXDZ0khcoqVCfK4zfnmZB9MsRmScRQ13MRnbD9yl8I1mMy+6pGp7B
	 KOsoPpfJsmCZQ4QwxbrX50h+inhEc8cOubXtCeFVMWPENFQWj/gurmwGLlYqMYpTx9
	 oULRJwPEVgpPelBuchp52QKu+DHyey1wBIHTGli8BHpsH3Pm+Ve02Nuuo5btWklB1L
	 wYJSLhaYeSt7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEFFF40706;
	Mon,  2 Nov 2026 10:17:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A2C1AD3A
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 10:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94FBC400C8
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 10:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hq0cKitudntD for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 10:17:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 58C5A400A8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793614634;
 b=YkxUfzKp1z2xoFQG/J3ZHiV1ntMRaFMoVVseNWzLEB1x37Y+YKJYfC5wvGtOuZ+/qHG2
 +0Ykiy3kSc6etXo9Lb7giLiXuOlgKTpoPhSojtZPHT3Eaj8u3UuPxqfASUHxLBjOXg+bR
 gojcS629lih4AhxYkv8a1x0m5RNh0Lhv7hQwqQAujYQOSuIudgo6cpzuok+ZSNA7coBT0
 qBLlzQyGQivKPlXYQlxrspunBDl6WXDTH89y+sUYUHMY8F6h/jrWyTnqDq4RZdsLKOplA
 zD/0EqTLHY+ims1ERRb5rtOO7+5c3wo2zVW24I4izeXg4xs7nhRfETL6mtDP9QbDxKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793614634;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=EkIlLl33Da+NSv8ujB/ahdPo1WkfQV9aCXRD+DyTYrE=;
 b=Pnzh78+J+o0TNJC5q7gLBK5qk0pMOcTGzPlaegtRonu6Js7eVLWXvtYCEESzZeqJ/Jw8
 GWVp2Z9wOvi9Cebb5e0BgZpBMNg5yr6iHqT0Y7W+TSc2aHU9Bj5GK/dWNaWWuPv8A45tt
 3ggfaWyctTLcWk94GJnod5dYpbOLsOQHvkR2q1elZ/MsUkkB8JxYGXkPKOv4YqCG/BwHg
 vtt5T5aINoaD6HPmNFLmRo97pSEjN8vim0Mr/7B/Yw+IvmDAyQyrENECKf5slIAeXCePy
 HC9hLNyrGUYw6IwHCxlAHkjdnOxLNWb+IDRwP2rKZbuFAtk2l4Txh9sFQE2l1Eo8Lkg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=NN7WBuJB; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58C5A400A8
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 10:17:12 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a2069b9710so23688085e9.2
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 02:17:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793614630; x=1794219430;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EkIlLl33Da+NSv8ujB/ahdPo1WkfQV9aCXRD+DyTYrE=;
 b=bI+waoaOrxv16mI2mlOEdvYa9lOzwnzoN97lv+hBiB88WiiJuS24HMi/cIZ6AZmPwp
 IcViVEKSoAegAO13PqCY0zXmFEqsSaeZTWN9RUznKEVePgNTYkFSUrf3CiFYhY21KlNN
 yqWexoRtXD4GTOZAMm+TbznABktyj8Rsudts7ft6puzNsCEIqFof5repSs0V7vFHPB9A
 KKfh4CbGaNUr2ApXGI6twCMTbOACtTn9vNIONGo/4KKfrtrMPTWdEVk8TNhS4ge2BpkA
 hKb3WNeSXxsfmsJdeXXFmN2f+b55see0KzLuYW+nTpvtDUFnNygeSjAzhx2nsDat/UTG
 Dmlg==
X-Gm-Message-State: AFq9FYI4XHJ00CkUP0aP3NuCspqAHGSx4YlI0lxCB2lsnQHLT+13QIpw
 WUfBUwI16IqM23fkbBdSwQGyZsr8vBqtrVm1kOPJQzVcvT7j7pD8LVSHioCn7hP+gmr2OA5w0J8
 9is7J
X-Gm-Gg: AYBFou2dWAoqK3nBreWNdOvZUZLBnuffr8mFyhcXcEHm4mL6UBfu24UoRSSgVzxiOvD
 ddQ07Ar0Aza4nhKWMtYACs4iwKy8S39queA1iHCoOpchlnrMZX+ItI666v2GaU9qig3h18p913h
 1oWv88FZmlhMu0zkcDyfiCPML8puKhbvB6q2YATnDtHKovVDfm7Ozivx9LO0hz0UWZjb/pHXCqp
 pzdAb44WPSsNvPYVwWcbq2HfvsMMDAQVSuAE8VpP3rR5c/5wZ8Amad8wb4I+T0daWAXkYL2TO0r
 Xex3mv2gziFoq7AAlfIk7kOZxYzmQqOxP0D3pg2z/EF6NygrKK753i29KPKLnIQWRYZIWJjF+Tv
 f8tlEBid11v5Z9O4lEB3y7NVJ300QxwR8UrKk93dL+KO/gmYoV9e95bTTPsAwwew0mieFuzy2ct
 FsaBuLP6xczWWuFFu3shh0wnbLCpONsg4dNi/8UM+AxyNHVgctKW16cSm+NJoydI6wvJocMMJfB
 /X7uwBUJ2HSGHQAJAMC7Ns1gyULRQCg2M8APc2lgksjziFNX7hP700vA0CLK1usutguxiPf0d8p
 YxwYxQlpo1xV9EU0xthku5ZcZmOcR97MIHoFde8b02+WYWoS4iH4NSQalYcjJnSvE5aiKJOc6Ix
 47Nkn4A==
X-Received: by 2002:a05:600c:628d:b0:4a1:e01e:1927 with SMTP id
 5b1f17b1804b1-4ac17d16a1bmr217417565e9.5.1793614630168; 
 Mon, 02 Nov 2026 02:17:10 -0800 (PST)
Received: from dragon.home (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf67aab10sm255735495e9.9.2026.11.02.02.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 02:17:09 -0800 (PST)
To: buildroot@buildroot.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>, thomas.perale@mind.be,
 raphael.melotte@mind.be
Date: Mon,  2 Nov 2026 11:16:49 +0100
Message-ID: <20261102101649.1855600-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x] package/swtpm: security bump to
 v0.8.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This fixes the following vulnerability:

- CVE-2026-75900: An out-of-bounds read vulnerability was found in swtpm's
                  SWTPM_NVRAM_CheckHeader() function

See the release notes:
https://github.com/stefanberger/swtpm/releases/tag/v0.8.3

(alternative to commit b6a653e5fc31ab9e0e0b105583a693938b59711a)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/swtpm/swtpm.hash | 4 +++-
 package/swtpm/swtpm.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/swtpm/swtpm.hash b/package/swtpm/swtpm.hash
index 934d3b6ee0..8d723886c4 100644
--- a/package/swtpm/swtpm.hash
+++ b/package/swtpm/swtpm.hash
@@ -1,2 +1,4 @@
-sha256  b281b4e8c39f68e1928675f788abc70072e4081152e129144359a8c5c304c06b  swtpm-0.8.2.tar.gz
+# Locally computed after verifying signature from
+# https://github.com/stefanberger/swtpm/releases/download/v0.8.3/v0.8.3.tar.gz.asc
+sha256  5c416e3a241d4adb61c66ac04ea46699885476c6c3aaa86011386e14fa4a67ea  swtpm-0.8.3.tar.gz
 sha256  19d27d6e96d07022e5e688f75c974f1ceb9aae9e90e0fccae68666d02099cc4b  LICENSE
diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
index 598d56cf1d..636a385db8 100644
--- a/package/swtpm/swtpm.mk
+++ b/package/swtpm/swtpm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWTPM_VERSION = 0.8.2
+SWTPM_VERSION = 0.8.3
 SWTPM_SITE = $(call github,stefanberger,swtpm,v$(SWTPM_VERSION))
 SWTPM_LICENSE = BSD-4-Clause
 SWTPM_LICENSE_FILES = LICENSE
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
