Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13011606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 08:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NeGEC624
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF75260841;
	Tue, 20 Oct 2026 08:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uNHiSe98wbtK; Tue, 20 Oct 2026 08:08:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DE2386085D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792483733;
	b=Q1LPH2MQL5SWMzngC/0MSWZeI3AY98a1btMSptDfqYbbBwtiUhQcp/5i9vWhgK3dbfWr
	 rCVrX4chagw4+2RlkibmX4k1xw/dHS0fikmw9q5UWvOMu6A7SYt+pRjRa5jZfe8JITDiR
	 2Gj1mviifl/e+s74QEY1/AK+/n/MQlmQqY+slCW8qKWnyZ6XvcAIq7Rm+RWy7h6zDkr8T
	 MXkYKQw7pKMBguqhYrfbDeBKRTve6nvhjObrGQ+u88Hq6GP+paxp6xRiOXTJO9pAZqix0
	 pnabVXwpEBY+eUb2AKOAg7hejtEXGV+50/K6+txWN6zbLMQDaIYlORu1AUXOCLOLHVw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792483733;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:MIME-Version:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=OIUgoRNahIQT4fYkEp3SAA8RasfAp0gpTZ5P2UOhS5E=;
	b=gmlgAQ9UnUIqPoAB2Tx+RuNw5ZonKRHy1K5o2u5UCvM0omfKB63jH6Q4dAGH+and9Wa0
	 XjEqlmi29hmL6LnCswJIwSXglFE+2gi6h/LmLZ0JD/nZ1Ghtgm34T3xx8hxoqQHfugI+u
	 oW4bEUdob9YFaiIEzvEWBGrfAsh7HgJPzZZyPywR1upuc95Iah96ivP4HEesYGgmQPHHT
	 FmxVp1RDnP0R2Pj4IOi2hUPagPCJS5Q85nsTQXyzTfmYfHFMqgzVQgMj9+B8M8ynmrLvD
	 KKx/H6ySS03RFSlFvSQPj467CdTBLtVqR1wd/eLeNo55ktfZl5mnbeOZyHP30vr2SCw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792483733;
	bh=OIUgoRNahIQT4fYkEp3SAA8RasfAp0gpTZ5P2UOhS5E=;
	h=Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NeGEC624i6+PdeaI6oy3yAktNZu+S0Gb8VQWuAody9DvVnnX7kbehNY2wKR5tj4dz
	 yBRFbfV6pX5P1eiU+JOlT0LCyr7MI4T1+6Z5ibJUkAvR5Jw1vo0l8Y27TcXp1HNfQX
	 jpApeIG1aXRybW8dLwFpgc77IytNYQSw40MEsaRdghC7fKSfsfU/wMT4+Tl1SQjKS+
	 cPWa9kkEaAgUboEIdo0l5ZXABFcmSU9fBNVDYjJ2A+mohFY2GMVEs1QpcDG08/YOP+
	 JvQ4lVzgPyj8FCAdSPIcNUM+uZK5OsclooDn3Mp/P5TCf1RrOoa8riQ3+pg2yjjsWT
	 PscSqsb56fC/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE2386085D;
	Tue, 20 Oct 2026 08:08:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 37D7023A
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 08:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26C2E40417
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 08:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VXNpgnqJrn2a for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 08:08:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F086E40422
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792483728;
 b=kqVYrlhyEPwPgPQFSjKngkCjUveh4M6qkW+mRUcuHt+O8pYy4AVhcI1J9syaXlwyMUK4
 rNT75p3o4C6kG3A7sV4fuzLOXAn2f2ap9+do/aPKQhC2/nKPRcsWLkZgOvZiWg1/HlYzO
 F+aejK15y9/cX+nfrAj9+jbzIE+EhIJeKvXR7MQyXfgCAtWo69vLoDViRH76VHDpEnj1x
 R/FdxUc4atYCMyJ4JHtWcalpaPzP/3hbaXebIGka6db2otWavv2A5USViW8BkjquAwO1Q
 /9SaZwPCO5dKHv6nSaCxlZQCBmS710njoyIvYR/XpsJcBjU4r354SSC1iJZKWP0BjuA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792483728;
 h=Received-SPF:Received:DKIM-Signature:Received:Received:
 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Message-Id:References:
 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
 X-Proofpoint-Spam-Details;
 bh=lp1lWUVsOJZcXFqe9PG2nO01rxL6mbG4xOGcpCYULco=;
 b=cyvxQnK/gfUHsub75BeEEwRNHguZ49rdmSu308kJhwQzDj0Lz8tQSuK6WXUTy/8ITv3a
 dLgmCKlKX88khkf+4Rm02KHfI5Q+jGqtJjfj8oEom3ieavu+JmIsDs9QMpFPKAlNSyJe0
 tMCy3Q6VURGY5vgqm9XtFzRjl8DRJHwtZR2VOmYkjw3gNV6oQ2foSoUzn2YPZER82t2CE
 fCMfEJibjLbsgYlrSuOfZaRBx79srQcDoyXIifc04x1/nLm7uPSUAU/e2G8Ub0QIcH5ea
 ZS6zTXI5sLtup+L/NBZ7bms+vfOtwgMFcHhROL22zgUg1Xkgrt5zc+fTxcrnnWMLfWA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=oss.qualcomm.com;
 dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=eWffmycP; 
 dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com
 header.a=rsa-sha256 header.s=google header.b=M2dCdZ2+; 
 arc=none smtp.remote-ip=205.220.180.131
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.180.131;
 helo=mx0b-0031df01.pphosted.com; envelope-from=igor.opaniuk@oss.qualcomm.com;
 receiver=<UNKNOWN> 
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F086E40422
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 08:08:47 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69K6FruH825621
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 08:08:46 GMT
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1jkp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 08:08:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93cbf2fd504so508891485a.2
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 01:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792483726; x=1793088526;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=lp1lWUVsOJZcXFqe9PG2nO01rxL6mbG4xOGcpCYULco=;
 b=2f/wchwlDrRz/ijYuHE+X+ZoL5sxUlKEuSvNakrjWzztLhrONp+k3QQASY0mdZMYfE
 0mNEjsRq3c4IoWFm/DBae0/aDh02C69v+unS5ROxU5AdEG623NRsT1wvjSO51vbj5rWO
 fTSznv/KhZycsrkHrGeoAF2Yk+lGN/5fcRcGDGqLWPZTMM+hLImoKTmHxoEjBMUiXfDO
 eiYKKVZNKHVNWKJHueRTox8+eI/xZQSKyEIU2Ni6Yit1/oz4AY7ovld5khaihl/s+cTW
 OfXzciNglDJiz+JOVG9VApWmEekyrc6jY6aZnLj2B6ILhKW05du6RG3oZAer/JK/ZWw4
 iuJA==
X-Gm-Message-State: AFq9FYIrwxO0gznUCofWoz3AtgmTCuzz2jERVnC3e7bi2Z/ThusBXbnN
 xFnWB8GEFK46awToP9NFe8jBiSJMj4tOqw3oFSP628xdGidWax62wN53H2M+FCTn+VJ4NC8fDMg
 bpQKgR1F4T0lT+dSCf8ITSYjzIkRwHjQ5YUCeCNS42pCGu5Z9fPoMDg88lmPH
X-Gm-Gg: AYBFou0EyaeLNGjdjynC+iqWhLKWFLHNXvx+bRuvzOLVmV+LYP9d0gwrefAbatAXZEC
 MzGstWYNrDtinoCbjWUnjhxkYajqx3/7OfKYwUTAZ2yOTf+IQVuA64MkUpd20OjfIncC5D3aJ0s
 HO79hnNbI70n6rv1XY4PPKg7sNAwiMjvZ01/mogNYR11JAuHbQt/DbwH+WDE1HxbZY7V4BbUpY9
 8XyHECJAY+UPO+ozbF8FLE409ypKBk74l9ImIIQYfRihVWqnTnarwsIbjcZ7c607X1V9u2UXrHU
 tc3KrjeINigonvSYE+9k6UwL2tGjxGShPy0Ig5EMUF6xMTRyVnYiPKJF5nZ1tewMhgmSsehxSIy
 uRCCHrUqqD1D1VRWelztuZyquPTlG2KY55cRxq7iRHDPR
X-Received: by 2002:a05:620a:d89:b0:939:6dea:4f1b with SMTP id
 af79cd13be357-93f29d4dfd8mr1679572985a.49.1792483725648; 
 Tue, 20 Oct 2026 01:08:45 -0700 (PDT)
X-Received: by 2002:a05:620a:d89:b0:939:6dea:4f1b with SMTP id
 af79cd13be357-93f29d4dfd8mr1679555285a.49.1792483721387; 
 Tue, 20 Oct 2026 01:08:41 -0700 (PDT)
Received: from [127.0.1.1] (185-164-141-21.cgnat.inetia.pl. [185.164.141.21])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b38a1e70c1sm4836466a12.30.2026.10.20.01.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 01:08:40 -0700 (PDT)
Date: Tue, 20 Oct 2026 10:07:47 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261020-qcom-modem-userspace-v1-3-da720723d9ef@oss.qualcomm.com>
References: <20261020-qcom-modem-userspace-v1-0-da720723d9ef@oss.qualcomm.com>
In-Reply-To: <20261020-qcom-modem-userspace-v1-0-da720723d9ef@oss.qualcomm.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: t-dZWeO1jW0V4-xNwijyBr6C3A8CWTsC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfX928UKlbga97/
 04qJ11FmK0KonGL2M0kDJuNVUvlghgavetM3upWKu+RJshmPfVua8qF327dve++KL2807QUm7fS
 PQhDpaNrYai4oDbP7JqEriga/xnuKCE=
X-Proofpoint-ORIG-GUID: t-dZWeO1jW0V4-xNwijyBr6C3A8CWTsC
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad7218e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=JsdSkJyxCPcZmfxNhm0PvA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=C86j9RQZyJioSy64fLcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfX8O4mcVujAepL
 wSvq53OANqTGxQkWvhKaTgv2cUjKO+J19ub7erNckS2N5xftOWX5Qinxg1wZHMC2yofyN7L4kzW
 JmmrOoCU1M9qfqY3ziQpblH97v5H3ZMcBwvROeq3PHfPJqX2ht2tVI0qB1KS3Oc8q3ABsoCVnVo
 p4odnbGO4GmC6J+/z8UQI97qtTlXWsFgznSZndXxitARy1SWZ6phKSRFcgX69C47eWOmR/V+mV2
 KkguMBq0WFWv2xZA3J4ODPix2Oby/q5485B88ZNE0N1GGNpbEdyXrd7HacIMijR0Ty+RVc0uUxU
 ta0GbBwdugHysrbMl0GYK3B7ZXuEe/2ZyRbVjnbKY1tg56wzqQdHbaXZlIIsROVqcDhuq7Fc+qA
 3XCjO4c302cz80fO93DPvuKWHaN+qk/nCQTVxm85M8yQYBU5smwdeaq0YggQ0QCx9KYaWeHosa0
 kP9vJPhl4mTWb6e7BdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200032
Subject: [Buildroot] [PATCH 3/3] package/tqftpserv: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Igor Opaniuk via buildroot <buildroot@buildroot.org>
Reply-To: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

tqftpserv is a TFTP server over QRTR: the modem of Qualcomm SoCs fetches
files from Linux through it, e.g. the WLAN firmware (wlanmdsp.mbn) on
SoCs whose WLAN firmware runs on the modem. Files are looked up next to
the remoteproc firmware under /lib/firmware; xz and zstd compressed
files are handled when those libraries are enabled.

The systemd units are installed only with systemd as init; a sysv init
script is provided otherwise.

The patch defines _GNU_SOURCE in translate.c, which calls asprintf():
uClibc-ng declares it only then, so the build failed there (test-pkg,
bootlin-armv5-uclibc). Submitted upstream as well.

Tested on an Arduino UNO Q (Qualcomm QRB2210): the modem fetches
wlanmdsp.mbn through it and the ath10k WLAN interface comes up.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...translate-define-_GNU_SOURCE-for-asprintf.patch | 36 +++++++++++++++
 package/tqftpserv/Config.in                        | 14 ++++++
 package/tqftpserv/S44tqftpserv                     | 51 ++++++++++++++++++++++
 package/tqftpserv/tqftpserv.hash                   |  3 ++
 package/tqftpserv/tqftpserv.mk                     | 32 ++++++++++++++
 7 files changed, 138 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index dc0c8f35eb..2d3e525f20 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1497,6 +1497,7 @@ F:	toolchain/toolchain-bare-metal-buildroot/
 N:	Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
 F:	package/qrtr/
 F:	package/rmtfs/
+F:	package/tqftpserv/
 
 N:	Ilias Apalodimas <apalos@gmail.com>
 F:	package/keepalived/
diff --git a/package/Config.in b/package/Config.in
index eb8cf851df..4b90333bf7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -638,6 +638,7 @@ endmenu
 	source "package/ti-uim/Config.in"
 	source "package/ti-utils/Config.in"
 	source "package/tio/Config.in"
+	source "package/tqftpserv/Config.in"
 	source "package/triggerhappy/Config.in"
 	source "package/uboot-bootcount/Config.in"
 	source "package/uboot-tools/Config.in"
diff --git a/package/tqftpserv/0001-translate-define-_GNU_SOURCE-for-asprintf.patch b/package/tqftpserv/0001-translate-define-_GNU_SOURCE-for-asprintf.patch
new file mode 100644
index 0000000000..06829ed9be
--- /dev/null
+++ b/package/tqftpserv/0001-translate-define-_GNU_SOURCE-for-asprintf.patch
@@ -0,0 +1,36 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
+Date: Mon, 19 Oct 2026 22:02:59 +0200
+Subject: [PATCH] translate: define _GNU_SOURCE for asprintf()
+
+asprintf() is a GNU extension. glibc and musl declare it in their
+default mode, uClibc-ng only with _GNU_SOURCE, so with uClibc-ng
+translate.c fails to build (an error with GCC 14 and later):
+
+  translate.c:298:15: error: implicit declaration of function 'asprintf'
+
+Define _GNU_SOURCE before the includes, as xz-decompress.c and
+zstd-decompress.c already do.
+
+Assisted-by: Claude:claude-opus-5-5
+Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
+Upstream: https://github.com/linux-msm/tqftpserv/pull/56
+---
+ translate.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/translate.c b/translate.c
+index 246b82d..19fdd48 100644
+--- a/translate.c
++++ b/translate.c
+@@ -2,6 +2,7 @@
+ /*
+  * Copyright (c) 2019, Linaro Ltd.
+  */
++#define _GNU_SOURCE /* asprintf() */
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include <dirent.h>
+-- 
+2.53.0
+
diff --git a/package/tqftpserv/Config.in b/package/tqftpserv/Config.in
new file mode 100644
index 0000000000..e1acb03225
--- /dev/null
+++ b/package/tqftpserv/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_TQFTPSERV
+	bool "tqftpserv"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15 # qrtr
+	select BR2_PACKAGE_QRTR
+	help
+	  TFTP server over QRTR for the remote processors of Qualcomm
+	  SoCs: hands the modem the files it asks for, e.g. the WLAN
+	  firmware, from /lib/firmware. Serves xz or zstd compressed
+	  files when xz or zstd is enabled.
+
+	  https://github.com/linux-msm/tqftpserv
+
+comment "tqftpserv needs a toolchain w/ headers >= 4.15"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
diff --git a/package/tqftpserv/S44tqftpserv b/package/tqftpserv/S44tqftpserv
new file mode 100644
index 0000000000..c719cadd49
--- /dev/null
+++ b/package/tqftpserv/S44tqftpserv
@@ -0,0 +1,51 @@
+#!/bin/sh
+
+DAEMON="tqftpserv"
+PIDFILE="/var/run/$DAEMON.pid"
+TQFTPSERV_ARGS=""
+
+# shellcheck disable=SC1090
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -b -m -p "$PIDFILE" -x "/usr/bin/$DAEMON" \
+		-- $TQFTPSERV_ARGS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -K -q -p "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		rm -f "$PIDFILE"
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+case "$1" in
+start|stop|restart)
+	"$1";;
+reload)
+	restart;;
+*)
+	echo "Usage: $0 {start|stop|restart|reload}"
+	exit 1
+esac
diff --git a/package/tqftpserv/tqftpserv.hash b/package/tqftpserv/tqftpserv.hash
new file mode 100644
index 0000000000..d7660df608
--- /dev/null
+++ b/package/tqftpserv/tqftpserv.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  87a3845e8f47b42f31d8aaad04c5e0707e391b3954d096aeff6f0a03467dc33f  tqftpserv-1.3.tar.gz
+sha256  a6d7cc7891d16f9c74c9a9c2514805e59bb8758db7690bb7ae065c79cec9515a  LICENSE
diff --git a/package/tqftpserv/tqftpserv.mk b/package/tqftpserv/tqftpserv.mk
new file mode 100644
index 0000000000..a8a6220bb0
--- /dev/null
+++ b/package/tqftpserv/tqftpserv.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# tqftpserv
+#
+################################################################################
+
+TQFTPSERV_VERSION = 1.3
+TQFTPSERV_SITE = $(call github,linux-msm,tqftpserv,v$(TQFTPSERV_VERSION))
+TQFTPSERV_LICENSE = BSD-3-Clause
+TQFTPSERV_LICENSE_FILES = LICENSE
+TQFTPSERV_DEPENDENCIES = qrtr
+
+ifeq ($(BR2_PACKAGE_XZ),y)
+TQFTPSERV_DEPENDENCIES += xz
+endif
+
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+TQFTPSERV_DEPENDENCIES += zstd
+endif
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+TQFTPSERV_CONF_OPTS += -Dsystemd-unit-prefix=/usr/lib/systemd/system
+else
+TQFTPSERV_CONF_OPTS += -Dsystemd-unit-prefix=
+endif
+
+define TQFTPSERV_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 $(TQFTPSERV_PKGDIR)/S44tqftpserv \
+		$(TARGET_DIR)/etc/init.d/S44tqftpserv
+endef
+
+$(eval $(meson-package))

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
