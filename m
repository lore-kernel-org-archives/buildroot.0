Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B4A606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WmjL+4yJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AocoEu4c
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99EC360A54;
	Fri,  6 Nov 2026 19:16:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85HDMh4SMn5I; Fri,  6 Nov 2026 19:16:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C446C60A72
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992602;
	b=SYufuhdT1ldQ9EskT66GA2JrgrBNHJ9pOkfuU04Kwg443NElT1iXOSYYBaY4r5iYH9P7
	 hDATux0rRr7FdJ1S+Qo8CUzDqJye+m7dEdV6+9EK1wo69HPvVcwbKr2CXEKaP52UwL1Xu
	 CbEybiVSPHakD4WODDl9ZUYyjzBEcFHuI555R9GAHvpBeI3pwobZSRecyNhhdVAsb00wS
	 3Kf/uliyIa1a1/Rri58lJChU8wzvmSvOb5BYhrck6PnfKxQzt92AiF8RikvWgcezqMKjL
	 Gs11uZOmBG7cd5f+chjaim2oApYD+45xi259AdqMheUM6h3T18kRkFxmt9rJhklOUBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992602;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ybK/tV2tBGB3Igmv5XWmGzrkyf28xIxXJTQV+lWA4mk=;
	b=PiRMHidwsy/mlkwCM54mASE5GbZ2U3gtP+mjA0HWMi+CC9cLZvH+WBqQGU+CRgC3JyeP
	 qXViWHvmRbI/SRbi40/H0hJYbl220RrbcbvNr7rsTHED5JYXPxJdoet2e6H+XDbG1ck+I
	 +g9UEBJpXG9Lkh2yC/c7hU45/v3ihbNYJtEeqcvl/PLqPC7gAu66pJ/2TUUsNrqSZonj4
	 Akt5YOzYlfqCNzrjTG0/Ks1VX0xhfOV5823arJPEUBsVJlGu5pMFKPPPQVjABrmDlmJa0
	 J4dgOSH8jclURUtVZETt5+DQDBFGOYBAkjfqHxz4B+Z0x0JK35w39YK2eUi7QVEQjtA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AocoEu4c;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992602;
	bh=ybK/tV2tBGB3Igmv5XWmGzrkyf28xIxXJTQV+lWA4mk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=WmjL+4yJa76LWocsJCWLGwlcFjTTdvDjMLVG3quKMs0tzOBaywuKGHyI4+AmsHNlP
	 7o0uo/clakdp3xr3Dr216GSEzqnS8mDLsoP+P6IVTKR5+tNPCuqUlReYiVwwf5tD78
	 dNr19553KHTJs5xF6+AP7FPyrxHr1qEy3AmYKGKz0oQs4vrHmORIBj+oj8e1vPsU1/
	 fojrGvuXlb8rrPBChhvGbEab+SaE3G3jgAPj+Qwgt6R74X39GsK+ytsCwbkXuACNzj
	 4dh2u16YOCKY8vL/a6S2kznOUu/ZJyVm5mxwJdZu9Nwj1TpYBhh4kdJ3jWL0m3mAAi
	 XDiaOg77rWZxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C446C60A72;
	Fri,  6 Nov 2026 19:16:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B5CC7A14
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C94260A54
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aTTV_ggEIHTU for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8935E608DF
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=AocoEu4c
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8935E608DF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:35 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-8479f46ecd8so480576a34.0
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992594; x=1794597394; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HLljh07EfC6IZy9vEH5GnfZuEIpO9Z6HSnu504rzsOc=;
 b=AocoEu4c5/sZj45iulUQ3Y1o2DfZfLWLi2B5Maf1Jwmu+JyS/Zvxj0s9qj0n4d4X68
 avc5PXOGLHgdrN2uNwcR+HTao216E/RLDIA/fPZPsIW+wC5AF7mH8SFZ2IFFSS3pfhkN
 hKTCRkUDoTqMViKsQ7DecRz19QRL00FBt7HWMs2IU6gCIPmNi9/tumCvJQQeZMd8998T
 4PonzxJ4HJV7B/JfDUrerR5jBIws6/GrRH9uz9qGR80seYH8qk1pg95hzWX4WswX86U6
 5qScgIaopHe5ncBsnm08vP3/njrhfGwa4S6+CaSH2JRgyXDffr05sxiyfL7gX4xRhtcM
 wMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992594; x=1794597394;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HLljh07EfC6IZy9vEH5GnfZuEIpO9Z6HSnu504rzsOc=;
 b=ZqO+WmGTS7i/NHcZ9vE5Megy0uEK5J8SgKwC5jtwwsgzNtAQFPYzmo5I0HeBTDWdfR
 6LtG5bgOsdc02rrH7IX05MV67o61CcJsNG4Ihky8KfabziJq9SV48x5mMrb5AeecG+21
 4UA3+UD5XlFT+6cFbBo7HJBnvzSfRY1YSF6Fdbp34d8P8ju3nIKzvlPpF2t1fwiWhJPn
 VuUODJFg5GfzPgQAtXD1oOCfMUVv2oBw5WhIMmYNPuBBUVzQ+LQ5+RzvVrk+2z41SgfX
 T7kdhzjGofigcxyy0Z2Z4ZSS5yTrbI4LX0SID4NDUT/I1UVasifMIqCMwfJkL9iSRxK8
 c1Tg==
X-Gm-Message-State: APuU4Z/cpK//z7Dv6MwoFieb1GhC6E+I68osp078MKSr62axLcqQvrK/
 yfI2h0AfbZ33fFGF2ycvAtZX4IA6mVNgISjXsRRzBhylstvIXNHc1euO0O47Yw==
X-Gm-Gg: AYBFou3R2zH6GQoTymglkq6sky7Jdb31GqgrloA0fUjgrgBZXpDT165UndJzukpxtd2
 +1bsbYBi818I7zz+8ErEtuIH3G41VYzDDQT5LBFvcbrw624+2Qp8Y+ujYihoAaAeXqcljqX8tQM
 kXL5ibyRcKm/yWIAlzoNX1jS6gzVjt1T5dK4cJ1n0+Q0oGQfoJzYAzautQ0F99jLq9cJWZQZ5lX
 HlQZC0aronTXPP90O7wjJjWy2OSYql/Y5rcEaNDyqCFBVV+i3ARhtkwIpilP8nhqC2dHMeuWXNN
 rbn41rTj6NV4qgSzHCGcllMdcHLo8qxAlArIlVQy/X9Nsp38RMwwHuoRooknH4Nj99VJrbUu1sb
 d+txCBBREJOdteuJ3uK9XGWBeOLEJItPeYZUcKpIamj0ym2vBFSzSMWY/TPROasGG+f3nU7woJi
 n/mxamdpK6LSvDjq3rd9YTtx5Wjy0Jw0Awq3PJpnUIf4AjhBdn5PmDy2syvrrtoXfum3ZfQw5z2
 gVs7Vv2/37D6ts/dHCMnBNZ1agP7YaeKMauYWobxmV1FUEsUy5rIoMHlldehoDJFvEV0Pohvwx9
 hlQovUTLLnThGqulQUDpbFjXpPUA2XS51bG0Jnrmw2gwFqLL3IxdAtW1A/LEuWxZBmsq719bjV3
 uAl+XxTh6CbO5YY4fRZP8jlVAzukPrnd2XwpfQH+P7KBEQkj/SkKpHELqf+aQegwZipTsRXlc9/
 iVLz5n9oq/U3rXvt5K00UHlS3K64hqRgivM18FFWR9GHzZ9kt+SeaoggjkLBbxYBfvr5IhWAZwB
 6U=
X-Received: by 2002:a05:6830:314f:b0:805:620e:4d40 with SMTP id
 46e09a7af769-85f1cd690cbmr4439936a34.2.1793992594396; 
 Fri, 06 Nov 2026 11:16:34 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:56 -0700
Message-ID: <20261106191536.2120153-30-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-types-python-dateutil: bump to
 version 2.9.0.20261104
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
 .../python-types-python-dateutil.hash                         | 4 ++--
 .../python-types-python-dateutil.mk                           | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.hash b/package/python-types-python-dateutil/python-types-python-dateutil.hash
index 3f070237df..e4efd3686f 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.hash
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-python-dateutil/json
-md5  244541b7e8735556c5994511bedad8af  types_python_dateutil-2.9.0.20261029.tar.gz
-sha256  3258b491686c441d8074cfc8712308741900c9ff128a06421baec3767c503511  types_python_dateutil-2.9.0.20261029.tar.gz
+md5  113522414b63246aff0a477fb0aa0a57  types_python_dateutil-2.9.0.20261104.tar.gz
+sha256  5d0495702a5f7343741f5d842c531bcd1c941da8b4a85307d52ef43ba80252db  types_python_dateutil-2.9.0.20261104.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.mk b/package/python-types-python-dateutil/python-types-python-dateutil.mk
index 352ec00472..12dd6b462b 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.mk
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20261029
+PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20261104
 PYTHON_TYPES_PYTHON_DATEUTIL_SOURCE = types_python_dateutil-$(PYTHON_TYPES_PYTHON_DATEUTIL_VERSION).tar.gz
-PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/3f/1c/1ffbe325ab57b36f134f6c9b1074bfa36ed2a169e530ff7a70fafd5c3bb4
+PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/8c/da/aaf5b20ea6c9e714fae9fdc611b68bde4edcba0aa4b1b853fc157d3d7b37
 PYTHON_TYPES_PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE = Apache-2.0
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
