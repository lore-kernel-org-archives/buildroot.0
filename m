Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F7CC2BA15
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 20:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD0A2402CE;
	Tue, 18 Jun 2024 20:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XC3k2KsmCH5E; Tue, 18 Jun 2024 20:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DB51402D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DB51402D6;
	Tue, 18 Jun 2024 20:30:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D3181BF4DD
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 20:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2963C402D6
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 20:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cLpnBtbvWmVY for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 20:30:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CA8A4402CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA8A4402CE
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA8A4402CE
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 20:30:39 +0000 (UTC)
Received: from pps.filterd (m0346901.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 45IHEojF020275; Tue, 18 Jun 2024 20:30:33 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3yucqu3vh3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jun 2024 20:30:32 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IKUVOc031336
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jun 2024 20:30:31 GMT
Received: from crulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45IKUV3n015469
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 18 Jun 2024 20:30:31 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by crulimr02.rockwellcollins.com (Postfix) with ESMTP id E27A1300631C;
 Tue, 18 Jun 2024 15:30:30 -0500 (CDT)
Date: Tue, 18 Jun 2024 20:30:30 +0000
To: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@rtone.fr>
Message-ID: <ZnHuZvpbeTN-bKVC@bspbox.kirk>
Mail-Followup-To: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@rtone.fr>,
 buildroot@buildroot.org,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>,
 Athaariq Ardhiansyah <foss@athaariq.my.id>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
References: <20240607071359.767329-1-gael.portay@rtone.fr>
 <20240607071359.767329-3-gael.portay@rtone.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240607071359.767329-3-gael.portay@rtone.fr>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_03,2024-06-17_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_03,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406180151
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406180150
X-Proofpoint-ORIG-GUID: 0aOhyPAZ-vyAB9uqv4GrR33Pyy0W7Kjd
X-Proofpoint-GUID: 0aOhyPAZ-vyAB9uqv4GrR33Pyy0W7Kjd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_03,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406180150
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=mzY/dGjfc9YiAomQD3hHuatJ+/bEMiwo74WYdBRB030=;
 b=RpQs9zUjsJ/uyFxb/PaEmv/m74Ebqtqv47Rvylz8JHzM9b1BvVOMuJJYMsfoaDvjo+b9
 OTInjLPfB4SXc3jbTwc/ldscVcgHIamguLe9Er2hJ7XhgEiLMrxdb/ntoY+7yFuyJqTF
 4bKPxOt0MEbAUgYCFEUNHjmUy2S12In0hJg+7pH2U0KOC0sNTX+IDUQrE7b3/8SuPiYs
 1P+NA+GYii6cN0rjMx7mMszCbr/DPwAGbVz8lq4ikWncf3/qRI2LQ7ncG4Ii/oDsW2YV
 RyNWAd/DJDHxakjI6Nvq51Kxe8bbGQ2i0/lzrM9m+XUhWhXn1XzNus2lmu/vdEP5yfxs iw== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=RpQs9zUj
Subject: Re: [Buildroot] [next v2 2/2] package/rpi-firmware: bump version to
 5476720
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>, Athaariq Ardhiansyah <foss@athaariq.my.id>,
 buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Ga=EBl,

On 2024.06.07 09:13, Ga=EBl PORTAY wrote:
> Version 5476720 match the with kernel 6.6.28.
> =

> Signed-off-by: Ga=EBl PORTAY <gael.portay@rtone.fr>

Boot tested on a rpi2

Reviewed-by: Brandon Maier <brandon.maier@collins.com>
Tested-by: Brandon Maier <brandon.maier@collins.com>

> ---
>  package/rpi-firmware/rpi-firmware.hash | 2 +-
>  package/rpi-firmware/rpi-firmware.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmwar=
e/rpi-firmware.hash
> index 33e05a2f4a..4501db739c 100644
> --- a/package/rpi-firmware/rpi-firmware.hash
> +++ b/package/rpi-firmware/rpi-firmware.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  dd43e77ca1a8969cdb7f05dd72a57f90862071d5a93bdd6aea8246aba85689cf=
  rpi-firmware-83dafbc92c0e63f76ca2ecdd42462d56489d1c77.tar.gz
> +sha256  00fe5487376e9d5ed14cbc72a9b7a5bd8d6900c84aee10f6d656f192a26d161c=
  rpi-firmware-5476720d52cf579dc1627715262b30ba1242525e.tar.gz
>  sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b=
  boot/LICENCE.broadcom
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/=
rpi-firmware.mk
> index 11177aee02..7ae9ff6c28 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -4,7 +4,7 @@
>  #
>  ########################################################################=
########
>  =

> -RPI_FIRMWARE_VERSION =3D 83dafbc92c0e63f76ca2ecdd42462d56489d1c77
> +RPI_FIRMWARE_VERSION =3D 5476720d52cf579dc1627715262b30ba1242525e
>  RPI_FIRMWARE_SITE =3D $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_=
VERSION))
>  RPI_FIRMWARE_LICENSE =3D BSD-3-Clause
>  RPI_FIRMWARE_LICENSE_FILES =3D boot/LICENCE.broadcom
> -- =

> 2.45.2
> =

> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
