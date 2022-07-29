Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E40C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 09:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9634383E01;
	Fri, 29 Jul 2022 09:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9634383E01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QkVEZMGXhbGI; Fri, 29 Jul 2022 09:34:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE19481B98;
	Fri, 29 Jul 2022 09:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE19481B98
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D4561BF339
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 09:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7418E40CDC
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 09:34:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7418E40CDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LRFaAge6Owej for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 09:34:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7455A40CD7
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7455A40CD7
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 09:34:08 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id 2F881BDE985D;
 Fri, 29 Jul 2022 11:34:05 +0200 (CEST)
MIME-Version: 1.0
Date: Fri, 29 Jul 2022 09:34:04 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
In-Reply-To: <20220729091323.2933595-1-br015@umbiko.net>
References: <46b4d64c-1779-bcaf-3fdf-05f33b341c9a@mind.be>
 <20220729091323.2933595-1-br015@umbiko.net>
Message-ID: <c6f3ec148d970e153067ae6a8ee567e9@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.6 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH 1/1] package/zziplib: create symlinks only
 if target is missing
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
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?Q?J=C3=B6rg_Krause?= <joerg.krause@embedded.rocks>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sorry, there is a typo in the CMake code, I have to redo this. Change is 
marked as "Changes requested"

Kind regards,
Andreas


On 2022-07-29 09:13, Andreas Ziegler wrote:
> Symlink creation should only happen for versioned libraries. Modify 
> CMake
> rules to prevent overwriting existing libraties with recursive links.
> 
> Fixes the following autobuild failures:
> http://autobuild.buildroot.net/results/dd1/dd1974dbc1a22a96a3cedb117417e66119821514/
> http://autobuild.buildroot.net/results/df8/df8406402ccff7cec34ae5858b8da57d1a4ae9c1/
> http://autobuild.buildroot.net/results/743/7433a2ad111e2f014c81f196d3d1e2f63dffa858/
> http://autobuild.buildroot.net/results/79f/79f88e9ec14cda7d07cf689eee864791ba949892/
> ...
> http://autobuild.buildroot.net/results/892/8922efbbbfe79e8286a411acce4086b5c77c57c0/
> http://autobuild.buildroot.net/results/dfa/dfa8ade3a4c1750e6dd58e652f60af2a44f80dd8/
> http://autobuild.buildroot.net/results/9cd/9cd4147486f32d642513ba14efca3a02d5745ab9/
> 
> Regression test cases:
> http://autobuild.buildroot.net/results/ba7/ba711034c0abe980f677e26de41739223e2f66e9/
> http://autobuild.buildroot.net/results/032/032aaff121fb114f388c67dbca3ad2b02f670e38/
> http://autobuild.buildroot.net/results/6c5/6c56b645a2b723920f07b98474452824fba5e2c1/
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>
> ---
>  ...reate-symlinks-only-if-target-is-mis.patch | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644
> package/zziplib/0002-ZZIP_LIBLATEST-create-symlinks-only-if-target-is-mis.patch
> 
> diff --git
> a/package/zziplib/0002-ZZIP_LIBLATEST-create-symlinks-only-if-target-is-mis.patch
> b/package/zziplib/0002-ZZIP_LIBLATEST-create-symlinks-only-if-target-is-mis.patch
> new file mode 100644
> index 0000000000..25f9808b8c
> --- /dev/null
> +++
> b/package/zziplib/0002-ZZIP_LIBLATEST-create-symlinks-only-if-target-is-mis.patch
> @@ -0,0 +1,59 @@
> +From 2b94e8dcc58696f23be07888913eddaa035273d8 Mon Sep 17 00:00:00 2001
> +From: Andreas Ziegler <br015@umbiko.net>
> +Date: Fri, 29 Jul 2022 10:29:29 +0200
> +Subject: [PATCH] ZZIP_LIBLATEST: create symlinks only if target is 
> missing
> +
> +Signed-off-by: Andreas Ziegler <br015@umbiko.net>
> +---
> + zzip/CMakeLists.txt | 18 +++++++++++++++---
> + 1 file changed, 15 insertions(+), 3 deletions(-)
> +
> +diff --git a/zzip/CMakeLists.txt b/zzip/CMakeLists.txt
> +index 4fa6b9c..fe20dd6 100644
> +--- a/zzip/CMakeLists.txt
> ++++ b/zzip/CMakeLists.txt
> +@@ -350,8 +350,12 @@ if(ZZIP_LIBLATEST)
> +   endif()
> +     get_target_property(libname libzzip OUTPUT_NAME)
> +     get_target_property(librelease libzzip RELEASE_POSTFIX)
> ++    set(libzzip_target "${lib}${libname}${dll}")
> ++    add_custom_command(OUTPUT ${libzzip_target}
> ++        COMMAND ${CMAKE_COMMAND} -E create_symlink
> $<TARGET_FILE_NAME:libzzip> ${libzzip_target}
> ++        )
> +     add_custom_target(libzzip_latest ALL
> +-        COMMAND ${CMAKE_COMMAND} -E create_symlink
> $<TARGET_FILE_NAME:libzzip> ${lib}${libname}${dll}
> ++        DEPENDS ${libzzip_target}
> +         )
> +     install(FILES
> +         ${outdir}/${lib}${libname}${dll}
> +@@ -359,8 +363,12 @@ if(ZZIP_LIBLATEST)
> +     if(ZZIPFSEEKO)
> +     get_target_property(libname libzzipfseeko OUTPUT_NAME)
> +     get_target_property(librelease libzzipfseeko RELEASE_POSTFIX)
> ++    set(libzzipfseeko_target "${lib}${libname}${dll}")
> ++    add_custom_command(OUTPUT ${libzzipfseeko_target}
> ++        COMMAND ${CMAKE_COMMAND} -E create_symlink
> $<TARGET_FILE_NAME:libzzip> ${libzzipfseeko_target}
> ++        )
> +     add_custom_target(libzzipfseeko_latest ALL
> +-        COMMAND ${CMAKE_COMMAND} -E create_symlink
> $<TARGET_FILE_NAME:libzzipfseeko> ${lib}${libname}${dll}
> ++        DEPENDS ${libzzipfseeko_target}
> +         )
> +     install(FILES
> +         ${outdir}/${lib}${libname}${dll}
> +@@ -369,8 +377,12 @@ if(ZZIP_LIBLATEST)
> +     if(ZZIPMMAPPED)
> +     get_target_property(libname libzzipmmapped OUTPUT_NAME)
> +     get_target_property(librelease libzzipmmapped RELEASE_POSTFIX)
> ++    set(libzzipmmaped_target "${lib}${libname}${dll}")
> ++    add_custom_command(OUTPUT ${libzzipmmaped_target}
> ++        COMMAND ${CMAKE_COMMAND} -E create_symlink
> $<TARGET_FILE_NAME:libzzip> ${libzzipmmaped_target}
> ++        )
> +     add_custom_target(libzzipmmaped_latest ALL
> +-        COMMAND ${CMAKE_COMMAND} -E create_symlink
> $<TARGET_FILE_NAME:libzzipmmapped> ${lib}${libname}${dll}
> ++        DEPENDS ${libzzipmmaped_target}
> +         )
> +     install(FILES
> +         ${outdir}/${lib}${libname}${dll}
> +--
> +2.34.1
> +
> --
> 2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
