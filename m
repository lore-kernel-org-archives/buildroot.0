Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F9AC27C4F
	for <buildroot@archiver.kernel.org>; Wed, 26 Jun 2024 14:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4295280F15;
	Wed, 26 Jun 2024 14:39:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1hN9HQVmWZG; Wed, 26 Jun 2024 14:39:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4293680F28
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4293680F28;
	Wed, 26 Jun 2024 14:39:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 03B011BF3F3
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 14:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F26F960BAE
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 14:39:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MHPCtrTiTNvb for <buildroot@lists.busybox.net>;
 Wed, 26 Jun 2024 14:39:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA8CC60B95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA8CC60B95
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA8CC60B95
 for <buildroot@buildroot.org>; Wed, 26 Jun 2024 14:39:06 +0000 (UTC)
Received: from pps.filterd (m0346908.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 45QCvZoA004671; Wed, 26 Jun 2024 14:39:06 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 400kexsanh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jun 2024 14:39:06 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QEd5PS006763
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jun 2024 14:39:05 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45QEd4UD028792
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 26 Jun 2024 14:39:04 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id 7ED6F3027DDA;
 Wed, 26 Jun 2024 09:39:04 -0500 (CDT)
Date: Wed, 26 Jun 2024 14:39:04 +0000
To: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Message-ID: <ZnwoCJCEFcLON1qg@bspbox.kirk>
Mail-Followup-To: "Frager, Neal via buildroot" <buildroot@buildroot.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240625-versal-xsa-support-prebuilt-v1-1-f64a7a396a34@collins.com>
 <CH2PR12MB5004D83C6AFFB37223A0F732F0D52@CH2PR12MB5004.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH2PR12MB5004D83C6AFFB37223A0F732F0D52@CH2PR12MB5004.namprd12.prod.outlook.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_07,2024-06-25_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_07,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406260107
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406260107
X-Proofpoint-ORIG-GUID: pMPpSDxx_WCzOMN0iw5PTHmbSFXJh5rU
X-Proofpoint-GUID: pMPpSDxx_WCzOMN0iw5PTHmbSFXJh5rU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_07,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2406180000 definitions=main-2406260107
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc : content-type :
 date : from : in-reply-to : message-id : mime-version : references :
 subject : to; s=POD051818;
 bh=Z3YX4Q9/XMrFA9aA9jtOBfjWLVNneiJTN1IwQqUrnAg=;
 b=iblNWXoFjg8ojn9Wz5JHSAHSpVlPR/yfL5qMXhE3MouU1dQXGI5Dv2xn5RuPQ6UilErz
 kZ16RWgTNVneTr0Vu2cfvks3zhwa6djlFCw/xHUJxWdVuz9X/sx32IJVQW07HW2KsV8d
 WQ0LHSr/MhmGz3cK8fv0auzU7H1HbtJkFXJx3apgChRKUDQp250WITSGyJt2FMGFOT7O
 AdqW4FIjxleTvVu6x4bY18Vzh1DnseYk1X0VTDOTM1nNhkrs9SVo338JrOWs6gLp4P45
 uteNCjyRu0cKSrFUQQ71ayh8eE4CcqypS35DwLVpm5puwY2j32BPnzOYpLyjpSGHXp5U 5w== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=iblNWXoF
Subject: Re: [Buildroot] [PATCH] boot/xilinx-prebuilt: support custom boards
 using XSA
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

On 2024.06.25 21:02, Frager, Neal via buildroot wrote:
> > The xilinx-prebuilt package only supports development boards that Xilinx
> > has published firmware for. Custom designs based on the Xilinx platform
> > must generate their own firmware using the Vitis software suite.
> 
> > Vitis produces an XSA file, which is a Zip file containing all the
> > firmware needed by xilinx-prebuilt. We extend xilinx-prebuilt to
> > download custom XSA files and extract their contents.
> 
> Thank you for adding this support.
> 
> I apologize for not catching this earlier, but isn't it Vivado and not Vitis
> which generates the XSA file?  Just like the xilinx-prebuilt package will now
> do, Vitis only consumes an XSA file that is generated by Vivado.

You are correct, I was mixing up the new terms for the Versal platform
and thought Vitis had replaced Vivado. My FPGA engineer confirmed it's
still Vivado that generates the FPGA design.

> 
> Would you mind correcting this in your comments?

I can send a v2

> 
> Other than this, I like adding this support to the package.
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> Reviewed-by: Neal Frager <neal.frager@amd.com>

Thanks!
Brandon Maier

> 
> [--- SNIP ---]
> 
> > +config BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
> > +	bool "download a prebuilt Versal XSA"
> > +	depends on BR2_TARGET_XILINX_PREBUILT_VERSAL
> > +	help
> > +	  The Xilinx Support Archive (XSA) provides custom Xilinx
> > +	  firmware files generated by the Xilinx Vitis software
> > +	  platform.
> 
> generated by the Xilinx Vivado software platform.
> 
> [--- SNIP ---]
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
