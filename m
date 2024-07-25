Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9F3C3DA5D
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 19:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA8EB60676;
	Thu, 25 Jul 2024 19:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ZPkBgJ323mg; Thu, 25 Jul 2024 19:34:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0A316074D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0A316074D;
	Thu, 25 Jul 2024 19:34:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 36E071BF422
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 19:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2513F401E7
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 19:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9RS_8lqxbMec for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 19:34:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D7D74401BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7D74401BD
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7D74401BD
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 19:34:38 +0000 (UTC)
Received: from pps.filterd (m0346907.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46PGlRJP025549; Thu, 25 Jul 2024 19:34:33 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40k1byjebp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Jul 2024 19:34:32 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46PJYU2Q007258
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Jul 2024 19:34:30 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46PJYTdl017535
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 25 Jul 2024 19:34:30 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 35BF93000425;
 Thu, 25 Jul 2024 14:34:29 -0500 (CDT)
Mime-Version: 1.0
Date: Thu, 25 Jul 2024 19:34:29 +0000
Message-Id: <D2YVE5NGZSYH.25O7ZZFRN3GCY@collins.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240724-revert-output-gitignore-v1-0-510a2795884c@collins.com>
 <20240724-revert-output-gitignore-v1-1-510a2795884c@collins.com>
 <20240725075112.576a95cf@windsurf>
In-Reply-To: <20240725075112.576a95cf@windsurf>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_19,2024-07-25_03,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_19,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 spamscore=0
 bulkscore=0 mlxlogscore=862 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407250133
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 mlxscore=0
 adultscore=0 phishscore=0 spamscore=0 mlxlogscore=791 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407250133
X-Proofpoint-ORIG-GUID: 8WxDnTWsjM667O1aXBOWMLtIcE25yLl8
X-Proofpoint-GUID: 8WxDnTWsjM667O1aXBOWMLtIcE25yLl8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_19,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxlogscore=932 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407250133
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=Hp8b/T1Npwwru2lwBGg2BlBG2i6HWvPHCOGH5YZFxPc=;
 b=gcnSMwbl9Pn2qoQs7K90B+k/IWX33c0gD262n0U6X9a7fcFA2KmYh2t8st20rdfxmvzv
 1mziI7k9DxmpCulDsIeytHq5Q+wvfNnaQJPiBQKw64C7gOLRf6SiVfFRwJWFAcSFDTc7
 UPIOgZLZQNpgY/SW7sVTzWU80Kc+5N3LxIXyp09WRZcZseFYvVnzn7xfwZJdh01GOomb
 ILRrzBB5nfPxsaJqbixkjQA6hCzonIU1unHAWPZ27Bmus8D1lbfY5OkMeKr5l3qryiYN
 pIi5/2cepAPBVh0xn2qjJzL7XTEQz/bJKK2iQCEvboQjzEde1zpMlPwRuM5g7EUG/D1j RQ== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=gcnSMwbl
Subject: Re: [Buildroot] [PATCH 1/2] Revert "Create a .gitignore file in the
 CANONICAL_O directory"
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org,
 Bryan Brattlof <bb@ti.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Thu Jul 25, 2024 at 5:51 AM UTC, Thomas Petazzoni via buildroot wrote:
> Hello Brandon,
>
> On Wed, 24 Jul 2024 21:23:20 +0000
> Brandon Maier <brandon.maier@collins.com> wrote:
>
> > The packages 'python-jsonschema-specifications', 'pydantic-core', and
> > likely other packages based on Python maturin silently stopped
> > installing files to the host and target directories after commit
> > a14c862c08.
> >
> > A similar issue was reported by the Conda project[1]. It seems some
> > build tools scan for gitignore files to decide what files to build
> > and install.
> >
> > I attempted various combinations of gitignore patterns including
> > mimicking the Conda project's gitignore[2], but the only thing that has
> > worked reliably is the original `/output` ignore in the root Buildroot
> > directory.
>
> Thanks for working on this. However, it's really messed up. Why would
> these tools be bothered by a .gitignore file? Do you have some more
> details?

I did discover I was wrong about python-jsonschema-specifications, it
does not use Maturin, it uses Hatchling. Hatchling also has a gitignore
related bug. I opened a github issue here with more detailed info.

https://github.com/pypa/hatch/issues/1641

>
> I think I'm going to apply the revert to fix the immediate build
> issues, but I would really really like to fix the real problem, and
> allow us to generate this .gitignore file in the output directory.

Same, hopefully we can get these issues worked out and try again :)

Thanks,
Brandon

>
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
