Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91D6606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 08:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sselFPvC
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89156607ED;
	Tue, 20 Oct 2026 08:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7S_ybvXw4E_7; Tue, 20 Oct 2026 08:08:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6DFBF607F6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792483728;
	b=iF07EFIf+TP44NVZCiWOs2jS6I3aZvTNBlFduRob7VQnKmi0IvhFczdELIXP74oX9O2j
	 mWDGXuyHWeCwak6656Uzu7Ig4hqlCzjzR7gn1SOhlGiRzScq+1KR+FWdeU4wCnbD2WWjA
	 5lKz5yuGKXd3fsYlTGT8Ih4ueUTrwgabbddzvhIzxIlz6kWjYLii1sVzTw/taqQE2j05e
	 CuWPbYMrnrlV3USE7NBV/6CJAYQEU4TlHXa/B3nAPBYGo4lFiSPzDWVY+5T/6SK7+2OeL
	 z7iEP/Ru+RwNxU97a6ENvwIxERRK7S64o27j4J8BBtM+yfdfB6+Szgn3tR9OiFWBWAQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792483728;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:MIME-Version:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=H0Kn4sD4jgFmWkVRAc5ti3V8CYJ9ioyqikqyFhHbu3s=;
	b=fXXjC5Htyv1Z3EogfjGWGuQ6OyBs58wUFkajXX1zkekN7pjemoSLEmZvhrYndwKPyDDZ
	 Iy3Snc3ZKAMaAAtks4ZvQOAtqz6hQmuWzD8B7xdQmXO8pnQALim+69pbKgTWaYrZT3mSo
	 Xkb/wMGBULy/6iAq8UlIdzD1OpZju1/ieEIiBhEy0cxQuFDC+mbJ4yFtUQN+FfIgLodRx
	 ju+qnrx/D/IdkKsgxUsELv1yNZOtQhav1Tf4juNtPBpxpE+/jXp+z/lDRir1t5BTuqkiR
	 W7LPESINoC3d6JYVQOpjO3Q4hmPdGWOCNO3NqesAlT9iA7XxZjy4f3TKRFv3+g4kXeA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792483728;
	bh=H0Kn4sD4jgFmWkVRAc5ti3V8CYJ9ioyqikqyFhHbu3s=;
	h=Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sselFPvC2nuvkTuKd0tGl0M028nFGxRIsB2GUAU6YEvOT3eOc1ToGfEaiNHs3Zgau
	 YmFJHSDUcMOXVvBbqYLQQCrExG1hGVWuXb6f7Mm7hHV8tlN2cKWrPcbgSRbctgVADt
	 7ZtUcLCAsI8Ph1rBHr3/h/WuzBns6Jh+W23dvTGdDCzu72iKjG+nK9Whit+h38k96J
	 KYLmiYrmoUaqVFCQu0Hx6XAQzn/BCNZN0mfLrvn0db8jPSA/Ba2mUBRjnZga4q8ThA
	 GKmGXr1eiJlQgW5swFoZrkVdOQ/uzggtqO1wVCseUSN/M0SqKLMNmc+GXuxG30Suqa
	 d1Hgr0FtYmm1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DFBF607F6;
	Tue, 20 Oct 2026 08:08:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3301123A
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 08:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21CA940312
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 08:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eohxclD-1Y5z for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 08:08:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 028FB4016F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792483726;
 b=daCzKAzUBAWUPhFtHJjpczvZlPcBWnq7ri6t/tBECwhUogNAt8CY1ZY/W52pM/QFOBa7
 2794xrGVvR+vemrWA1djZpnEET5BNdDJjxEOCKU1RFQegyf9kXluYt9YkuhZK4ArofcPQ
 a9BmSCLL6C6K3oSH2c3VkFmru5V9oPcgTaF6j2QnzFSuIDYKA2/vwf4tU+n9KxV43m3CX
 8nNlBUMt/IujDSfJb1MRIJP4rCgQPgwEq8D9aYqiCaZ7d+MlbaBJ++rDGvR+7mkn2ld0m
 iKfkzwmxYUHphoyhUFB6q+kRo0CWZs0eSTSIIHM0AJOz9PmLzHDAQ/rEpo303boOAzQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792483726;
 h=Received-SPF:Received:DKIM-Signature:Received:Received:
 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Message-Id:References:
 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
 X-Proofpoint-Spam-Details;
 bh=PfaZ8mEDn+wm+NFInru975zp2Wu5T8QMr6YxFm3ofqI=;
 b=gNqmU2/GkYgKvAS6Gka+1b0+Vr3o8oXITZYBj81Ml+msxR1nXz5DG3iF5Q8EUZXuEpPd
 IEjmMU+dQ37z8txs6JxpsMGsbViCHUWGclcb8leomG+K9Fp2qAV+Kpq2z7KEw2I2E4p47
 lwQg8GDG4HBouAcNAmpS1wDf3mB8IcTws4HlQai8ENN59gzeliXuDEPZN6g8Bj+mwwiE2
 STp29aPqVgR3uosENTLTWYMw54tZaLCopfx/XlmJjWfvitRblOU4L28PXf68+wArIAzEE
 y6LuptYQYO/vl81m27a28UnkT2K5bpuBsQ1Mr9mgQ+fQnLhXyAVOoU8V7rEetJBJ5uA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=oss.qualcomm.com;
 dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=CE9tGQex; 
 dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com
 header.a=rsa-sha256 header.s=google header.b="XF/gYUpd"; 
 arc=none smtp.remote-ip=205.220.180.131
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.180.131;
 helo=mx0b-0031df01.pphosted.com; envelope-from=igor.opaniuk@oss.qualcomm.com;
 receiver=<UNKNOWN> 
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 028FB4016F
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 08:08:45 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69K0tI403305769
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 08:08:44 GMT
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ssgmb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 08:08:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93f1e62510cso711424985a.1
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 01:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792483723; x=1793088523;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=PfaZ8mEDn+wm+NFInru975zp2Wu5T8QMr6YxFm3ofqI=;
 b=1JtfiAgnYvrzBwzpM33UdqcqLlTWGzLQV+fnChqPuUnFic/lXaSCt+ICzRyaj6mh+/
 EFfiY6zMZkYqftd9S5QrJizorGzdiVBFp4EJOZj87q08DzSQCXmvBvrZpwHDKAUrVQkR
 Ydo/EUv7GOidb+YyfYo9Z4MppqEVkDrdugtUc+NWvoLc2ZD7+BYd4jFgmJPZUPV3BrlF
 ik7GeDRb4X0j3QY91ZjoS8V5AGWimd++W6/SaIGAPLckN2ETd4lZaR8h/H0RlrKB/SFV
 QhJ1EJVxxHvDWTacwCOmPj/opasu08seeDlYNzA9kk2WTScQblUCsi8GB5AHJBfQpPv6
 pcqg==
X-Gm-Message-State: AFq9FYIcuPyQBvX9OgiObjB46/y79Z4HEnAOYkLZAhFeSv6FvBXgI2g/
 OTA4Hfusy18Xi4AUjUgIW9DdIGkToWOWZvSzcaHabu5p1TNaBXRh2k50tpf8iP62bRuwefxUzN6
 g2C9ihzF1UiyK1H9qJa85Ple3wc3ju/gigaSGKZABsucilDngQFmFeXe09925
X-Gm-Gg: AYBFou2YeCbImS219AwMwtcJq9QnDnMUecpe9h450yn0KjIH/Quovkw57JaXzagcwmJ
 oX97Lw7KG8WoOqVJvbNZiUajEAc5lvMDgjjmG5+Iq74qEW5n5Fc5fcw58Qkiv8XRR6fNqpFDEGy
 yZChflykTp5EOvjVE20iK8GcV+/N0GW1U5w3KcDn/nMw8N8iF3RRJyNZWsvIIZKVbEivBiGBm1F
 2ufOvAox3gzeciQIafWS3LltFgZeEfRHgDwc4UjfetKwKpUhWlHmof2EzavrYQAq5qULLaeto2R
 pehJBBot746nkBZH+FuUASNOxy+ScY0QXoVIv6cIDmcHO9akzUTEg47Of7qAEYE27lXz+bMqxFG
 dQwHP3iGjGOWaC3DVRfjqHeBipZ9S+3UlYr32bvqmKXYK
X-Received: by 2002:a05:620a:4505:b0:939:6c9a:8f8d with SMTP id
 af79cd13be357-93f29ceec9bmr1651739485a.28.1792483722959; 
 Tue, 20 Oct 2026 01:08:42 -0700 (PDT)
X-Received: by 2002:a05:620a:4505:b0:939:6c9a:8f8d with SMTP id
 af79cd13be357-93f29ceec9bmr1651717785a.28.1792483717688; 
 Tue, 20 Oct 2026 01:08:37 -0700 (PDT)
Received: from [127.0.1.1] (185-164-141-21.cgnat.inetia.pl. [185.164.141.21])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b38a1e70c1sm4836466a12.30.2026.10.20.01.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 01:08:36 -0700 (PDT)
Date: Tue, 20 Oct 2026 10:07:45 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261020-qcom-modem-userspace-v1-1-da720723d9ef@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfX40p+46w2Bc+u
 EbDeJSIgF5ZNFaAR2AJ8mlp1OfjvvlGjaytqbaPkuGTHE2HKyn8m6yi8dSgJsQgdFCD1uRewWiW
 VPEt0n15sv3MUXsdamC091sudH4RS8t6N47STOWu5ghzeZRbOFfmBW6AGxgAQb+ZM0Fr496BfCe
 aLyvZJDirVxBdSNqy330LEoiUC3zd4gfG+ZDHVI8ZGgKROcMkZRUoFzEnbcEJy30dyIOs88oElY
 KnjeBJk51wflDtb3UuNNbkDH9C5c12SVP+TrafCPCiTtSLJ6SCzDNCIdrViJF+g2WcWwATyaual
 toG5OAvtoTDn7iUTghYbeE0r7fq0f/r6Ka7fRX3or0h6ZW9ioxAgstDpdjMZGx3qhDu2aemnNpx
 19E3c0jQW62kVqSiHEMoT6ceA5ET2GZJWsvq5/l0cXEwVFuP+/Wv0Fwp49Jpd/IBhP/Zu/1mIwO
 sybBHfgWjmgV+G0FVfA==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad7218b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=JsdSkJyxCPcZmfxNhm0PvA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=6DxW-jIhD934SNPESGwA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: uBCYhBkkICdvigf0tn-iFXHC18HUUuC1
X-Proofpoint-ORIG-GUID: uBCYhBkkICdvigf0tn-iFXHC18HUUuC1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfX1MJoswp1kq7x
 BS1iXle80HQs+cgyfB+g5FD+rrj+bJqFawUZehHbNBwGLmfUved4FdO/28QYzN4NwNDkdrQ4Zoc
 ob3xL5G5P6GTaWvTtkRX2uHbF6xttB4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1011 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200032
Subject: [Buildroot] [PATCH 1/3] package/qrtr: new package
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Userspace for the Qualcomm IPC Router (QRTR), the transport between
Linux and the remote processors of Qualcomm SoCs: libqrtr plus the
qrtr-cfg and qrtr-lookup tools. rmtfs and tqftpserv, which the modem
needs to boot, are built on it.

The name service has been part of the kernel since Linux 5.7, so the
userspace qrtr-ns daemon (and its systemd unit) is not built.

lib/qmi.c, built into libqrtr, carries its own BSD-3-Clause notice
(The Linux Foundation, Linaro), so it is listed as a license file next
to LICENSE. The GPL-2.0 SPDX tags in the tree are on CI scripts only.

Tested on an Arduino UNO Q (Qualcomm QRB2210): qrtr-lookup lists the
modem's services after it boots.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 DEVELOPERS             |  3 +++
 package/Config.in      |  1 +
 package/qrtr/Config.in | 16 ++++++++++++++++
 package/qrtr/qrtr.hash |  4 ++++
 package/qrtr/qrtr.mk   | 14 ++++++++++++++
 5 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f46d09db5a..56c919d00d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1494,6 +1494,9 @@ F:	package/gcc-bare-metal/
 F:	package/newlib-bare-metal/
 F:	toolchain/toolchain-bare-metal-buildroot/
 
+N:	Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
+F:	package/qrtr/
+
 N:	Ilias Apalodimas <apalos@gmail.com>
 F:	package/keepalived/
 
diff --git a/package/Config.in b/package/Config.in
index d041291bcb..9416c35458 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -588,6 +588,7 @@ endmenu
 	source "package/pru-software-support/Config.in"
 	source "package/pulseview/Config.in"
 	source "package/qoriq-cadence-dp-firmware/Config.in"
+	source "package/qrtr/Config.in"
 	source "package/rasdaemon/Config.in"
 	source "package/raspi-gpio/Config.in"
 	source "package/rdma-core/Config.in"
diff --git a/package/qrtr/Config.in b/package/qrtr/Config.in
new file mode 100644
index 0000000000..9f7584f6e4
--- /dev/null
+++ b/package/qrtr/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_QRTR
+	bool "qrtr"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15 # linux/qrtr.h control packets
+	help
+	  Userspace for the Qualcomm IPC Router (QRTR), the transport
+	  used to talk to the remote processors (modem, ADSP, ...) of
+	  Qualcomm SoCs: the libqrtr library and the qrtr-cfg and
+	  qrtr-lookup tools.
+
+	  The QRTR name service runs in the kernel since Linux 5.7,
+	  so the userspace qrtr-ns daemon is not installed.
+
+	  https://github.com/linux-msm/qrtr
+
+comment "qrtr needs a toolchain w/ headers >= 4.15"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
diff --git a/package/qrtr/qrtr.hash b/package/qrtr/qrtr.hash
new file mode 100644
index 0000000000..ee37272506
--- /dev/null
+++ b/package/qrtr/qrtr.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  7a82bf80246fe71287b13c66c0466208822e8337fcd4aaf302eee6c5fcb48a52  qrtr-1.2.tar.gz
+sha256  e04f492e71bc5cfe131942eb127c7906d2627831ab910bb894402b476b5d7488  LICENSE
+sha256  dc5e608ed83348a1536b93877596a8bf4a32498e2b740d18f0f7b3a4951cf04b  lib/qmi.c
diff --git a/package/qrtr/qrtr.mk b/package/qrtr/qrtr.mk
new file mode 100644
index 0000000000..7bf7a491bf
--- /dev/null
+++ b/package/qrtr/qrtr.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# qrtr
+#
+################################################################################
+
+QRTR_VERSION = 1.2
+QRTR_SITE = $(call github,linux-msm,qrtr,v$(QRTR_VERSION))
+QRTR_LICENSE = BSD-3-Clause
+QRTR_LICENSE_FILES = LICENSE lib/qmi.c
+QRTR_INSTALL_STAGING = YES
+QRTR_CONF_OPTS = -Dqrtr-ns=disabled -Dsystemd-service=disabled
+
+$(eval $(meson-package))

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
