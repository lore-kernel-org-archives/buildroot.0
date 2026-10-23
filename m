Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B81E606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iLUfgI1T;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a3XlwOIb
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36DDB81461;
	Fri, 23 Oct 2026 18:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9xmMYFak3Ar; Fri, 23 Oct 2026 18:44:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 42D7E8125F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792781091;
	b=Y1+h7U2m97rv67RGf5Zz7HGQPacnXH6g5XtfalOd6MKyOYn+SGQ3dFKut32McZ7mVlts
	 99lCc2y9CcdLGxpEQEqGmk7Hv1DC7G110f/ZTYTYpwYhyLAYA+6H3JFZpzL0U6Ldoa4/1
	 S74EPPAQgg8C8QXNtnu9Lw4ievCvo3S2grwVpq0pUG3QyMctKWg2+1II2/vs9U/CeYoPU
	 9X1WGMIywNnFbJOdCus76Bvll6wJOGDgtPGqL8qNX/+m2ehdf/AQHmsn/rG2cBMYveDpS
	 Se4RCTouM4AEfWSAb2/46uci3JdIaGLGiwRUtDyOTZH6twbWdWXPZCTyBsgRr19smuQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792781091;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/WXNxHUgS8wFZOdTYHOPmTyksiyFrcTSwtVfM7p8BLw=;
	b=BrV/ly/54x3mX9itHzwsQ5Lo/HEywBE3D+hwQwTtsXdzLjfjP7lA11l6MMcj7DO+0iNU
	 wm0SO8l5laPvHxFYoQD4Vz9FwS+gepbMJ4Ich052otC3ly1kUw+KjA0sW8GpIUNySfHF3
	 rMYFZqLHHs+/qRvDCdDaC+IoD3Cw6RCOVuRjWsWaFB8w2sEZ0NMXCAcELji+YOXWlJ3+K
	 h0gp+V4zzIBm7JuwEVXpFruTqhkQeZunVRnCVwX54wRHjY+vONt4UtuNVn5Q/l3DroD5R
	 lWVkJdXOzZvTyHwJZg7shPVbrWd2Y++z3XZw9QFB/4IRpJCGwezkSixjMX5hsloTYAA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792781091;
	bh=/WXNxHUgS8wFZOdTYHOPmTyksiyFrcTSwtVfM7p8BLw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=iLUfgI1TkZKCoZROFrpjKqUKgNxzYR3H4+E2h/L77xLrxGvKAHSo43PrxEHSX2Kkp
	 7yfZ/tTfdZF3wCa0Q2DyOvGmoDLKwb9Axo4xlT9cYv/c1JiLmgctJ8KsgwORWjqiTR
	 k6dpIPzxKfHXBC/MdghZG3Re7Xe2ZrAa1OQT9O9+k1oNZkLRaz3x8MZw4zaK57jeR5
	 dlEQS3OUfuQ/62z5dj3aRZ3DQTCdcng6jHJw4XiHcYVwr8AMk+TuPRcJiBDT+gF9PR
	 CA7MEys3KqJqtEk9v41EPqzbcOyEcUIGurOHi+EpNRZ/yDKMuZ8ztX51ZKbTTHicVm
	 yOAYiBP0uqk6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42D7E8125F;
	Fri, 23 Oct 2026 18:44:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F0E979F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1504840061
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6nvBtx_xoVV for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:44:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2C55A40059
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792781089;
 b=Wi5rQl+i/1eBYrgEJND4s5+22FAY89w1+QNiRpeKY+h1I6ljF6lY0bEy5KlsFYKDBjeI
 mY6M6cMudeE13qOCBB7RWntfitSye/YpsJnB+I4Fi1VrAMIbSubuykXvvPniY9QaHZ/Qd
 OrnV3b69sf5oK/F2tk3aDnX/qKD9cgvBzCc8QJcfznAAxg+eeJDA3icLxY9RDCRY9C4w2
 XKEMnB9C8pP8QGvvehVAmGyE9oKxPEFnBUnoNhUEhsd6sCj3uzbNLPJ7shAHqNkbFD2qu
 A6RESMEJTF9VSfPxvVxFquDc4+lKDGAFEUN3Ptx5jFIfvZsZ4la+BWBauHyEtXseqhw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792781089;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=N8bmstGRaoNsd092JDKhldKcVqZ9vFJsk1ODKeBCC/4=;
 b=FTu4th9AOCRpEVGCLCnyoaqcdHaTDHBa2SFP+itA2lKgIRiiu2FjK07mCjW9QmBuyKls
 Pt89e5sj78/Zk9o2o4OmSgbHnFGyA5hHo72g84rXNPtYggDZvZuNRUQioE9k/yCIT4Z1J
 VwlhHP1YlhwN91v22K0/LS7kldJyNg8Qt3m8jKgFyiBQZGk4+Mup7IBWm8f4nhfGMr6FH
 0qj6Ix2hbdRdkASszuzdheIEZwFgx4jWXSHEZrj+caihWk0BR1M2RwxEXnCHQ9M0qw4Wk
 99x3jwWQ6ZuvGlth7KtVV/BvF7lxbp9dWjLWoqWDtTMgul7eTNr3XJGu/Nqbnfub9lg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=a3XlwOIb; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=a3XlwOIb
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C55A40059
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:44:48 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-6faddda49e7so1024112eaf.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792781087; x=1793385887; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=N8bmstGRaoNsd092JDKhldKcVqZ9vFJsk1ODKeBCC/4=;
 b=a3XlwOIbpjo7KnMI2eqcN2Qy46eCUq6A8Afrbd9pGYYaJpUyIXsdA/7uy1CATh8JSs
 RurQpBLUQkppmJ97Wpq45FSlNbH1LMYRFFjDSWYoh88blXu9le16d0vWOWD/9e5LOvZ4
 Ts+L25wrMyu5LmRoA+TMbjielJcsRtTTMJtM8TuBZPzw6lqklHRcJhnXaV+YnzIy8qoG
 f+ZquGXBT0UEnjQz+MfDDv8J9riMzkalnqzQPP/36gPFWjG2TjawkTek3Q6LUFSa78hv
 oku7jjHYCuJf9mtHIwR0ytPw0HvshWNPoy8aGby+TBEeVRulZgtqLdW60Zumcrhbkjc+
 0JFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792781087; x=1793385887;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=N8bmstGRaoNsd092JDKhldKcVqZ9vFJsk1ODKeBCC/4=;
 b=sek31VZCX0G0sGCs40x2I8rpK+2L687vkiMcanshhkbe+oUyDkdH30o7IHzNjuNxmI
 /FWfzhxq4cxK88eOH4e3PeuSFOc6wKd8VdH4M2JS+OB+y9zcSqPZWxfWxAmvEgY+8147
 fg2lMbjYr5SdP7wB8vB+qQxcCs3T2vyHt9dWCojJpO+LtiLvbyan6y1Ek2T73f0UkySc
 CN3UE2Fd7Out9NphRV1aBQopq0CUiW1CpFs6BoJSbkSgSYHxjv6QUhA/ZUdKvsT2H6Dw
 bP8QfhryRziO7ANOkoE6I+UWyn+HqMtTxZkFB+k3dWQT0rbEAo4VmyKl+BG/CiA7lk3W
 OnRQ==
X-Gm-Message-State: AFq9FYJJIJDD2sXR6YrZPwDPh/7S+jyDiTIet+S3MHT5A9GspZcKllqc
 OCibRK5s0hNZZeM3KzygTDZrhdKDbbjf5bgS3hlNo+h20KAfbmKW9Jr1qpDbHBfV
X-Gm-Gg: AYBFou26UMM4FlxcOlKX/k6ebBTl/UeSKcCGrv3FpR/ADYgYKhY+0tkv74ENjOn3BCF
 ko+uQBOdMVS0Y8OqiqbnzYQ6XDDZxOHpWeazhooScmYEqubYCYJai9ZrA6ICVw5uEAxYte05SFz
 Ll+Sc+BCecMvDh+pv8ZHSyF6Z4E+J+Uuj2wdmBpcEimzDBUMqB3K8ZngTbwSPuSwYf4w8vEiyeH
 DaO4hoBJtEPa+V2OjHVj7vvwydQY69PahmeiJDzzWxrIJKcv3Ato1QexiBkz4Bc2CkUcidru/v4
 qL9knM+/yLKIjIBIr6uWR0XEIYb4whyMQhkPYm5hH2fjf9cTxmgh10Hqrw+fUygBozYzOz4xAEX
 Wt/B576gcViWnj9NjxFmU+ZA9DdjZPTjUYfSK4CdN9u7gexD+fdi61901MKrh7SHXXg07lhk9QJ
 1Y7gdEKy8NvN55+wPVruBYUh37/u9+7/jH03o62FinMnoIMQazfvsLPfgZrSSWVROGhqCyh2Lmy
 ygZOQQeolktmDvq3raQrJvNzT97NvUAIcRz1ihoavbERt2WHqGybHVXe1DGsfKNwo3lG3/BK89H
 ggIxNot9iygKhMAJl+yRInkz51+dY8J9FDuvnWUNSx09cWD1UZg+i/VqBPb5gz0l+E7A/IPXjKZ
 gJPXydLW+paBawd1LhUY1OepmqWw2F53yROMgBgrnmudYWvNzMHAhNWndcglP3w5Lv4XGJdz4fm
 1SOD16aWaIkypk4Hpe7ihC08BcBw==
X-Received: by 2002:a05:6820:55c6:10b0:708:d037:c504 with SMTP id
 006d021491bc7-70b889a1417mr1586236eaf.31.1792781087370; 
 Fri, 23 Oct 2026 11:44:47 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a838310242sm593015fac.13.2026.10.23.11.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:44:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:44:42 -0600
Message-ID: <20261023184442.930656-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-xlsxwriter: bump to version
 3.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Update the license hash for a copyright year update:
https://github.com/jmcnamara/XlsxWriter/commit/fc6fd01016d6d71fb7048e135027e56b41d10d06

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-xlsxwriter/python-xlsxwriter.hash | 6 +++---
 package/python-xlsxwriter/python-xlsxwriter.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-xlsxwriter/python-xlsxwriter.hash b/package/python-xlsxwriter/python-xlsxwriter.hash
index 92c3dee1d3..663b09f426 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.hash
+++ b/package/python-xlsxwriter/python-xlsxwriter.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xlsxwriter/json
-md5  9b577c64f83dec8e357dab62be575e5a  xlsxwriter-3.2.9.tar.gz
-sha256  254b1c37a368c444eac6e2f867405cc9e461b0ed97a3233b2ac1e574efb4140c  xlsxwriter-3.2.9.tar.gz
+md5  f715b29253890540a5892fed5b2aecb9  xlsxwriter-3.3.0.tar.gz
+sha256  0a6bf2e4dcec8b29dd9b86d1e622132134c48bb6fd10f925fdfb229f0447199a  xlsxwriter-3.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  cf08b60a4ded986b58a617cb8304373bda5c4eff42fb4e30d7597b616e116e87  LICENSE.txt
+sha256  79cd3a88b65ecd9996f4bbfb7f3adf0a75df366aa1d3bbb7fe150b9e43d5b4c7  LICENSE.txt
diff --git a/package/python-xlsxwriter/python-xlsxwriter.mk b/package/python-xlsxwriter/python-xlsxwriter.mk
index e6a8fe4adf..d6f841a219 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.mk
+++ b/package/python-xlsxwriter/python-xlsxwriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLSXWRITER_VERSION = 3.2.9
+PYTHON_XLSXWRITER_VERSION = 3.3.0
 PYTHON_XLSXWRITER_SOURCE = xlsxwriter-$(PYTHON_XLSXWRITER_VERSION).tar.gz
-PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/46/2c/c06ef49dc36e7954e55b802a8b231770d286a9758b3d936bd1e04ce5ba88
+PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/93/f2/98b45e52bc0330256bd4bb039cc44b28f838ad85602ce4f358f355d501bb
 PYTHON_XLSXWRITER_SETUP_TYPE = setuptools
 PYTHON_XLSXWRITER_LICENSE = BSD-2-Clause
 PYTHON_XLSXWRITER_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
