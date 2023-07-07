Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F4FEB64DA
	for <buildroot@archiver.kernel.org>; Fri,  7 Jul 2023 14:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 071BB81E7C;
	Fri,  7 Jul 2023 14:26:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 071BB81E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hj1C15JJz_Fa; Fri,  7 Jul 2023 14:26:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3642A81E58;
	Fri,  7 Jul 2023 14:26:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3642A81E58
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B67CE1BF3C3
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 14:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90F5E611F6
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 14:26:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90F5E611F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LAlf9XZYb4sD for <buildroot@lists.busybox.net>;
 Fri,  7 Jul 2023 14:26:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0F6C611F4
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0F6C611F4
 for <buildroot@buildroot.org>; Fri,  7 Jul 2023 14:26:44 +0000 (UTC)
Received: from pwmachine.localnet (85-170-34-233.rev.numericable.fr
 [85.170.34.233])
 by linux.microsoft.com (Postfix) with ESMTPSA id C5BB120AECBD;
 Fri,  7 Jul 2023 07:26:42 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C5BB120AECBD
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Fri, 07 Jul 2023 16:26:40 +0200
Message-ID: <2689140.mvXUDI8C0e@pwmachine>
In-Reply-To: <20230428152211.20394-1-flaniel@linux.microsoft.com>
References: <20230428152211.20394-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1688740003;
 bh=agqIISs4Mk0qvaRsO0EKtt9Mk8lxDLeo+41RS8QsOL8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MpupwCJflFRNTEEdXSinzCCst7mYfEZrbOi9An0S3zMYP9dMEYXWAxp3PkPDqWRAj
 co2xmi//Mb1FwGfIHAao1CeM5sCIhpOyr/Xro5lv60ir948EKlB1Tbp056uVGAwqzF
 R9V1DqYKtrr02/Gb4RmSgmCfocpxYSTXZ06d9cvA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=MpupwCJf
Subject: Re: [Buildroot] [RFC PATCH v1 0/2] Bump sysdig and falco libs
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi.

Le vendredi 28 avril 2023, 17:22:09 CEST Francis Laniel a =E9crit :
> Hi.
> =

> =

> With this contribution, I bumped sysdig and falcosecurity-libs.
> Sadly, I am not fully satisfied with the result, hence the fact I marked =
it
> as RFC because I would like to get your feedback to make it better.
> =

> First of all, sysdig builds and runs:
> Welcome to Buildroot
> buildroot login: root
> # sysdig --version
> sysdig version 0.31.4
> # sysdig | head
> scap: loading out-of-tree module taints kernel.
> scap: driver loading, scap
> scap: adding new consumer (____ptrval____)
> scap: initializing ring buffer for CPU 0
> scap: CPU buffer initialized, size=3D8388608
> 26 15:12:28.226519423 0 sysdig (108) > switch next=3D0 pgft_maj=3D10
> pgft_min=3D1348 vm_size=3D47288 vm_rss=3D19408 vm_swap=3D0 27 15:12:28.22=
7409149 0
> <NA> (0) > switch next=3D13 pgft_maj=3D0 pgft_min=3D0 vm_size=3D0 vm_rss=
=3D0
> vm_swap=3D0 ...
> =

> Nonetheless, I had to increase the minimal size of the image as libsinsp.a
> is quite big:
> # du -sh /sysdig/libsinsp.a
> 152.7M  /sysdig/libsinsp.a
> I am not forcefully sure where this library is used, I will investigate a=
nd
> maybe we can run everything without it.
> =

> Secondly, I had to tweak heavily the libscap CMakeLists.txt to install
> several shared libraries.
> Indeed, the libraries are compiled as static, but the sysdig binary is not
> static, so it needs plenty of shared libraries to be run from the image.
> I am not really sure what is the best solution here (either compiling sys=
dig
> as static or not), but in any case my patch for CMakeLists.txt is not
> really clean.
> =

> Finally, I had to modify the magical number in falcosecurity-libs.mk for
> API_VERSION and SCHEMA_VERSION.
> While this is not really a big pain, I am wondering if this is not possib=
le
> to read the corresponding values from the corresponding files (i.e.
> API_VERSION and SCHEMA_VERSION).
> So, for future update we would not need to take care of it ourselves.
> =

> Francis Laniel (2):
>   package/sysdig: bump to version 0.31.4
>   package/falcosecurity-libs: bump to version 0.10.5
> =

>  .../0002-cmake-Install-shared-libraries.patch | 61 +++++++++++++++++++
>  .../falcosecurity-libs.hash                   |  2 +-
>  .../falcosecurity-libs/falcosecurity-libs.mk  | 12 ++--
>  ...BUNDLED_DEPS-before-getting-nlohmann.patch | 52 ----------------
>  package/sysdig/sysdig.hash                    |  2 +-
>  package/sysdig/sysdig.mk                      |  8 ++-
>  6 files changed, 77 insertions(+), 60 deletions(-)
>  create mode 100644
> package/falcosecurity-libs/0002-cmake-Install-shared-libraries.patch dele=
te
> mode 100644
> package/sysdig/0001-cmake-Check-USE_BUNDLED_DEPS-before-getting-nlohmann.=
pa
> tch
> =

> =

> Best regards and thank you in advance for your advises.
> --
> 2.34.1


Can someone please share some feedback on this contribution?


Best regards and thank you in advance.


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
