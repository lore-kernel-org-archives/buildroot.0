Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2420606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WuVEFNr8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CVqtaAq8
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F2D581693;
	Fri, 23 Oct 2026 18:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QI-Ged-71to0; Fri, 23 Oct 2026 18:19:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CAA8181266
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779545;
	b=oGxdsK+KQSyvsrMc9CHQVj/j4CZq1+qlROtSblLNrU/dl9ZvyoyiyNzOmH/NYjczWprR
	 5Vxy439rZqD8WJhxLZQNYXqy6DjJobKpAIiHpmjSyyXDc+L0Mp9wIhUPCmUL1tcLpXAtB
	 5VW0gvubSOIF/gJQyMlGvsCjCX5ja8X+tSqboInPhawWDCh+oMPt9iO03VCHObPMG80lb
	 RB8FF9MlH9GFSqW3JNg5tU9d4LpOAYicQj//nPaUkvzNlQH3SQs/gTcgBi/m4lionRJA6
	 uZulERzYlhbKz63J5UvOECEVgmbeVAP/vgAVpM5zxvjI1TRmyi4QfLrgRU7VBBwntwg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779545;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZKFEpRNuODEao4Sy79nuZwb7FLOhSo3vk+Zv11skNDA=;
	b=E4RvvGzoE0IuqrvzYYP0htOmMlEbcqPNL72QQ4008SuzhHCN4riSa7hw3FJnYhlj9fK9
	 fGzu8xvq5emoJzbY0NOQ7euAAjjDphr8dTzhl1v8qq76KfIHrIy3svaTqrQE0MXFBZdn8
	 NT+hVnbirVv4RtwLCgOOKsBx7BeHvFTtgy8OghWPvuyV+lgw9pZxSAfqDjjt96+0SDljF
	 D1IJm9S9gERqFqfIQ6ldpZ75DYEv3jw0/FbF1ja25Xvc+YM3gdhGhmih+J7tBDzjpVNtj
	 tcX2zMkr+QRkIB+2CUq6IJ6/lMw80RJnqNP3m/et2T6dqcnVY4InB/vdner15flDRYw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779545;
	bh=ZKFEpRNuODEao4Sy79nuZwb7FLOhSo3vk+Zv11skNDA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=WuVEFNr8tShtwCs2iUYGHUZx/4eAZJmeXsQGhxV19RhCcGX4Zvm5oT+QI0rm30s2C
	 59nqCjZrwifgD3hMyqoFCk+7tvKOcIqhe03182ypXbEzauM8r0gyzJhqq6GEFmODAe
	 JS8IVEo1QTTlsavZJSWG8vD2AzSeYqfMaa53V7Lr87xMv97S+z/LG00hixP2EpJOdh
	 9d9NdaGPoCVq4kZDQPSHMrA7V0SuDti8l8+BotV13MRBRUd7fhDzmLEK6xX2L1ubra
	 XhsQC9H16FP/31YS+epoiqwN9hixsTnEQK0ER0HHtHxMEyvm7QOTwESfsBxkYG/mrX
	 86onjBXDyIHwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAA8181266;
	Fri, 23 Oct 2026 18:19:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A37CA12C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 958E240061
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ocwHECHmFO-s for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:18:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A9D5D40059
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779535;
 b=o7kBmMtQF32/YutWeuNP3pa0zf/jWfkMox3vMr3VSp5kgjBWWgylsYRePb7IZ24HR4eo
 qLMDjl5ZJ4qv+H2IOMVFACHfVJ1fqNkXkViOsGcjnvGt91ofs4Q1KP0LTFDYzkVtxQvep
 6LlvSbDuEm/POVDqc96fZBRvvXxw+9b8HwY0wq75trKY4pzkbPhduASpItQ1vbXC4P73v
 lhTELqmrv/M8t7ij3T4+E6SB2yxM/I8Tue6qk20PtNKZGMHtWRKmn0iOqrdcH1uVy3E2s
 BcHz1zjE3/sy+LcJHkgMrmYOi2yxsqkS8QScDfqP7LnWTQthl2Bz0tUrWm01Fp8jWZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779535;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=N6TUKmzkXpPyaGzGYChqyNOKu5e0+yMUlYrYK0c+4sc=;
 b=GyO+roj0qB9vwbvS0b5emzx5enF2SgJfCepLEUrKIEaisSirf0lUGkwAzpSZAUhC/ClN
 cubZ6xl9YcKGwptRDuMERnxqqK0oyQ8Y/++dWkbBNLm5CYyOf/64a+vRFiSisl45VQdz/
 2KUd0URAar754b8mknfIyRQkv8Oy/PsdxAG0uxmBVMZXjIZkGrSsqg6/ShfNOeZnG9Bbp
 5/tRuzkJ4lvK4z8kkzeastoEsAKMowWyiWnKs0/xm0cCQojwicqGM12RZb1GUn5NN9OS4
 cOYZ6UYgiOXlWH/rkeyT78eKKgy6w3qJKeE9mZSBYO8r1iDxwHUBoFNBxI0SDmJ/uvA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=CVqtaAq8; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=CVqtaAq8
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9D5D40059
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:55 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-705cb6cedd5so1501191eaf.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779534; x=1793384334; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=N6TUKmzkXpPyaGzGYChqyNOKu5e0+yMUlYrYK0c+4sc=;
 b=CVqtaAq8Lmp2Rqwg8Q8PonvUh0d92VtjFOCdNVWkcG3ePLrBEPbgc//DdE4LLspsPq
 ov39ZTtJh4onJSJKwn5hubj9nWecHDZgJ4ITEz924c3woLiouKPIJBXzxQJFkD9oIshW
 Tidn5XRbiLp0fJLXsBdh8gyrgS4SEHWVFs3+YUjNVrtVEQXJLiqBDvUH5oXQPbe791AW
 RWxutjpOPUnFc6Pvej5fgEdSwBikv44Fh0ITQcMNIDqYt7m/Gv9BcX6pKw4jn3LXFMbd
 gtno5k3/X+WXxbB0ZL5womFTINwLAdKFVt+6yN8hCPCOVQJPtsFLqChy33L2xp+qX+9v
 hq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779534; x=1793384334;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=N6TUKmzkXpPyaGzGYChqyNOKu5e0+yMUlYrYK0c+4sc=;
 b=t8N6Q46ykWwHH3F8bvBDQ93X9ZLIVJQUlQtn79DwO+iuz8fClWsv3wktEAdZDCWW+a
 qIPaYYrd5ru+7GegBOdjLnuC/t9F7xuqOmWaA/V+s8BvZoLFJabXa/ntaUFgcrhiVdJx
 EdBL0NTfbS318bl0feOfOpNX28//de0cqIDjWqTgRDQtLF/skBw9uVwJg7SOQ4gH+a5x
 MxaYy7nlB4GbC8SrFKMVjOEebgDWgoDHLWWd6PIbMBv9QBIS2mBeKrKBTd3gNmgKMdEH
 32PIif4oNpLjFb4Tgs3QjOmqXIgNjdBCTVEJbvMq/ehanLIfsuJBG0Ag5CcztA/L73XM
 Lc2A==
X-Gm-Message-State: AFq9FYJ48QRuY10FzJJNgG6ld+3e1PNyqfj0C+ZLS4hj/Cy+878TAx87
 SrKRojUFQLp19Y2AXMRoeEnweZ8bclvDdjhpnIT/fsRHamfA3dZj6CxBSmhInWgM
X-Gm-Gg: AYBFou0MqQh682FVmjmThJRfB288uY+6Ay8XnS2Wz1cwzvpu7m1Niu/De5VhQFo32cb
 n7OBzM461CmdzLGWowPsq5FmLK+jVME3GHbWPxDM0uf7fpv8pBcDL+heKADEqAEEq2sq0Y3mAW1
 T30fnNsmMgaOUdzQhZPnbmJQ+aV/S0kaVtJpfded/4cJZt0BfjLPWjeebDJYi/yUpU+dgZpcTmu
 CiwwmJCokcFBEnzf+ufuAXTfZNstW4pWUQVc7Ife8osCmj8nSqqLhT8AjW3T6Fzwc2Ij/d/SMRB
 S9Kc1Es5jQv6b0Vf0tIdX0FK8+V+eaYAakIMsINh6VfztOY8gzAgjNTt+I11ND9TXnsPPc7V6u9
 nZ9BCa5DiVD49Bf96GemlwN5W5ES8Ceui0ctaNwrSNHmdLI6lD7iCR5T0MSPYxWSFrAn0Rt9HFr
 tW//h3/r7Qk6UmwdthaYZ9bSfmM83j2P8PIg4OeWHdqTPSWBqF4UcCGVBFTIx8taB8+8L4z9DuV
 dA6bJV5DoG36VoHjcnuP3JggPBNn13kKKEbER/sYmxoJf5NJdWgpK3ZJZlmgJrO44/muuhVLkVN
 UezVTYv1ZLN7DfBQ9/jfcpNfs4nw5fZrhSwE8lWMbh0OIhkpyB02xOBJKn2wmVhnWibSJe31AWw
 C8rnZkLo5NtIcZ/4VDxqbPLi/agQxLxGY5KPxT1sSWMeW95igCSSVPWTwchiRs4H9pqfMXZNT8V
 yJJRn3pMz8/omGxBMlPyDk2pw=
X-Received: by 2002:a05:6820:3307:b0:6e0:8fc2:8499 with SMTP id
 006d021491bc7-70b88a6ccbbmr1500394eaf.30.1792779534373; 
 Fri, 23 Oct 2026 11:18:54 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:18:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:39 -0600
Message-ID: <20261023181818.920329-22-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-serialx: bump to version 1.15.0
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-serialx/python-serialx.hash | 4 ++--
 package/python-serialx/python-serialx.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-serialx/python-serialx.hash b/package/python-serialx/python-serialx.hash
index ae0d9d8d02..1726bb480f 100644
--- a/package/python-serialx/python-serialx.hash
+++ b/package/python-serialx/python-serialx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/serialx/json
-md5  2e3b6725772273c234aa24ee08b384ca  serialx-1.14.0.tar.gz
-sha256  508fbc83290b2c368cc3cc034bc2a30fa083d1bdcfae6755a1175f6ec14c8af1  serialx-1.14.0.tar.gz
+md5  a1fe8ade48ff969ed3a16f2f3f6272a6  serialx-1.15.0.tar.gz
+sha256  89ffdae6511492157eb1e957f7f6cb0cacace088692f7477b27c4a6b6dbd4d6d  serialx-1.15.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-serialx/python-serialx.mk b/package/python-serialx/python-serialx.mk
index 67de7a698f..a745694573 100644
--- a/package/python-serialx/python-serialx.mk
+++ b/package/python-serialx/python-serialx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SERIALX_VERSION = 1.14.0
+PYTHON_SERIALX_VERSION = 1.15.0
 PYTHON_SERIALX_SOURCE = serialx-$(PYTHON_SERIALX_VERSION).tar.gz
-PYTHON_SERIALX_SITE = https://files.pythonhosted.org/packages/19/46/a23c683d997c5d46f34e777abb7f4b0e41e189b115a9f6995812e404595c
+PYTHON_SERIALX_SITE = https://files.pythonhosted.org/packages/1d/5f/d1496ad01c310ae573921ca24c62bfaad9ff34cf16c583f4ae85f39b77e9
 PYTHON_SERIALX_SETUP_TYPE = setuptools
 PYTHON_SERIALX_LICENSE = Apache-2.0
 PYTHON_SERIALX_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
