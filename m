Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388FB606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 08:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IGDbuBo8
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09FED60871;
	Tue, 20 Oct 2026 08:08:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id upPMLc67OmsE; Tue, 20 Oct 2026 08:08:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 40FF66086A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792483731;
	b=LFF43u0Pj+irSOXz7xbNXQ+QlLHpW04SM8TjD/H4+fDb2f1iMAZVGO23my///iDbNBwb
	 HIF6byB+n3O9R+nSg5jc2VECl85cO/D9XxlWaapUt0xBtV0ov9Uk+UMaao0BcEDOej/+x
	 Bl7G/TRZfRBUV8sYVE7dj2/c0KY17KV6coPvUNJdJMMgxS12lny3/ysHvQQSFh5+5qnFe
	 yu98ec3S7hUZZOyvwxCRuGUF120Gi1w0htZ04aF13ggDyWUWUd4Ri7A2/7gtu32f6v9rs
	 D0xhi9PlKMvJvRG/I9tTJmrHguxTjAvQ8cOlfeYgA1AoBM2iEQFUmMnuAtW0gNEHiMg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792483731;
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
	bh=W35QpVrMOpLgRNk2D99vFvbZo9lOm3ErNhxkzftyyUA=;
	b=WqdFg38mB+JGUoVHJRES3jKn3Jvak2LYC7ci3ayShlpSs3nbBBTFCZsc2xQFHYMDOxNb
	 EBpflEMBviC8XQnQXkjP/5TMo4hEUtjEx1YF52Y+Dk9kK1Lx4zpLxeDwtNlOWKTcil/59
	 hTeygEIbqRe/l6rPxh5K2m1dP9UKkp4yirNcHaj12hPng6MTLJmG4JfgVuBYRr/l2QGlw
	 xpat0Ce8hRaBpf6mcYf/tURBY2r2b2CI1PDOZCq9+4bdPyb2/T6xcJ9FHRCLpuXRRQYUX
	 b74KtpbFTMKM5WGvb/KHdadTYHHPfvW6FuTLuK3mj5L4YXpNx8zbyugqEVljZnbu6JA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792483731;
	bh=W35QpVrMOpLgRNk2D99vFvbZo9lOm3ErNhxkzftyyUA=;
	h=Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IGDbuBo8erfE8ANLJnByBxAR1oaC+hK1vt6W34Y0GrPxzz/ABs9rgBAcpbwPKuTNM
	 SKDjEoxt5mAtT1QK0X+2pkcsKXsneysgccnCDFpLQ1WSAEYwHXMe8wOQjTrYGDy13K
	 akJT/R9KN3w0iVHdWyVQo/sYSKafa6mZ268AmTuzjm1ZYMSZRH+VeRYOzfVnP1T2iB
	 GiGsliGjSDVdgcFKEKgCaKhDyHWVEXgasXWnnij2Y2Nlflq80XaAgJSdPEnT6EiC5O
	 BIe3gA6kTf6oTCfDQZtee94/e30psNIcrkGChgKTcK3n2fkJT8EneajRjIAVi2YOO1
	 mOlKtRPyvKpOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40FF66086A;
	Tue, 20 Oct 2026 08:08:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E9B023A
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 08:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D710404E8
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 08:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id APEElY5cmdK0 for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 08:08:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D6A9640417
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792483728;
 b=TV4rO0JzAYGmXtcQXx6uOaKT0LuVp8ni/YltSKP76rOAGtlgKj5/n52FCuws991pZVAS
 0I8QO3iPJ4iy46wYr227RNQ7i+GH68vNge/iSykYeOs2LJL08CalAz8w0WUzwDQVoGdLr
 XYeg5VFqSxAg24awLw7NmJUGBCsIryGBmT9UIRL5GihApQoZII48ayhgtAQPR++ysQRVC
 +3z60WrMbbukrenKwDv1J4+tddxmOnTVq2M4pp0u0dsUUE5SEITq6D7rySLHjAoLcFHMH
 lIkv0sUTvfrs5/0cRdTEv3huQRja0g+4/SxZwLCt6J9jUyAro11wnKO99xCVjkpRRBQ==
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
 bh=xGmMqd/IS6iOtziM6g/F8V2IDVCL/4dzJOl18d99Ig4=;
 b=iXK4Lc/QlPSQ6rn3+T+YhSib1biY6V0I023yTv8QAPyYyL6PRdsq3GW5HIgKlUF5aXHk
 H+rCwcIGLOJK6iPQtCquCYtAVywcSp/S91zNVGBi04iidXkkOpHw5dFOCiEPaZzVAhBfa
 pViaO82Ua6QovEgr/ir0xY6KbdU0DDrBKSRwGFsJAeDoL9yRizPe0n+2vwQRH+JWLv0/t
 ACNz9dP0Qy6G7ClRINOannsN41VKU02rV3sHUWmzscMW7f/UaQVEG8dEnk89f/nFdpD06
 Zl9wZi7kzs+bkrcgmzmHroVUCg5+hybfBHPSR2Ey09pucUxd46fUHwLwac8q8fNzLXw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=oss.qualcomm.com;
 dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=OkvNalx1; 
 dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com
 header.a=rsa-sha256 header.s=google header.b=R575NnRh; 
 arc=none smtp.remote-ip=205.220.180.131
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.180.131;
 helo=mx0b-0031df01.pphosted.com; envelope-from=igor.opaniuk@oss.qualcomm.com;
 receiver=<UNKNOWN> 
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6A9640417
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 08:08:47 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69K7p8jX1035780
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 08:08:46 GMT
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1jkm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 08:08:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93909014c85so660847385a.0
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 01:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792483725; x=1793088525;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xGmMqd/IS6iOtziM6g/F8V2IDVCL/4dzJOl18d99Ig4=;
 b=2zfyoV1JIIJNYb9d9+4Mig1FnGWnY/8/GjGPLyibNqPtOjuNaQmPl+kiIG9JjQXbCg
 4lxgPb6G+KuoV3pEdWV/lFTQLceYkI5pTm1jvhPqXSALWbnNj0pVPz8x3DoAOsD3UXXb
 CHjGdvOiI0pYGjJvLw6roGBDH2ggU13UK64yyDh4yqH4S76gR3ni8cPAWU9asFOwjFt0
 CzR1ksWd9hR5Z6FAzooyNHpfmOVEF+Ab873dmkvPd4Uh7KaaidLmFQvb8O2LOulcKoOa
 oZD+mNrpxxaHHb/haPfz9bRx0XhmyCb7Do7KA8g/HLlGas5Zpr2AUibqlOYsH5DSpuJH
 iQGg==
X-Gm-Message-State: AFq9FYJp67YU2YPUJdOGSQv+JNv6gJ2lfcJEbPZ/e2sAoxDgTnSjqjGL
 dTA/dElONSI62QOQar8gk5Ol2Q6PX59KlvIQn8QceLKIZCpWuZrlplDz88NnG2PIzbe0WTGwkNk
 WoxqjnFfy1rOtVDA0UHgiRqP5P5Ro49ApcAsvXXxfK7rKMsuMJcDUe8flfGdV
X-Gm-Gg: AYBFou0vYWos3NnG0coOymEtBGPC032MbyPnMGXL1Ld55CNcH0wmkSy76bnILn3VRqt
 UVzHzNM3wW6cMByKw962POlEEA05uoIy9+4ElA+gRT3KaXc5sdmygtIFeBmA7VICi+yBiA1moY3
 H0yF5WmYRPMScWcMdO6sVkQDS+HlrumJG481DYkLRfs38Mtd0AhpaxE3Gi3NgRRdYF55B0cjbmB
 OCEPsF1jfUTwIC7+bJvrG1zI8BxBaEIY20gf97PNcNRA3M94GYHPsTXX+bpMjnyweA3E8Qib73x
 v7F2rJwildJGuIxGY7SuT0H6UtRsKkip1f7v6CdqvoVNnEIJA+bhrVDMoNPsCKMQxNopYOjxF00
 JZHux8IGHHJblc048GUZPIGNeX9CcvmJQp39PG5Y3gbwB
X-Received: by 2002:a05:620a:4416:b0:93e:f0b9:505a with SMTP id
 af79cd13be357-93f29d3d885mr1554037585a.58.1792483720543; 
 Tue, 20 Oct 2026 01:08:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4416:b0:93e:f0b9:505a with SMTP id
 af79cd13be357-93f29d3d885mr1554034985a.58.1792483719967; 
 Tue, 20 Oct 2026 01:08:39 -0700 (PDT)
Received: from [127.0.1.1] (185-164-141-21.cgnat.inetia.pl. [185.164.141.21])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b38a1e70c1sm4836466a12.30.2026.10.20.01.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 01:08:39 -0700 (PDT)
Date: Tue, 20 Oct 2026 10:07:46 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261020-qcom-modem-userspace-v1-2-da720723d9ef@oss.qualcomm.com>
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
X-Proofpoint-GUID: 2oXiGuvbafWYm9xHXrTqhDNjfoytyEbr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfX1nM5ESCIinkD
 UcBO0Hw0hCwPEfcJhrNjLzN2chqOb7/tB0LydrO9oyKrCgTna11BAQ6RmkYUbYBxze9C4l33scX
 Jwaknw+7cJ4hx8cRqZSkuRul6UHvmB4=
X-Proofpoint-ORIG-GUID: 2oXiGuvbafWYm9xHXrTqhDNjfoytyEbr
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad7218e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=JsdSkJyxCPcZmfxNhm0PvA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=C86j9RQZyJioSy64fLcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfX1RM/YGY4m/1T
 nCrQ3PWfCn3j9CDUowxs88TNPwnDInC8RkBl/BnCUET6FYsDYlexhlp5Zogl2DQ3EpmjOIyIGVb
 AF1Psd05V4ZYrbvgZOR9/Bpw/cMGPRoC3xJWsupPFtlZOBKrpdncP5GjtT0okvzbf6lgFqqvw8B
 bbf/rIIEOhGxvYf79nO9A6wNdsrOUNO/iqT8l6XCtbeOHrfZAuDMvzSF7jMRwoftXEKcTvTuk6e
 3l2ltQpxxUVOO8WUqJ5hwBD9LixP4DN3El3m9Bg52KZ8vTBjR7oRaEmG/J7iXkY45KyQrSAosNj
 045f3ulhyrG9vwIBiLM3+fftw/mz4Us2eNhr3Qso2kCYkfEUDJEjmekGFO/3QIf5Pz8bgrW/N4E
 wyixAbcVXkq+l5tre1sg/aEosUpBuS7XXiSkFZm3ZTd7uapiIm6KwCkGJsm105suLKb1QPvEaxZ
 8ufRnxZQcfT/V4QIjSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200032
Subject: [Buildroot] [PATCH 2/3] package/rmtfs: new package
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

rmtfs serves the EFS partitions of the modem of Qualcomm SoCs (modemst1,
modemst2, fsg, fsc) over QRTR and the rmtfs shared memory; without it
the modem firmware stalls during its boot.

The tarball ships the QMI encoders pre-generated, so the qmic code
generator is not needed; the .c/.h files are touched before the build
so make does not try to regenerate them. The sysv init script starts
the daemon with -P (EFS partitions by GPT label) and skips when there is
no rmtfs shared memory; RMTFS_ARGS can be overridden in
/etc/default/rmtfs (e.g. -s to let rmtfs start the modem). With systemd
the upstream unit and udev rule are installed.

Tested on an Arduino UNO Q (Qualcomm QRB2210): with sysv init the modem
boots, its EFS is served from the modemst1/modemst2/fsg partitions and
its WLAN firmware comes up.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/rmtfs/Config.in  | 17 ++++++++++++++
 package/rmtfs/S45rmtfs   | 58 ++++++++++++++++++++++++++++++++++++++++++++++++
 package/rmtfs/rmtfs.hash |  3 +++
 package/rmtfs/rmtfs.mk   | 45 +++++++++++++++++++++++++++++++++++++
 6 files changed, 125 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 56c919d00d..dc0c8f35eb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1496,6 +1496,7 @@ F:	toolchain/toolchain-bare-metal-buildroot/
 
 N:	Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
 F:	package/qrtr/
+F:	package/rmtfs/
 
 N:	Ilias Apalodimas <apalos@gmail.com>
 F:	package/keepalived/
diff --git a/package/Config.in b/package/Config.in
index 9416c35458..eb8cf851df 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -593,6 +593,7 @@ endmenu
 	source "package/raspi-gpio/Config.in"
 	source "package/rdma-core/Config.in"
 	source "package/read-edid/Config.in"
+	source "package/rmtfs/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rockchip-mali/Config.in"
 	source "package/rockchip-rkbin/Config.in"
diff --git a/package/rmtfs/Config.in b/package/rmtfs/Config.in
new file mode 100644
index 0000000000..9a27f9c373
--- /dev/null
+++ b/package/rmtfs/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_RMTFS
+	bool "rmtfs"
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15 # qrtr
+	select BR2_PACKAGE_QRTR
+	help
+	  Remote file system service for the modem of Qualcomm SoCs:
+	  serves the modem's EFS partitions (modemst1, modemst2, fsg,
+	  fsc) over QRTR and the rmtfs shared memory. Without it the
+	  modem firmware stalls at boot.
+
+	  https://github.com/linux-msm/rmtfs
+
+comment "rmtfs needs udev /dev management and a toolchain w/ threads, headers >= 4.15"
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
diff --git a/package/rmtfs/S45rmtfs b/package/rmtfs/S45rmtfs
new file mode 100644
index 0000000000..4e110c0ae2
--- /dev/null
+++ b/package/rmtfs/S45rmtfs
@@ -0,0 +1,58 @@
+#!/bin/sh
+
+DAEMON="rmtfs"
+PIDFILE="/var/run/$DAEMON.pid"
+# -P: find the EFS partitions by GPT label; add -s to let rmtfs also
+# start the modem remoteproc, -r for read-only EFS.
+RMTFS_ARGS="-P"
+
+# shellcheck disable=SC1090
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# No rmtfs shared memory: not a Qualcomm modem, nothing to serve
+	if [ ! -e /dev/qcom_rmtfs_mem1 ]; then
+		echo "SKIP"
+		return 0
+	fi
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -b -m -p "$PIDFILE" -x "/usr/bin/$DAEMON" \
+		-- $RMTFS_ARGS
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
diff --git a/package/rmtfs/rmtfs.hash b/package/rmtfs/rmtfs.hash
new file mode 100644
index 0000000000..680926947f
--- /dev/null
+++ b/package/rmtfs/rmtfs.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  4b6c398806a1046e2256a685d592833de0f37b7245b8adc4797e1791f0e117ee  rmtfs-1.3.tar.gz
+sha256  1e1e2972bd05841b6a009bd6f7aef9d847f9a2b721d1a308340e642faa2482cd  LICENSE
diff --git a/package/rmtfs/rmtfs.mk b/package/rmtfs/rmtfs.mk
new file mode 100644
index 0000000000..3fd21063d1
--- /dev/null
+++ b/package/rmtfs/rmtfs.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# rmtfs
+#
+################################################################################
+
+RMTFS_VERSION = 1.3
+RMTFS_SITE = $(call github,linux-msm,rmtfs,v$(RMTFS_VERSION))
+RMTFS_LICENSE = BSD-3-Clause
+RMTFS_LICENSE_FILES = LICENSE
+RMTFS_DEPENDENCIES = qrtr udev
+
+# qmi_rmtfs.c/.h are shipped pre-generated: keep make from regenerating
+# them with qmic, which is not packaged, when the tarball timestamps make
+# qmi_rmtfs.qmi look newer.
+define RMTFS_TOUCH_GENERATED
+	touch $(@D)/qmi_rmtfs.c $(@D)/qmi_rmtfs.h
+endef
+RMTFS_PRE_BUILD_HOOKS += RMTFS_TOUCH_GENERATED
+
+# The Makefile appends the libraries to LDFLAGS, which a command-line
+# LDFLAGS would override.
+define RMTFS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		LDFLAGS="$(TARGET_LDFLAGS) -lqrtr -ludev -lpthread" \
+		-C $(@D) rmtfs rmtfs.service prefix=/usr
+endef
+
+define RMTFS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/rmtfs $(TARGET_DIR)/usr/bin/rmtfs
+endef
+
+define RMTFS_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 $(RMTFS_PKGDIR)/S45rmtfs \
+		$(TARGET_DIR)/etc/init.d/S45rmtfs
+endef
+
+define RMTFS_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/rmtfs.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/rmtfs.service
+	$(INSTALL) -D -m 0644 $(@D)/rmtfs.rules \
+		$(TARGET_DIR)/usr/lib/udev/rules.d/rmtfs.rules
+endef
+
+$(eval $(generic-package))

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
