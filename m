Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DB4606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oJoQKW/h;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=plMWjBdU
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B046D6079B;
	Sat, 31 Oct 2026 17:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id thOPwI5_gaNY; Sat, 31 Oct 2026 17:20:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9864860779
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793467231;
	b=fxQWi8Ldl78EJJCvEI5cM8SR2WoiWrjQOlNIHfuhA07idWDmNq6k9dyu7pcFsnhelIBj
	 6gJAUn03xi39xE3HjUYwLIcT3T70eA/XoF5vS0zm6qWuj756JdYEwvkUWbVgtHYXjiI/3
	 86cBB3OEH8Mcq39mJjAxRm3lp3nnqZugWTUHCq/VJnjb7xVcv5QI03+dDmr6pebCUC8xX
	 Unl7RhZnDb0/C5SXym3QHaE0CtlzNRGwjdce5u6/3x8P1Za0BVUB+PX2k+0XBV17yb/IZ
	 HyGnPsOVeNjHPWAPXFC4g/rLUJskNZ3ZXPKNVqbUGC5Ikkl19qIghJ/KVQv/eCmh2+g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793467231;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Y3yacIddfz7eeiCx/8DSsqfvIh1NDYJnSKrsFMOdvuY=;
	b=BvMJO7Zaz0Ta+MYlVV6o3VzjvS3bKtTnBglMg8S30AAjrK7rFgmbdY01SmLZl9eNkH6l
	 hMme1kE1reyUBxEvcxxxVJsMY/keaRsDp9ahA/LCX4C0rQigezKHbOb0SAdKbKRpFqTBL
	 aBPMpOWguTtj10Maw3IyUd6j6+0+mDje7USlgIWLJuFXuMnmTCCZCfO4GFFu3Wnibb5Hy
	 yRKwXNVIgFfWWRBiwc7jDCisW3YeOHcKPQoMre6uPZcfwFIangEc+F0AMht50lTZa6cDa
	 6auiTLBLg59fe157AzK0LyPy3CaNHoUVkjBs0M0O7erSfF2TnsCLPAr3E5WaQxx2CJw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793467231;
	bh=Y3yacIddfz7eeiCx/8DSsqfvIh1NDYJnSKrsFMOdvuY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=oJoQKW/hKqYN/oT4zjrBHiho+Bu1WnpmNg71u4q93tNEqdiymyH3sZ/SqVWNKLtZr
	 GNHAuxz1Sz4iGYeL+TVELO1GvaCi8X0Z8YSW9lEHI4Dtn1dU79X4MXU9pm4P3uH0DV
	 5Ty3KaKrNy/7HkiZPKQqBsj7gMqUJYm+o4eLeqiUqiDin9KCnUdsRA0hlX9u9ywdoJ
	 oHcTRDG1036+JkehIrgCQ1xpUXQFxkaAUzJgZtZ1E5luLZqKglWQR/DYToGesGbjue
	 QbDbjTRL6dfMBZveSic+gJkLikTFcFP/+uDQ/R5wBCSRBCJcSKrDAj5z6Bb71CJ6E5
	 sjHAqOezPbZ4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9864860779;
	Sat, 31 Oct 2026 17:20:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D5941411
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B6A340360
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ACpAhpE3sMk7 for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:20:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A994D4035C
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c34"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793467225;
 b=p6Rq9AMuIKE8le9YNwqq11FWnEsru9uKU0vEhV6ukrPvOvpHkbzbZkTg1ZrDmdz5Lakp
 3rRCFvC2QIIO6+tgNmHOsAduiVr5g9TfhamuxxVZV2rnIEQgAw8CYKUonoaceWqN6JrnG
 BvtmaXiJ0FVp4m7BranDPV7+PChry4LBqhmTZ8cn7Ei/e6+ymLtWkhllMBe0rhGCuUqiV
 8qYXHGf3U7LSTAEP3pEGyyS04qBy2uZR+qrGihSwLjjIGeawuvDoRsGrGKAZFSeC67Ewh
 zc0yKs04XevKXi11d1RHHrFb57vlRDLlOXW/7sNCdvY/te/W7FKNxU431ZxWxSQlxZQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793467225;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=k1b+zy5oWegHr2MetXvoEpekLsvJkji1GZR+xin8M7w=;
 b=NmAyWJ69sT/EIkg3YOre/1ufRqLsJgt3W78OnFJlXESaYIdIpFT0DS8N9nCqPcXsDOWu
 oV6lb6F/DwUP/rcRcMqBgubDyAF2WX8LBMbDcMEgMv/5EFb7ekeYYeGVvN4TfAWNrp1Fm
 fxgxCnMzAqRBwXPwDy/x32yAwZujPU4XvEDXJ1a7TMfv2inWZhJ/GJRIagcXB6dPrcCJ5
 mRCxfmgj72XHSUA0ednbdFGGMMnV1My34RVHZBNxGnwbTsocPuRwtOFCTZu5Idxsk1URx
 iprAe4GSZhP3T/aP70Yl3BjF2xlqniulOj2Hb8/24MDBRsBIBGf5EMYuF4MBGfMf6hg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=plMWjBdU; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c34"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c34; helo=mail-oo1-xc34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=plMWjBdU
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A994D4035C
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:25 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-6b1afdf5196so548157eaf.2
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793467224; x=1794072024; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=k1b+zy5oWegHr2MetXvoEpekLsvJkji1GZR+xin8M7w=;
 b=plMWjBdU8q2XErseJcktb7vqbiIpTI0NM2M5yBxWfMfVub8vCSi73Ip8BxIqfHCPTS
 Z5Ru5tinB0UInoJTdgOBBqJ4LcVnqStEEEtmRi90MfnE9pHZFH+BKWU/vXHUx9+f4MVB
 BoHmLMJHbsecHeZq2f7dOQh+1tiidAdrYRVK26k88JP2ITugbj/yrmriHDHz2vKWnEYR
 QY73POOPAcRqUlUBwZzOCoyWPd6uk2ywPOkaTpTnbqJLevaaxkCT117eiyVjHXhnXwFL
 puA9C1IwBfMHu6cwnzYSDD50GsMMTJVo1cntIYzAlMbrsufRdKWfpQA4IfQGNQXblShH
 COpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793467224; x=1794072024;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=k1b+zy5oWegHr2MetXvoEpekLsvJkji1GZR+xin8M7w=;
 b=CxRtnmeHRj+m2dY6e7ol+jz6JO2/wnbHXRNPClqNBDEzrQVVfjSG8kuTODl9aiOJq6
 9ggCEASMI3h5F6FiCOslnVsWQ6YyD+0SkNzHL90qmOqvadWoyiSHvVW3mFSPZE9XwBvV
 rBvgL0r8Vt99v5fB4kdWEO/aB4RH+YTpc/DikVMrMEUYq+uGJTe9+K2yhbT4JWiGVU7t
 rXpIKmwQTQ68XT/8HHC+Qan6nb/BEjcyrOyGcLjtKRErxx9vJXriBsrlET0xxa+6fEOP
 Ci+m5AI8lqGB/03pAcZwDMqdEomkc4B0vAzqPtfNo5cwHE/m4M7gFS4D0vtjSZl1LJLE
 LgXQ==
X-Gm-Message-State: AFq9FYK4glUZO7mbNZisrZwzHYmu3hgC3d9DMIDu2F/UW0b0lB8ozSpA
 UX+FcUxl10oVHrnfeeuuLiVpSKdWPj0+XoiztQAQIpvpP9QGYT6PReK6oqwjEg==
X-Gm-Gg: AYBFou2kCV2TZPDKnFz0RdN55Wkt9/LOWLQAs5FfPTkYBb4oUHWgDdzf9wHA5nvys2/
 RRwk+xgwVwStBUOJjOv/amUFWIiiuO7HgxmQ1tz4cb+INJXXvnDMoHmbPblPPqwXLNbbZMB8YvN
 xUiV1z0KuFHd5gcZnDNjFXeIOV1HsqGDjkX+OSgT7nosWnvVMhBilH9Es/UEq8q0h1MPHOHE96Y
 PhqnhPX4oGPi7+yiCqQTnSpvmA2endAdYQf/7c+Dr8SCiRNYY7fBH2248l0rG7UM03ZUz34fetr
 KmB+0Ry1Oo15ZzZEVTrIuqjGDVcS/+rOtIzMK0qc+m1IFgIVk8pO6e2sNSaiNlrOFyXIyQeakaj
 c/lWqfHd2VDEx/p3UVoG7CvvT8A5zgrUrKHuCLOhVZFjgiABhI33cayKeS+BojPNSpquowMOggr
 jkzkTbYTZzeH0oOul68rP8rFpY7VJxpYa2VUBfmre9ZjI2y4t0T/c5cQ5MZYQJ/QOZJd+M7QTQc
 U0agpl6WTqg0Jo9h3Doz6nJpvQNuns1XQAwIHkeeKUDFAxHkMVSy+MTPRUYMSwZ68C6AQXojSYn
 dr2cfNJt0ego/aLoTAnwBgv4tDTzOj2gr4ePqyvFCpK99uze/doG7jQ+hJK+bWTCfd2eFI5pzI+
 /TByeRFo1r/62NXiGPiZ/K+hyOPojd2rim9gjXbeiN5VQrPIoTRi4FkfcvmKr867AeXqcBLzRSc
 t5wgoLBDFF5hiZKLfA3dmpT2HdDoJrAUUFxZBzU0ZxB/53HDwrLINcrba/wYkZG14Mu3fw1M9Hh
 U64PbI/HP7u9IHa9T0ylhg=
X-Received: by 2002:a05:6820:1ca5:b0:6d7:a13d:fd7b with SMTP id
 006d021491bc7-714f28d08c3mr2871716eaf.28.1793467224288; 
 Sat, 31 Oct 2026 10:20:24 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm4969799a34.12.2026.10.31.10.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:20:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:19:32 -0600
Message-ID: <20261031172019.2683287-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-dominate: bump to version 3.1.0
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dominate/python-dominate.hash | 4 ++--
 package/python-dominate/python-dominate.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dominate/python-dominate.hash b/package/python-dominate/python-dominate.hash
index 26840e5f0c..5a69431728 100644
--- a/package/python-dominate/python-dominate.hash
+++ b/package/python-dominate/python-dominate.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dominate/json
-md5  4dc4bbb39297999624e2312b6fe2b46f  dominate-2.9.1.tar.gz
-sha256  558284687d9b8aae1904e3d6051ad132dd4a8c0cf551b37ea4e7e42a31d19dc4  dominate-2.9.1.tar.gz
+md5  cae3b6ab495fa4cede991a2eaac7e7d2  dominate-3.1.0.tar.gz
+sha256  926989c819db2fe91e590590a2902183685edd94829c8cfba5fd71af57c1a982  dominate-3.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  LICENSE.txt
diff --git a/package/python-dominate/python-dominate.mk b/package/python-dominate/python-dominate.mk
index d6301af9db..5766d93d34 100644
--- a/package/python-dominate/python-dominate.mk
+++ b/package/python-dominate/python-dominate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOMINATE_VERSION = 2.9.1
+PYTHON_DOMINATE_VERSION = 3.1.0
 PYTHON_DOMINATE_SOURCE = dominate-$(PYTHON_DOMINATE_VERSION).tar.gz
-PYTHON_DOMINATE_SITE = https://files.pythonhosted.org/packages/fb/f3/1c8088ff19a0fcd9c3234802a0ee47006ea64bd8852f1019194f0e3583ff
+PYTHON_DOMINATE_SITE = https://files.pythonhosted.org/packages/4b/d4/35f08b4f459a44fff3295a70a46d6f8847b77945f059b0fac8d082efd9a9
 PYTHON_DOMINATE_SETUP_TYPE = setuptools
 PYTHON_DOMINATE_LICENSE = LGPL-3.0+
 PYTHON_DOMINATE_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
