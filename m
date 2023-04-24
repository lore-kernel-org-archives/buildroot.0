Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930D5C7618E
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 20:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F102860C17;
	Mon, 24 Apr 2023 20:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F102860C17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 02fTusry5lYn; Mon, 24 Apr 2023 20:50:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EE1160C0F;
	Mon, 24 Apr 2023 20:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EE1160C0F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E8EC1BF476
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 279FF81FB2
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:50:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 279FF81FB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EI0fZz7B8UBp for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 20:50:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C37CD81E2E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C37CD81E2E
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 20:50:07 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.29]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2V0B-1qI1bE3ikp-013yKA; Mon, 24
 Apr 2023 22:49:59 +0200
Date: Mon, 24 Apr 2023 22:49:58 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20230424224958.43da8112@gmx.net>
In-Reply-To: <20230424202514.1546092-2-aduskett@gmail.com>
References: <20230424202514.1546092-1-aduskett@gmail.com>
 <20230424202514.1546092-2-aduskett@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:VrZpA/3i3CjvQmrvZAQJ71Ms2nMaN5KfZcZe9jxrB5tw6CIbFdG
 fp3F0zwk7TXGCIjSsANRFYVHB0LsbCw8UeHQrYBCd4jAUqaZ/TaASpcwNwsNeoHUF53RN08
 rFRGQsEs+N7VLXfUWSkpUH91nkd3LNQ1BTUAgV9RhoLT0vRqygfDpSLBYNDNOPPbCFtwZJp
 QGFehIjthLkMhpO5fSEkA==
UI-OutboundReport: notjunk:1;M01:P0:PF+/8eZtTjg=;XO3OwC/BucaQ5JFAzUn+4a5W3u9
 dOGlzUz24QwZdnBUhFj5iqX9fP0qsq/NGDhnsihmhrCydODIbdP35tT1hH2EA5COXUvnZz8MA
 lAIHOErOK6/QTXYQI2trgRnQoB+oOugknh3scm6wuucZoEdIu3tKF4J9qRMgL6TfaxilSEef0
 BHmI0ikP/RGpXh/gg038KPfVFobm51NQCZ94k4bn+Jl/oh/Y2+73KWsdERnJziTD6uJq9FiYR
 I44u1gpwHz1SmMGVtCjxVe8f04hB5QhAWtzj0PizBCBkUUzNXVXa5/hk3kvZli6fHaYnNbT2m
 7TPOnTGz9R8QZkK6RWICEd6Rop18kA1b2mdnnZopq/4fGrSMiwDJgNgkxDgqMJvoVDSUZOsGH
 q7oCdD9UPm9ZsXQbJ8/63KomBirvTIuclmED12EZzKyybN7CAsJ/y9DnIc/To8kFjHOsMRO1V
 Ib7+P1sTRxGD67K7IqyONzjUcuzOd9ESnPOvjRs4W9E6rb76gsi0PrZODBvYb8mbPjt0AwfFI
 x3cHnDM5VZUYPfDz0f6pu5Uhx7n3qRDFi5uC43jDXqrhQEhRePlJrTTOLv1hKtw6xzW7wRtvh
 mQDsDLoy3l0Lw34nuGvTyfL+j6I2rdc9E4a0csxyBF8/YyojKql0Gnnqwh6cuO/GXUeBusYH4
 GhC/wuQSxd0Xa14jYPmRPLsSzJ6CuC9HwW+2FWXWT9IPR4oGna+VukwbJ//JHukkBY44dN/jf
 fm4d7pSBqvMBI444TM91npYQLPC2aBSJNNJWcSiJd2+rrRh4mVvXG4L9KdZpmT1u9PFmATPxz
 xIk1f3wwhXXl0D7sxV+nHhFxlnv/OdXHIgHT2/tegJwQ0DY7Ogipaq/qIshRQDozPCyLr2fhn
 cf5ENYJ/5jBYFggc0vuZHad2vGd1CEmkOI7CoOTatR6WRnyzShAfnxJ1EBpe9kngTCtxugzMV
 RnUKkQoeDRSWWdVvrT75xU7CYXM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1682369400; i=ps.report@gmx.net;
 bh=JDXSUPYomV/kh0HjV0H7xFh/i+nsfEqDQkAyx5Ex99A=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=lAMbX+L8daCXCkvgSWrJhOaBs2L+2x3JZxsbIhJSAaX4YuuqvlCP8WHLVFLOpuN+A
 3ymctrI+v9Wgbtx1RYK5FbkjTo8vLxJ04AIOwc+z1doewUGAVF3oNUlozsjkNsU0Es
 3rrm79TsN4dS2t2V/ZUzkVMj8OfkJdCIwfY1ecsGK5Gyio6/9LNRz4wlvFLHKq2cnS
 io+GuXPZTGEkirTxxJj45q+bUWvgdiE2vQ3urCef5o0c4gOTM35h7Icr+WyqTERnOR
 g3D44KUi3KYGnZ4d1C+H2VQpD17rYawPG//uf7A3YoQb0nW1VbLG+YfCT7Nsfo17Id
 cNXR3X+MUoT1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=lAMbX+L8
Subject: Re: [Buildroot] [PATCH 01/13]
 package/libglib2/0003-disable-building-docs.patch
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

On Mon, 24 Apr 2023 13:25:02 -0700, Adam Duskett <aduskett@gmail.com> wrote:

> If rst2html5 is installed on a host system, meson will attempt to build
> html5 documentation from the docs directory, resulting in the following
> error:
>
> /usr/local/bin/rst2html5.py
> Traceback (most recent call last):
>   File "/usr/local/bin/rst2html5.py", line 27, in <module>
>     from docutils.core import publish_cmdline, default_description
> ModuleNotFoundError: No module named 'docutils'
>
> Since we don't need, nor want to build the documentation, remove the docs
> subdirectory from being built entirely.
>
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  .../libglib2/0003-disable-building-docs.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/libglib2/0003-disable-building-docs.patch
>
> diff --git a/package/libglib2/0003-disable-building-docs.patch b/package/libglib2/0003-disable-building-docs.patch
> new file mode 100644
> index 0000000000..27a540bf61
> --- /dev/null
> +++ b/package/libglib2/0003-disable-building-docs.patch
> @@ -0,0 +1,38 @@
> +From f3b8515471aaa452f06d84da68372fcead8637d2 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <aduskett@gmail.com>
> +Date: Mon, 24 Apr 2023 11:52:24 -0700
> +Subject: [PATCH 1/1] disable building docs
> +
> +If rst2html5 is installed on a host system, meson will attempt to build
> +html5 documentation from the docs directory, resulting in the following
> +error:
> +
> +/usr/local/bin/rst2html5.py
> +Traceback (most recent call last):
> +  File "/usr/local/bin/rst2html5.py", line 27, in <module>
> +    from docutils.core import publish_cmdline, default_description
> +ModuleNotFoundError: No module named 'docutils'
> +
> +Since we don't need, nor want to build the documentation, remove the docs
> +subdirectory from being built entirely.
> +
> +Signed-off-by: Adam Duskett <aduskett@gmail.com>
> +---
> + meson.build | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 0cbc968..28e1147 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -2442,7 +2442,6 @@ if get_option('man')
> + endif
> +
> + gnome = import('gnome')
> +-subdir('docs/reference')

As far as I read the meson.build files all actions in docs/reference
are protected by the options 'gtk_doc' or 'man', is disabling this
ones not enough?

Regards,
Peter

> +
> + summary({
> +   'host cpu' : host_machine.cpu_family(),
> +--
> +2.40.0
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
