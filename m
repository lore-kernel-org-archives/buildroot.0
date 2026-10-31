Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5235A606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Zu2BlmRJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=egXSxUVP
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57BF560725;
	Sat, 31 Oct 2026 17:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xjQa_wtgshgP; Sat, 31 Oct 2026 17:20:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1C62E607AA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793467247;
	b=sojp/R6btXTMvPsZ6j79JmmAJlHtfyn6FFzB2wCCtheuTNlR6iHfZ4Q7M7yj55zdsEbS
	 htqgQEZghYCrvfqlfl5bpJdgYDQKPurYRkleRkRpmB5ObgStiquzWKPWWzKBgcKy/YBCn
	 5P/+sMDS3WM7RWmgMJxpjc407LTqa4e1vF6JEdEVuIh9QdDwfcMgewmq8ZvqrQxUyS4Ck
	 gnVugZJyIRumJZvsMuIBE+9O5peXg1lzz0NL/4NT/F4MdW0RvYISsO9cIq3hcH1ZQRcWu
	 1Zgudl/B8yUI7C4LJzk/HlEOI8b/S2UGDWJh+0VFqoEenMeEAjwv19DENlepaHCRVrQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793467247;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=GqtT0JP07ytCWweS158AFg1Ss9Bj/RcVkPDJ3S4sjFg=;
	b=WAvj8vSDzXdJbflSUdTxvD41RrwxYPiQMuqtyXfHxZQe08Z9LW2g16D+Y/aYH3MErl9r
	 6PmjFCJIFOmsqht2TQCR7OjqFSLw6ft+ldcBIUD8fHW9jYGx4Qh+hjnpzD+6rCKTJi3qv
	 P+VH74MzBUMVw/XWSkflzoy685RIaZYgBZIB9OzsmyPUJctBZqi/Zc2I9HfuaWVXLC0Fy
	 sKobj46Y0SbLqr34lLxxcg2VZ7cCvJApn+m/ponA43B3BigW1jdc51EmdINxZEurHiFtn
	 W+bNjkT26tkTU34WTftMk2QDX0g6p7fWWvKbELHHVneIQ/FwxauTqCO8xC7/YBDHvow==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793467247;
	bh=GqtT0JP07ytCWweS158AFg1Ss9Bj/RcVkPDJ3S4sjFg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Zu2BlmRJxatbMJcIq2okAPWhYxOFaxLlWIhyrHDF8MIiC2EPUisd7XKaC/eB5TTgC
	 NatPjzCSMCZPCtfHY+r4xivsI2XgIpDOyRbxPoSrTOrqjjA9z04n/rEjZ6KNw1veTc
	 hrsi99R7UiJWrix9SzfUMEj2bJQrmZMHZ954G/BHPsnGBuWlLpZtdPeTVAl7QYLhxK
	 F7vhdP9he0Nfu7J3dEV5TsG7T417wz5AgSSfGEP04nPd8lY6eaBIZTraKpWWHICt/E
	 imDrl2V5gJomwKGdpwvOj9baEWHHQDTQEK6TMnU6inCbrXuQBe0BJ2BMliR7f97Qwh
	 B8qXBJJxw4lDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C62E607AA;
	Sat, 31 Oct 2026 17:20:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 599ED411
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55F8F401EC
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b4hJJ__zQaJV for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:20:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 77B0E40012
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793467237;
 b=XdxRx1hPjW7mIWerrquisTy56FcihC+POXJA5E4+cX97Nhwv3H1MzNBJYULn0F/N5vpK
 rLAqnTPG4qqUa6K4Dz8+uOiwkyk4pIcy/InmvcIPYLnm6B4McTQbzkv+GHg8kpV+10P3T
 N6/sSR3MvVc4DSSOg2+iEU+TBM2Kbz53Y3HcR0KAy7yvXiQ7kEU5L6p6VIAZ0/3f8lnuw
 05v5Q9zwUOAMlCZkikOcfhZgkRMZlz16AScc+DHPim5dMpkVL6P5YJcXCKkQgaUtewvlr
 /8gUm1a+Z+2dfCOj3V8mZ1QSv5Ub9PwQUrniy6u4wyM2MiX5xsTfUzXF8XCGKa8CSXA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793467237;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=bLLC6n7ioudXhZlSkrbqqlFCapT3TjrPoTW05+nwOgA=;
 b=ZiJFFuNXoUEHdafqIZ/blUF8eeksfLB8KdkNH3W4gtzxE03zCYh0H+iBMbQpE0ZbewQj
 ZHZ7x1DUIt7VnBwXz1bF9TaaVOFAOxWUBg/mbcSIuOIQybV6sUPl/Edk9jW1OHAWFwSoV
 WXWhdr22fmt4jgQr6iMvrGsFiwO9/L8/gKlZ+K+Tn+rsCi+EA4ad8bZWWB3QM0Bym0NFs
 mt4d1hO6b+VJxQkJt8Fqcbc5pQMqpvFidsuWtlpBIvMLxJLlBfUjDhxWVNKlUmIxHH35t
 +PJpve4mAmMW5CgA12adq/ZLRK8xk+UJxv040H/Yj95u8NA7Aflt3dEa5ysTfAav6/Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=egXSxUVP; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=egXSxUVP
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77B0E40012
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:37 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-854e904005cso2025794a34.1
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793467236; x=1794072036; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=bLLC6n7ioudXhZlSkrbqqlFCapT3TjrPoTW05+nwOgA=;
 b=egXSxUVPf8hHNI4rfcJFqqbMqpnJYczcaSPxkF8zyAdsCCx8+YPmO85NfqFTkWDNaX
 6mn/jRHQvCtGCNqsdtOFmBevXjRc64QHjSHBQ/Odv67CENSfK3SH3wssqC7hhiSAp+zW
 xpZkwrpgOPabqAvx9PxDWNoP1bX2DekPb4mZNRSIH9+Qwu1DDRI3vG10i+VHjOGsHxkj
 Albh6gQvz0cFrsF41LTG7XGnX2HsSKBMOOgB0sSbgKQalapXDYO9jblzkIsDq68qfzVo
 aLwTcrfFSYL3fiHxhOY1sOIhNnAdbJbcfcZtUAWyHx/6PEZhCpbFo413GdEBkV7qTNnS
 6akw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793467236; x=1794072036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bLLC6n7ioudXhZlSkrbqqlFCapT3TjrPoTW05+nwOgA=;
 b=xVcGcxz9mbkGN1+CkTNztBnDfbgzwQpndWUXSW8be0GpucHjGUKN3hvrJOr21T5Hgq
 R7gCBwvqo6otDS/L2prREc7vJ+Tu1h7c3NKSQPhEUeBljE21xZA7O0eEmggzjZSh+Smr
 wftkh4J4qvNC23I8v52fEmN/f/Efb8Rqbtutcl0ZgwUCA0Oje/fu/ghLvepTBFdsZ8DA
 GwPZUIZGCHCNB9QXoik9mjsuxLVnYJfX1gR15voYniShOUtwBqEfqMioWYH8fz++ElrJ
 YNRCJItnsUC8809z045wp53TrzK4dLI8bHPVAEF7ToAQs3EWuVqzeIAlxRGNpD3fBs54
 TlWA==
X-Gm-Message-State: AFq9FYJhc/oFRDWukE70J/Q63rHJRGPXcHYCqdEm39nSNfVWh9Xl23YD
 yoornSTzi1tpdxm4Ic0BMEZ7ZTjmN4uao+ZWVh6sLDJH8kM767Bye+KobZ8i2w==
X-Gm-Gg: AYBFou1akqJfyWQIwDehMczT15eO2pOU3W88/YPVl+4WMZYA5jgWl25qzcfGAGjkjq/
 1+QqDqTtzYz/srR5MkcFzo/9dnLmXZ3c24HOAIjQ1NHkqL4lEjrmxoeSicdhK8znszWHduoT3jM
 CZmaHzXGQgugnbQwVdNqEs4IPcwtXz/6LpYC9+wAFEudOhZRQqKfImhXp1JgL77Qa1GzI2EgC9y
 rhH1R6JT5z2aOf0Ft5XpnCOmaiHr+/DVveYlA49bfYAZMdMoEngBAaAxL3X+315+Il57JxXvJBW
 iZ8ZqFLRh/ou/0FhUou7N9BZ23/Q3n1oilA/53lBtgaeHNvpT5YwkJ80gAxIjPaveUTiP+gq68+
 H5pHn03g5CIv8unYIAXogPbO1JPT/aP1H1OmGszYS5Y3/FWKp10FDUlnEied8PUFNxlofBPgsB8
 byejt7ixOllO3J4CeYnoVQr/JqfKyTNuVq/RVgMlF8SQ/PHVxI49e9irlGEGaR8BYivX4ZdPagE
 uszWJVKEL/CcQFRA1+KmENcJGnxw3g7kdX9Mi5dH4ATcBEj7cvCZLKxPoe4hgmxWc7i/Jniqhh0
 B7SyT79OI+jMRLBq8HozeEtI/VGxh0wxWY1KVfsEYs+XBWhWDhDEq0l20E5Hd199HtcoWBULtjd
 dLCbWAEKi8E4WhCxGoIA8VgJFPSRXU66R1yxZUK6lxuug/HiMCQXNpmcUV52O8uAekqEwAcR1LA
 ihxg7zH/sV9Kw19oSWE1X0RxPdcv21pIdiD6kkdQRHW3ITRSV65DD/rcNyQxQgOH+LKW5Lhxu9n
 g==
X-Received: by 2002:a05:6830:411f:b0:814:e9ca:81e2 with SMTP id
 46e09a7af769-85d3641eacdmr2917860a34.3.1793467236118; 
 Sat, 31 Oct 2026 10:20:36 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm4969799a34.12.2026.10.31.10.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:20:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:19:38 -0600
Message-ID: <20261031172019.2683287-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-ipython: bump to version 9.18.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ipython/python-ipython.hash | 4 ++--
 package/python-ipython/python-ipython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index 69db31319f..3a5d5fe34d 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5  4f33ddba6d57ba2a760d2f3436ff3006  ipython-9.17.1.tar.gz
-sha256  8919be8c27f20a6f4423145028063f6637b42a03ce57665bb12015ee1f073529  ipython-9.17.1.tar.gz
+md5  05d70129fbbf763d51ad3d61f179926b  ipython-9.18.0.tar.gz
+sha256  93ec98e27d5ce494c962758111c7dff1ef45f9efdd55604ae70a7d4cabb3e1ea  ipython-9.18.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8387aac32433e5b121c355aa9e6ce2b9a399da7edd59ab94b19d4f5326b1ced0  COPYING.rst
 sha256  e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index 1c8682cf36..716d75d386 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 9.17.1
+PYTHON_IPYTHON_VERSION = 9.18.0
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/b9/32/99451b1283ec5d92ad77073f12e1c667dc10775384d8f15c2914207149dd
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/c6/9d/fea7fe7e360b6a4992f00600445849374675d82d665ffc194aee50c314ab
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
