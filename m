Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725B2606A331
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 08:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=c/rJ6PoJ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33F0480D6A;
	Wed, 21 Oct 2026 08:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1KtO-Rt_v4O; Wed, 21 Oct 2026 08:47:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2733B81027
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792572472;
	b=AL+TZh02BGnHnaRoPDHrbqQbb5+IhyNzGNzr2Gn3LZ1Z/Fa7BFrBVjuOxZPbtJNbvOKZ
	 XK80VJbH/TvY3FuXW26BBtvkVTFxnFEQNKRwW/2y40age9/zgYhUF0fIpHepUgOb+/wzD
	 qOeDvZVLBlE9mF0cyNgoHRuFzhQXANYDUO6kaKqqb69axcfXZvMYLdATlbB8dxkDGQ+yV
	 wezmS5Ul8ZY43KGITuIR5P1o/gsNBVDiUe1AU6Xak0C9fh4gv2ZNA2smMwsmjdhAbVnEj
	 Kv6EiEcwmBodgUI8NeXw/P/wCGW/sOWzOKwP380+R39fz23QXYe15WZH3zhlG9NjyvQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792572472;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:MIME-Version:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=d5ajHkfFFIv51iTHakVkOBzBzx2BXoW/GGmwZm8oXAs=;
	b=orjbsBFYfdl9N7o43UCsFxmik5SARyyGwAI3kc0D4XeYg7ZNggU79HqVAoI35AdJDwZN
	 AoE3EfuqckCf3/jIAQcwM9Un0KgpIAdZmya5IhsbNOy1/lB+RCPVY9bgWfiI94nX6oUsW
	 Qu0SpoxFw3BRDwE3V5DD7mELBNX6IG49iDZ0ktl0E3KfHa8DPLOUNDH/XpgNLaLgLr14J
	 4FXuHPMxA2VCjpKIaaQ24N84gfY389jvvH6lM2tQRtZXD3kuYyP5IMAgLLAWKO69/cqUC
	 pPiawJPgX1Hb8wh8itaExT+EdWKY38jDyXCLqUulys7Ek9JXADeURcJpIovY8CehWdw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792572472;
	bh=d5ajHkfFFIv51iTHakVkOBzBzx2BXoW/GGmwZm8oXAs=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=c/rJ6PoJdbgM0TvcCEet0jVEfQnLWOJX6V8UO5hfUTdBZX2x8prMxiluQ+qzl13bd
	 8tD0Uphj4hQ1UrFDnO6uec94dwHDRbsRCWf+KvvI7jNdkL5mMoaSf+qgeKiDPs/4ru
	 aEGBjaKkRuMcRgrnyJCZCot8h7YjoYBXCjxGVpGbPrfIvTAuOcMzRmvkq72GIAM+tW
	 lD6jPksN6g/s4k8Qrpl1/qrh9xWCu+ZTfx6Mi5lc3nyyPhXl4EkUX+WtL31x5PzFt5
	 v2X6FmIqpLPK+A9HWbgG5lEU4/4sjozgCwuXuuuzCH1eECqVvN2AoA3WqEfFIg8jQP
	 82tyPMHoaxFhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2733B81027;
	Wed, 21 Oct 2026 08:47:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 59702E50
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 08:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B12060719
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 08:47:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SN8n2u7qwYuw for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 08:47:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2BCD86070D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792572470;
 b=h+Jbpa8gHDiKd7/dMzYWOcwKVsRHzPxQ9YAL/zdFMRBGK8o7CbPh/qW7QZ4Xs/Yk5kzJ
 O1rBfBZu/eBTXuGo1EYi/JHt8MDyp3FGVhP18uiuATdam09JP+7A4LoejFRpA6RQ3xh+u
 cDRqDfuPQknzFojnALx0h1s005EaAohxSmpSBC6B1KwLU68Zj254juUVRVdUmwQbAO+MV
 ZtgkliLMu1/y4FRm0nk/tZVRptV3WaFicKKW6r5WHOYgS8O9bWQR+4mOI4FrFdidX4bSf
 +vhSSN77ptl11tBQdnZSmYtC3TOzUJyxx7+m4CYfAChDyVLSY4rxya3yDVHXsdH478g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792572470;
 h=Received-SPF:Received:DKIM-Signature:Received:Received:
 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
 X-Proofpoint-Spam-Info:X-Authority-Analysis:
 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
 X-Proofpoint-Spam-Details;
 bh=oPFjMXnckDTP7gtQLpqIYhzvZ1q4a6U2AzyUr8HQDic=;
 b=Pc2+XmqI3bRqjFKakSzHaBYrvfkTp2y+RdunqfnASttGa7oHVSW5qzHCMFdEiXBz3r7D
 c5x7EZc7hFoL7mc3XTXtUbOb1vKssPm+BUoDBC3sCFLk9HsgpUWjBHajAUalJgdiSYmUz
 BOMQ0pxLcQSu8SNTn+DPNYhZqJpUJ2/5zDl3I/MvuzkKdk67e8RP/QNwqYUJPt3hiTaPA
 GCudHD6w4rj4c0MVPnesLx1HeE5Z4bT5Jkh0WlNkdxZVdwoq4zvAAmEMr2lDud8KhYfoi
 cLXTSe2H3e+uGjJlIn5OflFm30txMfwm89EN+Q7mQ8gEsT4F0kj2iWl+sLRyCIt7pNw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=oss.qualcomm.com;
 dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=K9BvOvZI; 
 dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com
 header.a=rsa-sha256 header.s=google header.b=MY78ucfu; 
 arc=none smtp.remote-ip=205.220.168.131
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=igor.opaniuk@oss.qualcomm.com;
 receiver=<UNKNOWN> 
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BCD86070D
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 08:47:49 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L5ixGb756329
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 08:47:48 GMT
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4u08v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 08:47:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93f20addba1so91309585a.1
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 01:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792572467; x=1793177267;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=oPFjMXnckDTP7gtQLpqIYhzvZ1q4a6U2AzyUr8HQDic=;
 b=IbmKRUzuw80CmXlqcynx9su3AkZUwOosqEiF4IwyG8AYhfqG3UnuIVfR9uB2TzlVnj
 YowOLPXpuG6UF/TvsUypC5tqoif1CVFEJVh+WpdjFwYYH7OpewI3yU/fu63/Zyy56Rm6
 OrogLAbMgqUo5l2lmQhR4h4XtfOULqItwAReZBsc/8k8zMTwJq01gidDjrfNHNGuLgFY
 i8CP9I//4Lk5js1IEDzx1zsmCS7gKOVjImakoo8nII/4ki0WsNi/NqJxAkYSbGiLYjXR
 1coIGKKpJWY8zNbw1qgkHQckaBYl3mHOQJNHNGF1gfuKZ/rQmbQC9bX3St+Jqb6cwexF
 pKEg==
X-Gm-Message-State: AFq9FYI/HYgbWXwtXk5867kTKUArbyclBcMbyqtnpJ+IeKfU+80mM9p1
 6xTKkIvJTiDNhlWwxlKpaAuKNYwKbskXjLWtITrO75js1Il+Obu2Zh9KJHFTAYDUaBsrxF5siJv
 j+hr1DwNxLGlhb3sZuTPn/KvjPp2+AIeH0JIWx2XltOvQ5+LB+92rSnkBxsKV
X-Gm-Gg: AYBFou0LiYhijWy39TvdvXhNJYYh9jdHJY15T+vDPx25yjTa4+itBWhiR6YvxmzXiew
 BzlUB/LWAwUvsvgtryUJqmZH+Jd3Jy1s8Y8qd5HmKHw2c8hOjFmaPXeKqOU0dpFP8wNyqJfkNe3
 svhCWjqsdLlU3NWON41KOmHFRS4NIVPIRfZwziWeznLzPOfHhDcs6IoR9dxqxfvaqEVpZVi4YgX
 rAn9JQAAQat/pGWWyXnownwk8D/ocoywroEAO5lCQAj7HRrkskVgquEi57IOcaxxmXeI3s6qAz9
 YEfn3SnsTlZqsXZXLHpGA2oU3cjzNEjs3EgvLuf66Dcaa/qqnbXpFAvb9Fu8M+1J/wwJ6G7qJ/Y
 LO9k2nLSu9OtRDm/BvTRfcmvuiQXI+bnebmAQGIoIa9jj
X-Received: by 2002:a05:620a:29c6:b0:93e:4e1e:aafc with SMTP id
 af79cd13be357-93f57f2324cmr302705285a.36.1792572467467; 
 Wed, 21 Oct 2026 01:47:47 -0700 (PDT)
X-Received: by 2002:a05:620a:29c6:b0:93e:4e1e:aafc with SMTP id
 af79cd13be357-93f57f2324cmr302703885a.36.1792572467082; 
 Wed, 21 Oct 2026 01:47:47 -0700 (PDT)
Received: from [127.0.1.1] (185-164-141-21.cgnat.inetia.pl. [185.164.141.21])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4678fa80d7sm54152666b.32.2026.10.21.01.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 01:47:46 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:47:17 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261021-b4-qrtr-static-v1-1-b980f0bf22e4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ7CMAwEv1L5jEUT2iL4CuLgBIcGqaHYKUKq+
 ncSOM5qZ1ZQlsgK52YF4XfU+EwFzK4BP1K6M8ZbYbCtHUxrDboOX5IFNVOOHrvBht4eD9SHExR
 pFg7x8wtern/WxT3Y51qpD0fK6ISSH+u0zJqFadpPpJkFtu0LiTf6nJQAAAA=
X-Change-ID: 20261021-b4-qrtr-static-462f5273a5f9
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: t5PEIb-RiDyqyH4pzO5-YgAx0l4XIOYT
X-Proofpoint-GUID: t5PEIb-RiDyqyH4pzO5-YgAx0l4XIOYT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX0BoDC1q/cDw8
 KU6Mak8jrgXDQ9xo64oMR8uipynZXut9hFWSoMD+9dOqkduJ2tKCV1fdpBpA9hPIGZSgMYBMwuT
 +CqlHSgCz4IVS+rd/qbw1VAY+TC64ck=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad87c34 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=JsdSkJyxCPcZmfxNhm0PvA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=YRHvXXt1AAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8
 a=qOitBILJYPvU8zZjW4QA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=9bw_jnHfPby8klRCszyn:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX9ooPbrXDg8xZ
 /Bou6nUQouM5vLOACbHavbk/kGxm1GSkJiSbhYuy1nU+GsE78u/8woL7642rowtXJxZHErFLFP4
 3EtnrLEJAKn2xpWTlZzBbG4LD1ye6lOXKH8d54jOM15kcgZBNxmw9vYnYkV7zKT4vAXSAgqcs5c
 meAoHU+1g4CeHmYHHTGufwTP00mc5nCTXq1be0NcNC62a3qsCSL8LEoFQRLbQQgTmOTH7eZv0RF
 w6BS+aGkhU8SqV+T507fdlsBv2hrjrY0NxwkxMSBOxkKSRZJwNiqMTLs9cRmUOZeLX5FXk9m4dk
 rD6P2/kFwn+jJ9SfJgfgkZg5V1X8OF6AFT8irZ2+KYlTnUV2H/rqnmIHwLL2OxO8YNPWYLLINHa
 VND8OPJ0CwSfTX+yrDcL/2GxPJphuValg9CF7IsITUffiT6Grhc5al9PvC0XrtbL2xINZODlX3R
 KrjV4aBL0CpkM+iYHNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210034
Subject: [Buildroot] [PATCH] package/qrtr: fix static build
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

qrtr 1.2 declares libqrtr with shared_library(), so it builds a shared
library even when Buildroot asks meson for static ones only
(-Ddefault_library=static). With BR2_STATIC_LIBS=y the tools are then
linked with -static against libqrtr.so, which fails:

ld: attempted static link of dynamic object `lib/libqrtr.so.1.2'

Backport the upstream commit that declares it with library(), so
default_library decides. It is not part of a qrtr release yet.

Fixes:
https://autobuild.buildroot.org/results/d5f669f99f72ee68433bc8a1b1197594f46e8882

Fixes: 81bec84bfce986a49b799384c3d0c540fda5367c ("package/qrtr: new package")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 ...ib-meson.build-Don-t-force-shared-libqrtr.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/qrtr/0001-lib-meson.build-Don-t-force-shared-libqrtr.patch b/package/qrtr/0001-lib-meson.build-Don-t-force-shared-libqrtr.patch
new file mode 100644
index 0000000000..05cf46faf7
--- /dev/null
+++ b/package/qrtr/0001-lib-meson.build-Don-t-force-shared-libqrtr.patch
@@ -0,0 +1,41 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Luca Weiss <luca.weiss@fairphone.com>
+Date: Thu, 16 Apr 2026 09:08:41 +0200
+Subject: [PATCH] lib: meson.build: Don't force shared libqrtr
+
+Allow the build system to build a static version of libqrtr when the
+user requests it.
+
+As per meson manual:
+> You should use this [library()] instead of shared_library(),
+> static_library() or both_libraries() most of the time.
+
+Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
+Upstream: https://github.com/linux-msm/qrtr/commit/f83bb6c1a87a4a030e36796b4ca9240b0321e15d
+---
+ lib/meson.build | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/lib/meson.build b/lib/meson.build
+index aab46cb..faaf7d1 100644
+--- a/lib/meson.build
++++ b/lib/meson.build
+@@ -3,10 +3,10 @@
+ pkg = import('pkgconfig')
+ 
+ libqrtr_srcs = ['logging.c', 'qmi.c', 'qrtr.c']
+-libqrtr = shared_library('qrtr',
+-                         libqrtr_srcs,
+-                         version: meson.project_version(),
+-                         include_directories : inc,
+-                         install: true)
++libqrtr = library('qrtr',
++                  libqrtr_srcs,
++                  version: meson.project_version(),
++                  include_directories : inc,
++                  install: true)
+ 
+ pkg.generate(libqrtr)
+-- 
+2.53.0
+

---
base-commit: 4b65f6274e5e70e7101277a6580929abb39e8ef0
change-id: 20261021-b4-qrtr-static-462f5273a5f9

Best regards,
--  
Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
