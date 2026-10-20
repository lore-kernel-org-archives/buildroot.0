Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B381606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 08:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TKF27hWL
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FCB9605B7;
	Tue, 20 Oct 2026 08:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZTgnT35jFZdr; Tue, 20 Oct 2026 08:08:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 22F836068B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792483725;
	b=d0UDbbDvFjEjOLE8CsokainvbTxLzYbSmNGNHZbHBuKOuIF93uxuJH4YfWRpYRKsWg+O
	 o0ZPmK+LfLQtC8sZi2GYC6BysaO5zZCE4LCqv+0PHOMOdrk8/lrItRevbMtTboZ81KpML
	 x9QQxF4+xVf2OJpUyQJtIVrBKqNsYeaPIZk7Dl8PG5Q2gblhMCOqZ62js1zbydOc8eA78
	 aNBiAdLcFrcash7aGDGfqfDjaLob33OLi+FPyg9PbCvz3OcUIJjkbWtvsHFKZDC1vtleF
	 /T36OP/iAZy7RGWC9UYAeGjqukIMVTnwk/0S/fy94JLVVsweHBQrSx02BxhzRJEGxbA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792483725;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:Message-Id:MIME-Version:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/tMKa+N2Q7uwrDMQZHU+YGAH8Zhh2syIma+ItHPHBLs=;
	b=GVhBszQsrKshNHjV7lIGs1cxFuV86oMzDtfYykWgvmEkjwYd2fz+yR0D4bnyIgGncBk7
	 tYOJqa4eVJmUGGUfHH3wtyOCf8ZfPhFFXvP8fNPQtZLISB9usaUZDwxa/7QNGQl9caumb
	 jDIt+/wCqAn5dSDCktBLuBxP3+UYCTMX0wyIEIp+RXCsCxSZ8zj4dHfb430WvQNouS9jk
	 2xiUIxjZieZwo13MOFpoNW81RRMiyWXpj48TjHTxqnLHqd5ECP2If2aReYmg/OBtT381H
	 kzUYcTrqZXQeL1NSEL7vqbwrP/+Au0168tJDTyQM7Ug3252IavinVKbZO7DyXlotnKg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792483725;
	bh=/tMKa+N2Q7uwrDMQZHU+YGAH8Zhh2syIma+ItHPHBLs=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=TKF27hWL6lSHDJfjaMPKza+RX9FT78ih0Is9UZ/v+ywYbDj3bLFj+/DskT8/TLzDe
	 i69W8zaxst8vVL1vum1hkQajeQShxEIFfmRoOENFGfwOhETl9KiUy8rNJHBSWFuLvm
	 K97cPDqiy39dN4oT1XGAEcnLJCVFtVCQDvaJMREXTmYvpjWeQjd9U0AM5+ohvGxpP7
	 5PzGT65L+LAR1HWb1YSIlkm70kdCypfZfXfeMfyvVDKJ8qOBS1UxywJUBFtuyJlNtt
	 FgqYeDVzBsbO0tHvSi7xH94KmWp4aQ5NijPkjk2HAHYHqP0I9b8NeHgiINowBRExOT
	 7FBe0QFyhNg8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22F836068B;
	Tue, 20 Oct 2026 08:08:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0326F3A8
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 08:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2641607FA
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 08:08:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1zU2aOeahTXj for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 08:08:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B01786075D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792483721;
 b=aJOE9vnGYGlP1wVq4/ZYX7lZH+e71fN/uMg7ktpeW2LMvExxzSGi/MFgymfjWC71CQpX
 DX1FBHCQLRfbDDDEEUO3Ww48emOcZ3Gx8T33gALuhkGHIDQBY0CRQV0qM/dMYG+pmmBL1
 Pz0z3I097oPXD/kfYx19DcGhXcvfhbiRju2aLWrWy8+B4ebdZk4mp1myoBsZ38G5/eztg
 JdmCPyytcT5bLZYFoyvDtL0xagHJPZ3MY5e7wjN75VntvABLTO885iieo3Gk3oxjAUn1c
 OGG/75f4wQr7gkpN8meo9EgbWkyHn/bCCFQzyRH+5Dx1K+fukmahgobT5CO/WYvYd/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792483721;
 h=Received-SPF:Received:DKIM-Signature:Received:Received:
 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
 X-Proofpoint-Spam-Details;
 bh=jBHyys3NFjcqBE825lDdilaOYfr0nvbJjUhaQbTpYIU=;
 b=oNVFX3t4OdN7bOk3hpR09nz6gq2kaeNAHMT024Mj+VxNhF+6t4CHKb65QoYuDvn1C2Pw
 nNT58Y2oEjqWhuA5ALgfYmxgCKXDJy0smC7H0VQTTOj0fW7bVWJkHag8d5BwNldaCm50I
 MIjZtFrBPqtO/D9N/XB8vCPvehWDFL2AQa/jxI9zk+gh+bL5QG3DMpkhu6psVvVMO5l0Y
 ZTciAsdtSwCY4BUltO7GV/1Z+na2MqXLBCMfE7meO5+1P+dXRIDTT11JtIWOKv7CSPjp/
 xBzEqfJI9BMi3GgWwFHt2os8V+VS6PBSxTBk8Tn/iiGrL4diQbUb/8kCzeKCU9hMA4g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=oss.qualcomm.com;
 dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=UUtLs33e; 
 dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com
 header.a=rsa-sha256 header.s=google header.b=gN2V0PDq; 
 arc=none smtp.remote-ip=205.220.180.131
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.180.131;
 helo=mx0b-0031df01.pphosted.com; envelope-from=igor.opaniuk@oss.qualcomm.com;
 receiver=<UNKNOWN> 
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B01786075D
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 08:08:40 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69K0tIHP4178063
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 08:08:38 GMT
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1h7v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 08:08:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-5364605e74bso89424191cf.3
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 01:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792483718; x=1793088518;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=jBHyys3NFjcqBE825lDdilaOYfr0nvbJjUhaQbTpYIU=;
 b=DchCweYqw1OsVtAdI22wG58CvKHgWnfsGaZmDcVrJlJFIY7TLGu/XlqU7PxVKGdmgp
 Gvjn771ODMS0+oaTlpc7/EvgFVkr0rt/SdoFy+0t9UgHT39hlyql8rq1Ydq2tkrmlwxi
 HgHXHT/TUkDKfEKJyTt/6bNoCoz0etmbA2pI7/qM7z4rXhFs4C/eG/XDXsIIsHTmTHOd
 8iIm7qmi4gIVCh7TCAkgqomYESuV7fuyDJogOgyuxLDmA6kqVjFnoz7kYCV29XOHpMCD
 crPRVf55jpDK8Uww1ObSwYo5CX9KJtxD0gaLlR0ltHQoZdQCrStBLmOphv4moRao7mzR
 fZWQ==
X-Gm-Message-State: AFq9FYJNkOCEizH675WobL2T3V5H6cD84PExZJW5HGOn0auSoAA5aiaE
 5yJluArKhvrufnuL9eP71Wzf5kxOXyLm6ZWTOYYdAYilNpo6PdDizYyX3IM1a2tGJrF7pZE56eY
 OA1zlWHmyZuSdZackXLk7miI87hRmVEFHIJIg/KsFr8lvLZNqrtTNYhmWkj59
X-Gm-Gg: AYBFou1aRZvG5+vfn2Aie+BzfGRR74zaNTh5NH28yPJrDReRnloEnFCgVIi527iL79b
 tu8vt6/tiOFm27Ni0J5Iuoqg8GIesWvtDSZXu2kuiJA7kPTlyP2v1xM/6abl75WsYw/993uCgMI
 4CibQrBgnPrd02ayQR+kCSeuVIklxkpJKXeEm3zXgvRrQHNKEHPWqNeBh6hCASyCxgz9LRQjgSH
 aeAjXzot2gAG/fXSpOzARGrayaTCnTDZCwYAYJY9lKUOZoBQRGNYoJvRjERIDyWpgzdnGliQMUI
 /D03J4pp1vYdjl/o+T0cPzV9Ihvw/G9KfqImfZZe0Q9TKW8Eoa/A94ejawvtJ649F8JUYOqdC9Q
 HjV5soIJP8hmCeM+C5ikVVZfct8q+pCzOHQkExc4yv4Fh
X-Received: by 2002:a05:620a:688d:b0:93e:f8e8:de42 with SMTP id
 af79cd13be357-93f29b72d62mr1666923585a.11.1792483717822; 
 Tue, 20 Oct 2026 01:08:37 -0700 (PDT)
X-Received: by 2002:a05:620a:688d:b0:93e:f8e8:de42 with SMTP id
 af79cd13be357-93f29b72d62mr1666913785a.11.1792483715588; 
 Tue, 20 Oct 2026 01:08:35 -0700 (PDT)
Received: from [127.0.1.1] (185-164-141-21.cgnat.inetia.pl. [185.164.141.21])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b38a1e70c1sm4836466a12.30.2026.10.20.01.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 01:08:34 -0700 (PDT)
Date: Tue, 20 Oct 2026 10:07:44 +0200
Message-Id: <20261020-qcom-modem-userspace-v1-0-da720723d9ef@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM3QoCIRBGX2WZ6yQVCexVoovRnW0N/MnRCJZ99
 9y6PB/fORsw1UAM12mDSu/AIacB6jSBXzE9SIR5MGipL0oqK14+RxHzTFH04XJBT8Ia6exirNI
 GYail0hI+v+zt/mfu7km+Ha3j4ZBJuIrJr8fUC7dKGM8RuVGFff8CH91hCZoAAAA=
X-Change-ID: 20261019-qcom-modem-userspace-940b9f49124a
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: ndwW_pKbIjpeYK715N2OtH1Q4x3uRdab
X-Proofpoint-ORIG-GUID: ndwW_pKbIjpeYK715N2OtH1Q4x3uRdab
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad72186 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=JsdSkJyxCPcZmfxNhm0PvA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=JzGFkorGx9d0zrGlBYgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfX75T6N6KpKhOU
 lJiE8hQBi5uQLDpzzW8O5yC2uHLX+EHQTQmmFmdj/cFeP1w2hkFsgjaXDC3EWjgkYyR1weYY3o6
 0yd+PI2JAo7+y1y7egfx7iQP6mAZovOP0nhS9giw3eKlzekZV0Eqpq9cEmSqnK5vNHr4Y5fo4QJ
 wJTw9TJAIFb35Ff2d+VorDguwnQ4fCFfgqzHUBHu8ZCNLdqEHbz3KcyZfZTFvi79ric9qJuJG5U
 Kp1oT/k05obU3u0k/jtGrRuPBVSlyaMWeld+ItYdQz7nK0pwiJl1hEm0m3966ncQlp7IRdRMp+x
 1Kp4/1sridjC4mki2upZgoPaTG0LlK3YTYl/PZzcVIHLftbRpP65W6ObUW71k4tbuDtYYeZ3zP8
 +WihuMKechM5JuJnY7WDj9qsMI7sGtMzz4pP3vUwRfP9m4Tx/aMaCsi/EQTNsZlqugKVJcsmxqU
 zZ9E3rfqi1C/qcfuQ2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfXxW9bj37jTjFq
 Vs7tIjh6NqDSRcJJ3V2p5fdHnjJFFfX2hQtxYRnEUTHFO6dOt27qWxKg4KsQpw4SlbRwb5xqo+C
 /U6JFbhDNOlhmKMMNSzEdooHFMmK+FY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200032
Subject: [Buildroot] [PATCH 0/3] package: add qrtr,
 rmtfs and tqftpserv for Qualcomm modems
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

On Qualcomm SoCs the modem cannot finish booting without two Linux
daemons: rmtfs, which serves its EFS partitions, and tqftpserv, which
hands it the files it asks for over QRTR (on several SoCs the WLAN
firmware runs on the modem and is loaded this way). Both are built on
qrtr, the userspace library and tools for the Qualcomm IPC Router. All
three live under github.com/linux-msm; this series adds them to
Buildroot at their latest releases (qrtr 1.2, rmtfs 1.3, tqftpserv 1.3).

Notes:
- qrtr: the userspace name service (qrtr-ns) is not built, the kernel
  has had its own since Linux 5.7.
- rmtfs ships its QMI encoders pre-generated, so the qmic generator is
  not needed.
- rmtfs and tqftpserv get sysv init scripts; with systemd the upstream
  units (and the rmtfs udev rule) are installed instead.
- tqftpserv carries one patch, defining _GNU_SOURCE for asprintf() so it
  builds with uClibc-ng; it is pending upstream:
  https://github.com/linux-msm/tqftpserv/pull/56

Tested on an Arduino UNO Q (Qualcomm QRB2210) with mainline Linux: the
modem boots, its EFS is served from eMMC, it fetches its WLAN firmware
through tqftpserv and the ath10k interface associates.

Build-tested with utils/test-pkg -a (qrtr, rmtfs, tqftpserv with xz and
zstd): 26 toolchains OK, 6 skipped as expected (noMMU, static, no
threads, kernel headers < 4.15), no failures.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
Igor Opaniuk (3):
      package/qrtr: new package
      package/rmtfs: new package
      package/tqftpserv: new package

 DEVELOPERS                                         |  5 ++
 package/Config.in                                  |  3 ++
 package/qrtr/Config.in                             | 16 ++++++
 package/qrtr/qrtr.hash                             |  4 ++
 package/qrtr/qrtr.mk                               | 14 ++++++
 package/rmtfs/Config.in                            | 17 +++++++
 package/rmtfs/S45rmtfs                             | 58 ++++++++++++++++++++++
 package/rmtfs/rmtfs.hash                           |  3 ++
 package/rmtfs/rmtfs.mk                             | 45 +++++++++++++++++
 ...translate-define-_GNU_SOURCE-for-asprintf.patch | 36 ++++++++++++++
 package/tqftpserv/Config.in                        | 14 ++++++
 package/tqftpserv/S44tqftpserv                     | 51 +++++++++++++++++++
 package/tqftpserv/tqftpserv.hash                   |  3 ++
 package/tqftpserv/tqftpserv.mk                     | 32 ++++++++++++
 14 files changed, 301 insertions(+)
---
base-commit: 4eeec84c3341715e0436e40f94b31379f227000f
change-id: 20261019-qcom-modem-userspace-940b9f49124a

Best regards,
--  
Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
