Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538BC606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 20:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OPeDPfPI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ex2kfHWm
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11F8380E45;
	Sat, 31 Oct 2026 20:19:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAkHhmiBnzap; Sat, 31 Oct 2026 20:19:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2545180E3D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793477965;
	b=W+fmlMETZJ+6/Oec9SD7xdfnYE22d2vgFZcrpCKHmjuG/e+uBzdlMkpyPawnFSABizyI
	 dc6G0qztoHhwxc7LGEIQiooxpWXLrDMc6StY+YcrVz5WtNX8iUPjycG38Nm6VRiSJ1FS2
	 Z1k9t3at6y4Ywvb4RWGkhuw+sVhhJO4m9Oyz4FjUn+//9avhxQWwFPtxX0ycma1PBzCVo
	 kO1lwXgX5Lxhd/jp0BCw8ROGY8FvLAq61lRDFWD0Z64kFVHI5syOGnilMeQ0QyHwL8gXp
	 hzrrwblNmhTDh1F+FCO0IhDathd79DXthsf7jJFUbSNLJb5GJzvHEpG2K1AUTRixmbg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793477965;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ffSi8NtT06HlP79YX+H/nkUreAL903kRsAE9AYxuCkI=;
	b=a/BeldNqvm+XDjagnXcbC1Fg/vuuzl56IfzaS+aEf4WYJ6VeUWSgwl5Nd4P+1STu82Sy
	 V4TPdGFiU5RgaAXlw7umlWY5URQoUXVhexR+wArZkfVRVBgktwZQKpvMmU/tynp3OAuwY
	 Q85sfA+5QqvHG25APTlhOv6SB+ixuCCVvTs93uJOdlEO9cOEgF1BOH/9pL549YyW5dnEg
	 QWMRNmxJT1onfWgz7ca1qK8JcjO0RDHHA5bFnBFWRKddWsy0W906aPUf8l1GlA/szcLl7
	 dSWgI2ueKFn6AWlzH+eOrQv2o79BmDgIOfSo8cXC3eU3tHqnleoLnTJDhXS8tJp7JFQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793477965;
	bh=ffSi8NtT06HlP79YX+H/nkUreAL903kRsAE9AYxuCkI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=OPeDPfPIw0jOufr/ZmJpKefmojnYBCprB/dRKANg9DhooAa8aRgqzb3njr0UkmELn
	 W/noMnKDyqhFIl6SIsG0zVO/IMKCr283GVAurSmrmHd4bTdntW1I9eesp3fcvDi4vl
	 7FimqtFA0kUEqL+2lu2LVZ57vDlHSDwWKh5zy+hsP4S9FLgvXXoDbng98oIZ3i6Rf4
	 yq/PvysqpCVxCEFbRH2bNlhuphbyC8ropWy+96gZdLM0n4cCtCW5rkV0adZWU2HkTl
	 Bs2/dXIj8SDQih+KGuZGj9XEOj2gDAVRolW+C6SVS9s6m6qns6iFmS85KOlj9WIgPQ
	 rZNc0aYP2pS7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2545180E3D;
	Sat, 31 Oct 2026 20:19:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A21C411
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 20:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEABA4064B
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 20:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FSoP9d0e72pj for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 20:19:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DF13A406A0
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::31"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793477962;
 b=q5XCURUeTyzWJEXETPbBhDcdt6UJG8BkzuwN3WwMxXx5FhNalVfsPAJxZQ6hBtOXQhi+
 YqTK/Yqmo6VzhWMHjPTIiCWSYpiM3vJSNQFIPAes558VlmnQMr4Myw9zdU8ikLXoWx62e
 MnUBGGeSJsRSp+B5VpJWDvkPC8zRdNbtTf+bQ6PlJeSAF9CWiLx+Sl5GuA8v6Ggjw7uwl
 nBXveCurV8iWZi/c20QE/lKEz6ikwI3rYYKNbAyh2+F+w2dV7O/OwVLwUBSyXUb60p1oq
 J/IhWoI3uVfY4saul9Uk/kzBxIxqVw6Bkkr/D3xHNMtGJSVjTwW48sIxfAg8pt11O7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793477962;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=7z8FE9Dvfw3+MoW1p16BaPZm2xw9Q62rifzMPEdNhrg=;
 b=fEXZ99dfkSbZcD7wz6Q/WfHEwtk7A95NlbKaTGekYeD8PJ5E60Kgct6J8oZNGq5TWbYP
 msHLHcJ2C+DIFksGMzD/kwBC8qxEa7L96s9lop598ySOfNth1xp2Z1ao9SkMDL7y+sxxs
 1483+nCx3Ma3bQCk+D+w8Ss/o1DJexFeFxOwVq6ghVWgQFC+su76UdE/KH6lO2GOx/bST
 SVL9dr+SLeuzRkz7b88cZfoIDb4xsNqz57aq7sp/G6COQO33DUHKgb2Uvsg2ytOXUltRx
 b7etXTbf9HWJBjVQMEd1zBk9gBSx4C8hXrWZIjD+j0Xt+9t/mDI6+Lwfg38vbNlh45w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=ex2kfHWm; 
 arc=none smtp.remote-ip="2001:4860:4864:20::31"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::31; helo=mail-oa1-x31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=ex2kfHWm
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF13A406A0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 20:19:21 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-48ed188ee81so987554fac.1
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 13:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793477960; x=1794082760; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7z8FE9Dvfw3+MoW1p16BaPZm2xw9Q62rifzMPEdNhrg=;
 b=ex2kfHWmJ9UnTvwLuNoMN0TXXx4ywqd2Cs8iKKhE2GdAnF0EJVj10kD21x8Esllp2W
 fELj170hB1OlaXCrXRLLxzC/rjOFhs2Y111Kt3bCnmnb85GkIetYk7b2EsZ9+iOMzDHf
 VBTf2z4K6GJxk7y0gQK5MjpuXXyUefi9N0NaKvUKeY4KdEJsBnXkSu+aKEyF6ejGIMDr
 ELXrGeAZpr8waoOqqt3OiWBinDH5Ai6F3fMa651vyDyEqGZpw7ckqVebtUJQ1m3WXC0E
 T89TxlxZu7XVYVrD6YfOOOViC/01XjmYeEsrdTof+KVN9lA6JWEsTSMWVuvQDkOTxgwP
 Vk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793477960; x=1794082760;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7z8FE9Dvfw3+MoW1p16BaPZm2xw9Q62rifzMPEdNhrg=;
 b=nqIMEXzMV+9J+PfJycDrtqAZAAOMVr8FAxtj5FGWOHpflfVo79ddwtppDIt82+50e2
 jKeB9YWKok7koV+kq7GfRHQvKnz0WPwXCUe3Ncu4CySFIcNeYEY3Fn4YWwmwcW9KGs0+
 GRjCo5yb/0FbpDHnCJX/PbL18yUn9ygdvENpryvdJiyAIML9sQPgqPxadhvcP/jpEza2
 uvF7Bl80Aj29mmYguuKQCc/J7d4RhwPECuuTcxd5jw2FFRUv7kT5zPWWN9k69jnxU9tK
 oZNnbc94HF7ZjjurwHtJ4+zYqO2ltNM4tmq/m+brG47mG79vStQ9AppqEy1k9w6HuwaH
 Uh2w==
X-Gm-Message-State: AFq9FYJ4qn5C4WpGD3YOBgt6Jzu2+45tO6Bq2GQHuzzTiNpEdNzlO6aI
 16ZLnnZsHQk1c8mFGhOmWD0BaBzEkFDvVXPC6OiaRUS4Mbi8i4sWoBo8dXp0Qg==
X-Gm-Gg: AYBFou0T91pXr3XikKqreY+7RG3Ukmi22apKEOBuQN+0Zn+5XlZcq9yBVJH1DR6xT2d
 Deqi9U06wywUc72d1PuQzP6OTAN72XIpYl0yLevN0O3hwv59NqLQaSOpMVitdjLY2pCNDHUnkOE
 PswPkwHBziyulT6cHYBjlZYPBG4bT9pGb2QpKI6+0wNM5/dIvRug5PNAU2TNsc6w/omkSeg6lzl
 NQZONUfOwVJ4Mq5iEx5XGVm4Bo12MgytLOKYs/9x1EN0aYwp4/XUtDTfg+NDVxlpK07ZF6NGRcV
 QJl4SUZPjTxKbd677gmLDBq4EHRaFg0x8/xYK8cXPe0YDRV4XtElV6kKhIXNK+4gKjTmMKaHzfb
 iLMURZNfrL7IumUZ6zrqUgi3yaPR0KlRzmzY5X/AMxzar3dR9hK88mQ27+CGvdO7DuQfNK9ZPGs
 G8n0qwuIJqpXfkahw2hqaljTh3IrVOvXCVELtdnQFOrexOhHkh7O1D1CYi2fGf4YirULGYdZuiU
 MpFNBK1ma/gkdfuvLYTFqLb+a8JGYnTCw1ep5iV1x07IA2WE6kkuuEmyomtQOOynaJRmQCApqBG
 sdXvOvc1S0i3hF7z3bSevyFSwBMYuUdcJO7Tgf/t59S8wO9i8Y5RspTYtABwFWs5yLJlGiRwj5/
 TPPMZXJSwVZB49sq6alzpWyGPU+tBT3ONsy/3c48lT7YLqC/kiOAbQR4g3cxlFrJlzmf9Hrxccn
 kXDUBcl02GC561DJ8++mOVKX1jbMZTLXBGp66UBJ2wmX5BNSte1BmslIC3jd/K4nD6IdUx5orho
 57jvmdxOAcW4Ubmy/3v78k=
X-Received: by 2002:a05:6870:b149:b0:494:7af4:9551 with SMTP id
 586e51a60fabf-4a9077ca479mr3811834fac.47.1793477960191; 
 Sat, 31 Oct 2026 13:19:20 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a9218e97b0sm2998133fac.4.2026.10.31.13.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 13:19:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 14:19:03 -0600
Message-ID: <20261031201918.2850153-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-bsdiff4: bump to version 1.4.1
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
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Update the license hash for the copyright year update:
https://github.com/ilanschnell/bsdiff4/commit/7e388e358800ff26f99c78397ef551086de18e8c

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bsdiff4/python-bsdiff4.hash | 6 +++---
 package/python-bsdiff4/python-bsdiff4.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-bsdiff4/python-bsdiff4.hash b/package/python-bsdiff4/python-bsdiff4.hash
index d9a7bf36cb..c3551e455f 100644
--- a/package/python-bsdiff4/python-bsdiff4.hash
+++ b/package/python-bsdiff4/python-bsdiff4.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bsdiff4/json
-md5  43fc56a8c7a6125a01561273a3fdfe9e  bsdiff4-1.3.1.tar.gz
-sha256  75366494bb91cd0fd39be5c297525a60cf853ce6fe601dfa67d6de461aa18d39  bsdiff4-1.3.1.tar.gz
+md5  2b1bc9f016efdbb413db2954ddab7cde  bsdiff4-1.4.1.tar.gz
+sha256  d66fe7d6c50ea533aa860ac76689e05cfb0a3f8c7bd6730ddf5089a948f66ac5  bsdiff4-1.4.1.tar.gz
 # Locally computed sha256 checksums
-sha256  44a0326b645fc642428a3978568d3a5c1061b503ce7fb7ef18fbc20be5476e2b  LICENSE
+sha256  409b960b948de9fe1ed54308394b225572661fd9cb6378002488bb318a7f1c66  LICENSE
diff --git a/package/python-bsdiff4/python-bsdiff4.mk b/package/python-bsdiff4/python-bsdiff4.mk
index e7b258df68..d56d524f2e 100644
--- a/package/python-bsdiff4/python-bsdiff4.mk
+++ b/package/python-bsdiff4/python-bsdiff4.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BSDIFF4_VERSION = 1.3.1
+PYTHON_BSDIFF4_VERSION = 1.4.1
 PYTHON_BSDIFF4_SOURCE = bsdiff4-$(PYTHON_BSDIFF4_VERSION).tar.gz
-PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/2b/3c/62c66de04e2ff09a3a3d56e4fc8a616177d481ae6c509363d178d2509690
+PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/9f/56/f7e929c66b74e0efb7239ab02254cbc693f079b7836f3cbc2760fbbb2781
 PYTHON_BSDIFF4_LICENSE = BSD-2-Clause, BSD-Protection (core.c)
 PYTHON_BSDIFF4_LICENSE_FILES = LICENSE
 PYTHON_BSDIFF4_CPE_ID_VENDOR = pypi
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
