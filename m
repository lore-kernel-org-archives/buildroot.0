Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652DC606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 20:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ECK06SJ6;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YxppPanC
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D86C606BB;
	Sat, 31 Oct 2026 20:19:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vfZHjwSjJu5D; Sat, 31 Oct 2026 20:19:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4915960677
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793477978;
	b=mp7ktepDsEUEdKt70xDOoptIG/8mdAiz0gMxTR+JaFvXZ+cGjq4gx9QosVdDrwP8LIeo
	 AhVUxpdEkQOvLLPQmZDmBJRYqcSsRiqX38d+rPCb9JNLLv8pV0VpF+eiEeaQYf4YkqMXy
	 yZQP4TfCtoGmSW96bz3EbKcuGa0vc5Iwa3A/b7boz04+//ZJ/8b37VA1B/FlYBaIfomvR
	 mklEgfs1PxSHguSO+y4OI7kx+FNRfTkVHX92uOpy3BFIwALiiErrL4amFFZU06e1qW1qU
	 sn05qw9VFiyca1c4zIE6j+hpB2f+txFIWIHPoUwqtmuyIGEvkegkhEdAXqJ3Ps69dtA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793477978;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3celBoaIQ6Fs1tMKcE50DOAXX3j0TGJaoE7kzo6jMlU=;
	b=sJds0dldMUxXRDuwxEgLB+iksDgP0ZUUVNJGqyS+Izk4WueDUQ0mcF/zTwsQ+H0mD+tX
	 1lVfGRMrvtM637pr8jg3AoeLMFqrlpJ93W7KG+CPWQWSEB594peiKXy95u8rMRH4CudOe
	 azVHTw00iNTLzwRNfCSI2cLYDeoB+NCKkUTlncrfNiuYZcpfqn5dlT086fxHWMEBMIFsn
	 R9VRIg2ImNtZNGKcuacUP1GFQ9k0YPDlpGuHkcG+4dJ8L3FpS2jhe7iL6aBeS8HJ9nfRG
	 BuQD2kwzaBubp8Zdv5FCRH0OWtgdFi0YuEpnQL8PR+RAQU/ZOqIbbSiymnCmfsIoiSw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793477978;
	bh=3celBoaIQ6Fs1tMKcE50DOAXX3j0TGJaoE7kzo6jMlU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ECK06SJ6bYkZ/bBoFU0VDh7nfLszWX7jEBCC+DbRm1cgNkVJI0hezR6C/lIDMtJvL
	 uDe3ZDiTxfnnTs31zqdleBICg43oWMuucSTbRMjOdpF05RHHZRuS6DA4XBkMvu9gXs
	 kUjHRfYr3UojWZkN+ArqF66KuZb8JrBmE82h4HzV9Jgv8+O+ZheRWN/1tYAUm5pDki
	 a82A7W7Wo8+3bfN39wbecvfKt2FMXhzYi380CkmvikwfKkwZCy+JW4+Cu4LcgNPsyF
	 lQE4XQJ9dtOPHA21zcIycw+2X1j78nba0MNHgg+6TLAqWZ0O+LMymNa8XiQEucp8hr
	 Mfc5Ll0/OwuMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4915960677;
	Sat, 31 Oct 2026 20:19:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C6BF380
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 20:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8202D401EC
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 20:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ynlqgc7jQtge for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 20:19:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org ACF4640070
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c35"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793477972;
 b=JKQvmvPlgXeDGxBCw/HX/sEujMAS7ehE17dBifxFSiE9DdfKRhGFAlPw4GOjsg0EK0bJ
 I3unOIFIx2ZBD96d2HDPoncUah7Hxhq2uuiOmkD7BMrdOuU2ytvj8ctF0xVKu7JDsivyl
 RlV8qah63/L+yvddAZYCH6JbJBLCKI32H0MVyCSsGV3IzFm947NNv/1ojENsATJYXSJPa
 4ciRSEtPixlzLsPEVUw2ZXVwINBGgiQGIVn6AQ4yiLkw+1FJG3nrqAKnImT/q4R8g8yUt
 ZUMTaoeXqJwmA9r+aS/WQmYmRHaeoENOT48Lr54SpmYrYNk+dIAp1O23cIlIEFrPOYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793477972;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=fBJA0iSW03L9Kn4De5AzXGrYPijt5HvyqiHIGjpKPbo=;
 b=UFkUDv/yaXC9SWRCXRU/EzGQ0fyMjRA917Jd4EGh0uEK6L/y7VSaiI3EKZJJHocoGUwF
 o9Pe0mOSRg+763mo37VFcLf770GkTlbGiyq2TA2cBUMS13qFSKrKFzxoH025u9xVG7geY
 2bvCC59IDgYscIiQi3HozAd3DDS6DRNgT3RxT2DV3csw0SIjHdEHDoETbbVUTFbeSl3t/
 tqai7QDQDaR69JO/vhB4vnmEmPggl86Avxkrkq5UwnKqSzgUAWZwmCKLXWjipSJiFzHjg
 kcCVLdx+N3JoldUHBogOOIQ9OyfX0N6gkAxfGgH3oqge7WqJwhMCzC/EbY/h3CbLdVA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=YxppPanC; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c35"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=YxppPanC
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACF4640070
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 20:19:32 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-702fd86d674so1259122eaf.2
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 13:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793477971; x=1794082771; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=fBJA0iSW03L9Kn4De5AzXGrYPijt5HvyqiHIGjpKPbo=;
 b=YxppPanCym/n8kdJxd3goGgcCZFmKAMIsK9eOlwl20lsoZbADpEeUStQ0I1AyLsJsv
 LrvQt8ruzExVEDQFdmEcMh7UmqnHtkODeNIyNSxJ6I7drsCeMqe6cFW25fVc2WzF72LQ
 flptHuxmw/BTtP/roKbjnl4ZVdffklSfqLrYQ+Q7+PddTFM5iTYSrDNQqKeJCKwXL3Ss
 mLHwfB4fpVCx9bfVe7OnMwWeGY3PFYRRUDtY9fbziXxxpATvjdJKY2iXIm1HXlFyRpNq
 eFBwC69JS894OvWR82zEgOd9aViUFOYVqnFDGEu+TUz+CdaVonTFSsWgETWWybseBPWX
 7FUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793477971; x=1794082771;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fBJA0iSW03L9Kn4De5AzXGrYPijt5HvyqiHIGjpKPbo=;
 b=ms+LZOZSs5Fh/CLAnBSoAx2c0coA0ar4QdkLSq31e1/FZoibuySpSmGMQBFV5Nj+js
 VTmhjFoU3bReH/BBeQ9NgP3FvUBJXLMr6LZxvvhMH+IQrgk+QLO9X2VQ7IU+L012pRwV
 l63ZEP6/eFX8fe29sHIjK22222G6SGYlSjCUsztKMfBM1fAMQ5TAb1MmhBqYP/S3mKcS
 JylYN0B1zUsbAadzoZ9cynQeYgQwdwQATBJFWdLO6wWr8CFIkZ+hBaH3LDyurN6MfEBm
 a22ahVzqMhq1YwFvpN9sljDqrIA34jUkrZR/VpVUq2YCspvaG6ExJ4jCuZ7mqskJxI+F
 hrvw==
X-Gm-Message-State: AFq9FYIxjmZK0sR2uKQiRW8Z3tM6TMUKl6P4iGQqWFQF2kNzJ11dSsSV
 OK4CXoXiUiekgoxbWJgZMTMTRZRe6DfW50zHXpFuKpXrdyGBALQboFathyc/vw==
X-Gm-Gg: AYBFou0F5+QlucLzvoAN1zwQNf8EUc9vQ65WW+QDOaIfaU8PF0azzFDn5Z67fIxxVKQ
 1H7mika8hJdmVEhVTvanQwNY5H8SIR3aImxCIVNwz1N216aqMoYnnQZvynJZD++v9ix3yZdWRF0
 s84OUfNapiRUl+UPYN21y/3sorx70c401Nq1fr5Ey7NtecGnV9/q7A6BKUu8/OAlY6sr59OzVf3
 gEV4fpdNZxBJWqaZXiKm7xjP++fB5Z2VKAgj8vTcg4FiE7QnRE5iKL6S7hxnlhtRv0lrbJepkxM
 +c/7B54hzhkymcnSf0Y4s8nbEPHEL84gFCaBd1O4iIddvQvAkG0EvQ9IS0y4Morie4ELSDA9wta
 sYg1jT+1eaInuYSkY/bN0QAy4ocoDgnLDlma5sWrpk0ji35jY2Szdh3WYL7WKkmx/+NaTZnPvgX
 tHrQ6Fm/hrNCiEPRR3kAuOH5+ihDpN0B9vQ9XsaPeF5ynASJmF/cIww7hm7Gso47Q8Cs94Nz/GS
 +40XIj2ShIRqPhaAp3K+VzLkAkGiw5RjIYWogZrStlgaK7hbvYuHz9DVy4N5yyAQM5kikjOYKjf
 dPYK61VlbqTlvq5HGwnPoz4zXAte+p8ExL/sntVbsqPkgzXS4jZ8i4aUoM8yo3MCJKbA5a2GQnJ
 LRnE1TMrYph77s5VI0cEVORo/SP17PXgGsYcHQRF9hsjRdlHrrYHO2HgqT7BEG2e7Wo8SvNxDXI
 cfl/ng3au/br3xUKrOIDdhVQoul8Cc0cl3HMk6yj493zXubxqHQFfsqYrpo//NPV+wi2GTHi1xP
 w==
X-Received: by 2002:a05:6820:7084:10b0:708:d449:47ae with SMTP id
 006d021491bc7-714f255a64cmr2610476eaf.75.1793477971383; 
 Sat, 31 Oct 2026 13:19:31 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a9218e97b0sm2998133fac.4.2026.10.31.13.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 13:19:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 14:19:08 -0600
Message-ID: <20261031201918.2850153-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pylibftdi: bump to version 0.24.2
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
 Christian Kellermann <christian.kellermann@solectrix.de>
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
 package/python-pylibftdi/python-pylibftdi.hash | 4 ++--
 package/python-pylibftdi/python-pylibftdi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pylibftdi/python-pylibftdi.hash b/package/python-pylibftdi/python-pylibftdi.hash
index 10dea3f7dd..5b2104bf9c 100644
--- a/package/python-pylibftdi/python-pylibftdi.hash
+++ b/package/python-pylibftdi/python-pylibftdi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pylibftdi/json
-md5  6243ede1ed3c210846084d0c204f0a96  pylibftdi-0.24.0.tar.gz
-sha256  e2229bc10d077f018cbe7b2b490227b2b538643fa6f7bff132cde15549ca129b  pylibftdi-0.24.0.tar.gz
+md5  9ed7dcb7eb5b3f4136ef06cd6fa48cd1  pylibftdi-0.24.2.tar.gz
+sha256  c892e71178055490b90db488a0195cb5815b1554061c4f31f13c318806d532e0  pylibftdi-0.24.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a85d0bd07d1efe2c7b24be985d3d9bfd4e9492f5e003e366acd4f99fe95128f7  LICENSE.txt
diff --git a/package/python-pylibftdi/python-pylibftdi.mk b/package/python-pylibftdi/python-pylibftdi.mk
index 58c1c82c86..2e77069bd6 100644
--- a/package/python-pylibftdi/python-pylibftdi.mk
+++ b/package/python-pylibftdi/python-pylibftdi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYLIBFTDI_VERSION = 0.24.0
+PYTHON_PYLIBFTDI_VERSION = 0.24.2
 PYTHON_PYLIBFTDI_SOURCE = pylibftdi-$(PYTHON_PYLIBFTDI_VERSION).tar.gz
-PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/19/5f/f0e03128161fff27d4f92d57b7fab20fa64e9bcd53627442d2ef43b8882c
+PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/26/d9/23e892c9a1d08a0e01623164cb84ee6334aa1c33dafd0f4cecf763513a31
 PYTHON_PYLIBFTDI_LICENSE = MIT
 PYTHON_PYLIBFTDI_LICENSE_FILES = LICENSE.txt
 PYTHON_PYLIBFTDI_SETUP_TYPE = setuptools
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
