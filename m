Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B19E606A31D
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oZzlx95v;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yx3iEHhx
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDE2360A4E;
	Fri, 23 Oct 2026 18:19:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NNJ9kFVKdqrB; Fri, 23 Oct 2026 18:19:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DA1606067B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779553;
	b=KevewHNbYRlryMmK31rq7EBzoZYn6p1YiUHZoEe+uhNPuyjB6dgkCNBBMX8/RVi2zL6+
	 NJQFaUFjeTdBkG1a6rcj+u0MFn98itFsuVsj166JZ7wpq+yDZE6xq/3f36hFQin0dt2Ou
	 rkF2IkEzvnJ7enLjc8PADQmG194DJj9iWbAyP7x3dm3CtG+EPy7jr/qcBbtJgYev8ErZ0
	 FXaLLp1FTnwJuupzzDelRZoWjC7UI9M313vOufZc9LT4GPy9JR3SP4/FY0STz1/U51tZl
	 2/uyPIGmtET43a1iJrlF/sT/AcwU1JEH6+y4W2aLF4pvXf+HrtdpHiMtw4fa5e//kSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779553;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=NfpY+jXwjohyqbmGw37u34/i9F027WmP4VgIXa7O3dc=;
	b=OB96VHsocYxCugGq00V1Sze26Hh0AbkotbXt6SBx9J28WajELLpqhYmQjPt6Tn+lrWrs
	 CWQEjYfIv3RLuKKL85s5DUDjNv6hNd3lOstPk6sH6lWBaPHXcbiXIT90y1EoO57we9KDY
	 ziMkPvFx8uHJLJ8tcQuNZ9qAxDcfZSVXXWsobh9btwxqkVx8q3lXW3F8m2wpMbhZvYRtc
	 oZ9IFPy/gpRTe1sdXdh4j4HwOWcLVV52BjW2oAj7LsOqKH4LL3rV5arjlSHQVNcCspN7h
	 o92XIW0OjjftYw/GvFpcybP9QeFagSXDYxecBc5teWbYNpRCqEvUJzpRweVosNArwqg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779552;
	bh=NfpY+jXwjohyqbmGw37u34/i9F027WmP4VgIXa7O3dc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=oZzlx95vAeynG+ubCxLBu/fPnlhPsGkQXmSnHUQGp8G3I626zQ2WR5cs3+bQBGeMe
	 oPZBgBkoepM4HaPT6230GPuEBgZUkwdZDnbRm8977zr8E0SeuoO/TCA+dg/ZZJ+0nl
	 Jzv7ZBZ1X7DlMV0t0E4KnlxEyRww2o4zheHLtWyJUo6/PZOZbArAHqgcGAQUedKGie
	 QC9ny+prcHpPW6tSuPTgytbCuM2YXl6THm+b/FIUhjgXpw4jX/QkiXj8hA8AiRUmKA
	 fiTumSKkdtnMsKtEQY8y0KjNHNlVuQ1t1GBsyH9P8nzs56yQcAo6LA1SxdU6tdhBeS
	 05DsJpR+hLPKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA1606067B;
	Fri, 23 Oct 2026 18:19:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 18B6B12C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFCF140061
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:19:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZPBDz90WyVB for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:19:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1DA1840059
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::333"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779542;
 b=k/4vN43qZJ5bHF4Khe8u+ENiVoabnug7Sv5Y/77MHSnKh500vn1axFYeebwK49xIR4wK
 P3u873noMfRSdMcqWWLgHZh5hXDxwRKkiMU772Q3UfEqoSXLLhREH/v5PhU4gKYOhl3Vm
 zZK/k+ovMVQC2Al+58WfOs4FTjdIo71VWW2gcbAM74qtzTZb0koJ788oXe1lCKRbHD2XM
 RVJz9RN8b/ZLAHlyQbqiVYkMu+6w4Iyqg3ZsqeqaDM8WeRGoBy0SyXEVW5bIDTxq1BMY0
 7xStURTiDGl5Ost/sgG1S+fWIHWL4jrde/zisIbSxG96pwJfxdNwF3NY9XfrDB0j2Dg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779542;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=yKaXZUPzi2kJBapoAquqS9eOJnBcYA49FHSbd7vVyV8=;
 b=JeM0JEO20XbvIHZYsbmZ8AUATuz27uFLcmS+/5hvHj+QAjF5LLHCytNsb5ipXts2/8wa
 gK2OE5XkQeDFE5i/EguQ84ifljfPiYsI8ophjoZmLGFXVqkLhNo+/sw6/vI83k36CtjzM
 JzxUINMEDsIp31G1KPyiGHP+28uz493cDJ4vgOqQJel4EEz42Rwwvh1nvvujnN+AyM7H8
 lQw0rcv2H3DGt4RXxoE6LPvCm+lPLPVA5nWVIsXws+YDHZTjWmrn/k/bT91ARZpWHgsMG
 1IIdA6Hzi7VxU5wcAbyl6A35Acxx4vAAJnD4oP8fS8iJS+ojDsvjfcecsq/UWL5tWqg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Yx3iEHhx; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Yx3iEHhx
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1DA1840059
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:19:01 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-7fccba9c675so2569441a34.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779541; x=1793384341; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=yKaXZUPzi2kJBapoAquqS9eOJnBcYA49FHSbd7vVyV8=;
 b=Yx3iEHhxyT8l/0fOXtyrTZtxXipnRzPyKG0BoCGDSpOfaaYD6vzc2RrUA8YA64Ylf+
 swAiF9Xv87V7OFXoVU3hLzfa0Tlcbzv6RkOZQCKMDkANMeMZkTw9g0/VzQMjrxeAUfKW
 OlVEyS2bqeSlrUM/Vx0HX9wkPNeWWvV24XsFW3WzM2+qlcasfFzVP2Bwgy7SSL7EJB3D
 DTP1R+MMDQrjuFTk66rh9ntAv530jddcq3Wv5aXvu/qsehdol9IklAybqxYe6YYMerI1
 GTlFK8jRJwYdjiROPPZmvY66zYSAtWbIrG4NYRSc4Zwi38h6OP+9hWRojz8KLxlcbr6R
 h1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779541; x=1793384341;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yKaXZUPzi2kJBapoAquqS9eOJnBcYA49FHSbd7vVyV8=;
 b=alQsIIKvNyT/yG+yhaJ+xTUoEJuSGGy28xWL8wBmBmwE6AIQseIqtj/NOfyWaEx0fZ
 LMHud67gJAmldwW0FM7N4DY1X7DRnvgaaDxrMmH7BEtqRyLPzjjelwTR/kRIR45HOJWe
 kMxdqpbv2mlRG+g4sGxVjNUMaO9UOQObOrcQbE9yQ9aO/+W62OhQIIh0Yq0/A6kgCEM4
 3409/90iurAH9NggukuI7nllhJ/lH42mu86veCT6yuP6MyH5xM0ypHnNJVDjQJ05tu/u
 H33S9yJF+WaNdPMQM8XzrhyXrn6n2lRomli0CxQUUjRLA2wUhXfE1FuTwlCmG27bfeXG
 Lvuw==
X-Gm-Message-State: AFq9FYImzhtwEl1I3kJ83xaMqtJ9J/1ZrfFy9zNmYqDBTB+cJ1GPAGGl
 4Mk7EVNsLmHEebbaBC0x9Egt7RIUdtzrdv4GelmgKCXVum3XADDAPILC+1UcuKz+
X-Gm-Gg: AYBFou2BMyiEEP8BuA6KHKNsasSVgsERdyp7dHi/XR22+TQPVm9nYqJccS23Kaf95YX
 UUz4h/5x39/7vwQidaiEdrpmYuuzyhmP8Qhi4kX3YjHZ4Pay9mm6sA/P0+3NnaRoflxcQCDnLRs
 FRu+9KW6A7FMDP8GnR6n+7hDnTJagG2Dtm9KgxdvoUH/eeJSLf1iYErlE65j4/MOlGU4O88lnlI
 kW8S+5F3/IQa8gfsagu0fxZEe+1hbgG+piU7tMY5hAP2xSePUtcblkwxtHuiui8ezzgNwMnEfNp
 vwF8TtQ9xuj9eutDUyg6qmukSA/t9eSg2PnpXDCVYLpVz6nYziOcQ6HHCVW+ngTRDckkd51pXg3
 It7ivloQb/NF6cY0UVyG0W1YOLUb1nlZuSBqnDLyup5uPR180M2jcQAMs3uLzQ+QqxLHgRwH0qc
 2yvEAVU9nMse45pJ+6IpSb7dN6u0shSAMyKewQG9xP2lruNundhwi0yjItGlb5sZzAJOzMy0Z0z
 RJIRcGD5W3iDGPQQw3ShNf5adGhmbk8d6v8lcj2VYoRuCR4cHVpmYv4Vchp+ApBeZmeRyg+UuZ9
 cWKtqje9ZIdLetYyDbcxrtUeW0xaJ3PLRJdsq/WRZqncahGZbWponPB7YDH5y/IONvUdRMjUTxH
 WTxdJlnecYlHepABY4WLPyDyOWXAVyWG2ru+zFRwSb5BZMYvmbHcocKoqCYsIdI5ZFYSpWQk7IM
 a65o9bsjUp/jkyPq1YzJwuysI=
X-Received: by 2002:a05:6820:4385:b0:70b:867b:e7a1 with SMTP id
 006d021491bc7-70b885a9bb1mr1261797eaf.0.1792779540735; 
 Fri, 23 Oct 2026 11:19:00 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:19:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:43 -0600
Message-ID: <20261023181818.920329-26-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-tornado: bump to version 6.6
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tornado/python-tornado.hash | 4 ++--
 package/python-tornado/python-tornado.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
index 01806b164b..fcb8a26d67 100644
--- a/package/python-tornado/python-tornado.hash
+++ b/package/python-tornado/python-tornado.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tornado/json
-md5  cb425742bae00f50c5c1ba81c74ba95e  tornado-6.5.10.tar.gz
-sha256  a6b1ccd08c04b4a06fb5aeb381be99de5ad1e5375c1785e31d78c880feb57687  tornado-6.5.10.tar.gz
+md5  2c34bf303447660611db3086cb66ba5f  tornado-6.6.tar.gz
+sha256  34c4aa916d7f2b2d5cadee2c6850f5a4a7f3d688cbf58399ea9bd3057af4abd5  tornado-6.6.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index 35fc9ce131..a57e274b8c 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 6.5.10
+PYTHON_TORNADO_VERSION = 6.6
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
-PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/06/61/53d562a57b28c08eda40b258c0f975e360541943ad7c7bef897a40caafda
+PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/d0/02/5f549b1ad5da6267ed1e1fac2eef69257b1979cc812497002499b7895ff9
 PYTHON_TORNADO_LICENSE = Apache-2.0
 PYTHON_TORNADO_LICENSE_FILES = LICENSE
 PYTHON_TORNADO_CPE_ID_VENDOR = tornadoweb
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
