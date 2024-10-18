Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D08D30000
	for <buildroot@archiver.kernel.org>; Fri, 18 Oct 2024 12:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16F85605E3;
	Fri, 18 Oct 2024 12:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRgIUOSUlz-b; Fri, 18 Oct 2024 12:33:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45225605FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45225605FE;
	Fri, 18 Oct 2024 12:33:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A14782072
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 12:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F352817B1
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 12:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WRT8zhOoncfX for <buildroot@buildroot.org>;
 Fri, 18 Oct 2024 12:33:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B4C7B817AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4C7B817AF
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4C7B817AF
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 12:33:25 +0000 (UTC)
Received: from pps.filterd (m0346903.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I59AO7001313;
 Fri, 18 Oct 2024 12:33:22 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 42b3vrvmqx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Oct 2024 12:33:22 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.135])
 by xusxph004rp050.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 49ICXLrk032383
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Oct 2024 12:33:21 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 49ICXKSD009892
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 18 Oct 2024 12:33:21 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id B46603026D7A;
 Fri, 18 Oct 2024 07:33:20 -0500 (CDT)
Mime-Version: 1.0
Date: Fri, 18 Oct 2024 12:33:20 +0000
Message-Id: <D4YXO0EB2YTF.3Q4E8FN1YH9PB@collins.com>
To: "Bagas Sanjaya" <bagasdotme@gmail.com>, "Buildroot development"
 <buildroot@buildroot.org>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20241018043437.28475-2-bagasdotme@gmail.com>
In-Reply-To: <20241018043437.28475-2-bagasdotme@gmail.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-18_08,2024-10-17_01,2024-09-30_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-18_08,2024-10-17_01,2024-09-30_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 adultscore=0 bulkscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410180079
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410180078
X-Proofpoint-GUID: vcpW2j66k5IRmP1s8bVpi6Mj-8RnL_Mz
X-Proofpoint-ORIG-GUID: vcpW2j66k5IRmP1s8bVpi6Mj-8RnL_Mz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-18_08,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 spamscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 mlxscore=0
 clxscore=1011 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2409260000 definitions=main-2410180079
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=9puE78EvdCkTX35BAxzh0UJx0wTtWUdty08AvXebIN8=;
 b=gtQKY1UOwRRuLb6ymu8wjSshT++AgbCtPcH/vWmJUzXXv9RrYEifftfV7BxsohSmIo2M
 6WmPzTO/8oH5sgvtviTUgqAGwRHii4xP00HrFOTU45qpHsvCRCLT5cefuRM1m5YBFc0g
 +kis2IHhNEsIHmff85PwsCAaL/k74PnYYZ3Qg5H/RI09aFnH4ATJ71aoOshrBL1qs+Ob
 KrjN/YG05EHe1j9TZeNpd9Ujokd2i9gsvJsWvHXObIZiZzN8O9D2oS/HjRV9WVNEx6eA
 DBCXhCUxA9Vscb2DONLZtL0E52PAT2BrD8X4h6sTduHomV4c5gkDFeOqdxuxdA3HYr2v aA== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=gtQKY1UO
Subject: Re: [Buildroot] [PATCH] package/git: require wchar support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Hi Bagas,

On Fri Oct 18, 2024 at 4:34 AM UTC, Bagas Sanjaya wrote:
> Git version 2.47.0 fails to build on systems without wide characters support
> (e.g. uClibc-ng without BR2_TOOLCHAIN_BUILDROOT_WCHAR selected):
>
> ```
>     CC t/unit-tests/unit-test.o
> t/unit-tests/clar/clar.c: In function 'clar__assert_equal':
> t/unit-tests/clar/clar.c:767:23: error: unknown type name 'wchar_t'
>   767 |                 const wchar_t *wcs1 = va_arg(args, const wchar_t *);
>       |                       ^~~~~~~
> In file included from t/unit-tests/clar/clar.c:13:
> t/unit-tests/clar/clar.c:767:58: error: unknown type name 'wchar_t'
>   767 |                 const wchar_t *wcs1 = va_arg(args, const wchar_t *);
>       |                                                          ^~~~~~~
> t/unit-tests/clar/clar.c:768:23: error: unknown type name 'wchar_t'
>   768 |                 const wchar_t *wcs2 = va_arg(args, const wchar_t *);
>       |                       ^~~~~~~
> t/unit-tests/clar/clar.c:768:58: error: unknown type name 'wchar_t'
>   768 |                 const wchar_t *wcs2 = va_arg(args, const wchar_t *);
>       |                                                          ^~~~~~~
> t/unit-tests/clar/clar.c:769:65: warning: implicit declaration of function 'wcscmp' [-Wimplicit-function-declaration]
>   769 |                 is_equal = (!wcs1 || !wcs2) ? (wcs1 == wcs2) : !wcscmp(wcs1, wcs2);
>       |                                                                 ^~~~~~
> t/unit-tests/clar/clar.c:784:23: error: unknown type name 'wchar_t'
>   784 |                 const wchar_t *wcs1 = va_arg(args, const wchar_t *);
>       |                       ^~~~~~~
> t/unit-tests/clar/clar.c:784:58: error: unknown type name 'wchar_t'
>   784 |                 const wchar_t *wcs1 = va_arg(args, const wchar_t *);
>       |                                                          ^~~~~~~
> t/unit-tests/clar/clar.c:785:23: error: unknown type name 'wchar_t'
>   785 |                 const wchar_t *wcs2 = va_arg(args, const wchar_t *);
>       |                       ^~~~~~~
> t/unit-tests/clar/clar.c:785:58: error: unknown type name 'wchar_t'
>   785 |                 const wchar_t *wcs2 = va_arg(args, const wchar_t *);
>       |                                                          ^~~~~~~
> t/unit-tests/clar/clar.c:787:65: warning: implicit declaration of function 'wcsncmp' [-Wimplicit-function-declaration]
>   787 |                 is_equal = (!wcs1 || !wcs2) ? (wcs1 == wcs2) : !wcsncmp(wcs1, wcs2, len);
>       |                                                                 ^~~~~~~
> make[1]: *** [Makefile:2795: t/unit-tests/clar/clar.o] Error 1
> ```
>
> This is because git now imports clar unit testing framework since
> upstream commit 9b7caa2809cb (t: import the clar unit testing framework,
> 2024-09-04).
>
> From upstream discussion [1], git requires toolchains with full ISO C99
> support (including wchar). As such, depend the package on toolchain's
> wchar support (BR2_USE_WCHAR).
>
> [1]: https://lore.kernel.org/git/ZxCJqe4-rsRo1yHg@archie.me/t/#u

I sent a patch last week that did this same change! Thomas Petazzoni
reviewed it and had some comments I haven't had time to address. If you
want to address those in your patch, I'd be happy to drop mine.

Thomas comments were:

  You need to look at reverse dependencies that "select BR2_PACKAGE_GIT"
  and propagate this wchar dependency. For example package/git-crypt/
  will need it. And also the reverse dependencies of the reverse
  dependencies, if any;

  Did you look at a way of disabling building the test suite? I very
  quickly glanced through the git Makefile, and it didn't seem like
  there was such a possibility. But if there was such a possibility, it
  would be an alternative solution to the addition of the wchar
  dependency.

My patch: https://patchwork.ozlabs.org/project/buildroot/patch/20241009-git-2-47-0-wchar-v1-1-23c261a5fdc7@gmail.com/

Thanks!
Brandon Maier

>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  package/git/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/package/git/Config.in b/package/git/Config.in
> index d53921d7d5..a8ae5f59bf 100644
> --- a/package/git/Config.in
> +++ b/package/git/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_GIT
>  	bool "git"
>  	depends on BR2_USE_MMU # uses fork()
> +	depends on BR2_USE_WCHAR # clar unit test
>  	select BR2_PACKAGE_ZLIB
>  	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>  	help
> @@ -9,3 +10,7 @@ config BR2_PACKAGE_GIT
>  	  projects.
>
>  	  http://git-scm.com
> +
> +comment "git needs a toolchain w/ wchar"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR
>
> base-commit: 0ad7035fce67cbe91db9dea7d81e6a4bc0691ad1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
