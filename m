Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A9AC3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 17:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62DC16059B;
	Fri, 26 Jul 2024 17:03:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wag-Z4Hy-KSe; Fri, 26 Jul 2024 17:03:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62FFD605D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62FFD605D7;
	Fri, 26 Jul 2024 17:03:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C6AE81BF860
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 17:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE98C40CAB
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 17:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MM2HIeVBj5XT for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 17:03:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6E02D40285
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E02D40285
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E02D40285
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 17:03:33 +0000 (UTC)
Received: from pps.filterd (m0346902.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46QGpoOe015673; Fri, 26 Jul 2024 17:03:32 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40mfpqr3pb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jul 2024 17:03:31 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46QH3U9l011540
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jul 2024 17:03:30 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46QH3TUW023546
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 26 Jul 2024 17:03:30 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 9A01D300049E;
 Fri, 26 Jul 2024 12:03:29 -0500 (CDT)
Mime-Version: 1.0
Date: Fri, 26 Jul 2024 17:03:29 +0000
Message-Id: <D2ZMT39VEGGC.MPRGW26K8LD2@collins.com>
To: "Fiona Klute" <fiona.klute@gmx.de>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240726160152.2182074-1-fiona.klute@gmx.de>
In-Reply-To: <20240726160152.2182074-1-fiona.klute@gmx.de>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_12,2024-07-26_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_12,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407260114
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407260114
X-Proofpoint-ORIG-GUID: Q8vm9rUPScXAuf4zcekGaLnVwJGbn442
X-Proofpoint-GUID: Q8vm9rUPScXAuf4zcekGaLnVwJGbn442
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_12,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 adultscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407260114
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; 
 h=content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=QRDrszUTfqGJENwH5xaj9dTK1qwLgr8Lb6ff8jNgyZY=;
 b=PTHpTqBy07j4+oZ/GV4F1WFeaMVM5nLVjqizPh8So96VaPNtaKtpKgRR836TVBGNweEq
 HcaoFiuXQRz/0OmB+gRC3cHMH5AhkJE4lcFun3SLh8VvqVpPjSEK7LvqBT5+Vt8cRQcI
 kKWdoPYzB0mSEi/BRmUihiz5Auc4FEjn+W8vTHgOlkQsOklrpF9fjxOAViLunhWddt19
 vz0kpvzrDbnWQeyzZDxez4jK75jnHHJVfPMRhSMkGg3CWwvBJVa/4dHakj4SIpWdpv0a
 An8wF3T1ZV0rE9XzQ11ccsL2DECIFCLJL2AVcFKjDSiw0MxPmCm+EuiEcbzLnaWsNhuB lw== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=PTHpTqBy
Subject: Re: [Buildroot] [PATCH 1/1] package/busybox: fix menuconfig with
 GCC 14
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fiona,

On Fri Jul 26, 2024 at 4:01 PM UTC, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>
> GCC 14 errors out on the implicit return type of "main() {}". The
> patch also removes the /dev/null redirection of GCC stderr that hid
> the actual problem.

I tested this on my Fedora 40 machine, look good!

Reviewed-by: Brandon Maier <brandon.maier@collins.com>
Tested-by: Brandon Maier <brandon.maier@collins.com>

Thanks,
Brandon

>
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
>  ...-failing-saying-ncurses-is-not-found.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch
>
> diff --git a/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch b/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch
> new file mode 100644
> index 0000000000..7b78c01984
> --- /dev/null
> +++ b/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch
> @@ -0,0 +1,38 @@
> +From ctxnop@gmail.com  Sun Jul 21 12:10:52 2024
> +From: ctxnop@gmail.com (Nop)
> +Date: Sun, 21 Jul 2024 14:10:52 +0200
> +Subject: [PATCH] menuconfig: GCC failing saying ncurses is not found
> +
> +Newer GCC increased diagnostics levels resulting in considering the
> +test code to be invalid. The resulting message was misleading, saying
> +that ncurses was not found, while the check failed for an unrelated
> +reason which was hidden because GCC stderr was redirected to
> +/dev/null.
> +
> +Signed-off-by: ctxnop <ctxnop@gmail.com>
> +Upstream: http://lists.busybox.net/pipermail/busybox/2024-July/090840.html
> +[Fiona: rephrased commit message for clarity]
> +Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> +---
> + scripts/kconfig/lxdialog/check-lxdialog.sh | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh
> +b/scripts/kconfig/lxdialog/check-lxdialog.sh
> +index 5075ebf2d..c644d1d48 100755
> +--- a/scripts/kconfig/lxdialog/check-lxdialog.sh
> ++++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
> +@@ -45,9 +45,9 @@ trap "rm -f $tmp" 0 1 2 3 15
> +
> + # Check if we can link to ncurses
> + check() {
> +-        $cc -x c - -o $tmp 2>/dev/null <<'EOF'
> ++	$cc -x c - -o $tmp <<'EOF'
> + #include CURSES_LOC
> +-main() {}
> ++int main() { return 0; }
> + EOF
> + 	if [ $? != 0 ]; then
> + 	    echo " *** Unable to find the ncurses libraries or the"       1>&2
> +--
> +2.45.2
> --
> 2.45.2
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
