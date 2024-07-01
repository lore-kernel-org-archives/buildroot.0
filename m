Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0C4C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 17:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 348AF60A8F;
	Mon,  1 Jul 2024 17:19:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0feQ1rVHWyZG; Mon,  1 Jul 2024 17:19:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 295076077C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 295076077C;
	Mon,  1 Jul 2024 17:19:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E22D01BF342
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 17:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7F1B402E3
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 17:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YsDYJ8LgFoB6 for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 17:19:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4B3CB40137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B3CB40137
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B3CB40137
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 17:19:09 +0000 (UTC)
Received: from pps.filterd (m0346902.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 461FTMHV025578; Mon, 1 Jul 2024 17:19:07 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 403y53s3v0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 01 Jul 2024 17:19:06 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 461HJ5TZ029793
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Jul 2024 17:19:06 GMT
Received: from crulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 461HJ5Np027758
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 1 Jul 2024 17:19:05 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id 6DA00A6F3;
 Mon,  1 Jul 2024 12:19:05 -0500 (CDT)
Mime-Version: 1.0
Date: Mon, 01 Jul 2024 17:19:05 +0000
Message-Id: <D2EDHEYOJJ00.3VIR95EJNXFD2@collins.com>
To: "Frager, Neal" <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240626-versal-xsa-support-prebuilt-v2-1-724b00c4596d@collins.com>
 <CH2PR12MB5004E73315D7C7AA4703A4B6F0D32@CH2PR12MB5004.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB5004E73315D7C7AA4703A4B6F0D32@CH2PR12MB5004.namprd12.prod.outlook.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_17,2024-07-01_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_17,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407010130
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407010130
X-Proofpoint-GUID: Azf6X3rzISZSZbkAZDBGKcTZeJ-xcqtk
X-Proofpoint-ORIG-GUID: Azf6X3rzISZSZbkAZDBGKcTZeJ-xcqtk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_17,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407010130
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=NMTY4QkJdbljc8fZCDMXWRV7RQgSIhBhgmjsLW2C9Kc=;
 b=dNKDLF7UZOVgoxsKEw1p1+2AHehl7V6c/ft02xruoLWuPU6NrMuBCQ4ZP3W7poDpunFm
 bSqHGkudY41RzjL6UVS9eHCPP3nO1KUwQh7UpCCn0y/PioDg2rKQNMYH+0HIrvycSboa
 nIxDrT7upbwyscc6OfBNAT6tMhhsSRwu56D5X6m9TnTJk7A1f3Mt25fEpb8w/yYmgIEF
 JNc6o4dL9Hy5vZ0xNQQG8AImg+b/G0ubi5H5tA7PqbmWAdMgiW9tp1nwkQoe3dbEI9sd
 eraRjCpeNbfwv1eRHflo8VXm38Cb2eEPSXk67mUy/hhEft7fcezNrlcfAbMseG8oeYgq hw== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=dNKDLF7U
Subject: Re: [Buildroot] [PATCH v2] boot/xilinx-prebuilt: support custom
 boards using XSA
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Brandon Maier via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Maier <brandon.maier@collins.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Mon Jul 1, 2024 at 10:05 AM UTC, Frager, Neal via buildroot wrote:
> Hi Brandon,
>
> > The xilinx-prebuilt package only supports development boards that Xilinx
> > has published firmware for. Custom designs based on the Xilinx platform
> > must generate their own firmware using the AMD Vivado Design Suite.
>
> > Vivado produces an XSA file, which is a Zip file containing all the
> > firmware needed by xilinx-prebuilt. We extend xilinx-prebuilt to
> > download custom XSA files and extract their contents.
>
> > Reviewed-by: Neal Frager <neal.frager@amd.com>
> > Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> > ---
> > Changes in v2:
> > - Fix help text to say XSA is created by Vivado [Neal]
> > - Link to v1: https://lore.kernel.org/r/20240625-versal-xsa-support-prebuilt-v1-1-f64a7a396a34@collins.com
>
> [ SNIP ]
>
> I apologize for this, but would you mind rebasing this patch?  The
> xilinx-prebuilt.mk has changed since you submitted v2.

No problem, sent v3

Thanks,
Brandon

>
> Thank you for adding this support!
>
> Best regards,
> Neal Frager
> AMD
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
