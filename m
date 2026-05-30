Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D79CD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 06:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98BED61517;
	Sat, 30 May 2026 06:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aTMxK9JhrZiN; Sat, 30 May 2026 06:28:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE05C617AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780122498;
	bh=Ms15Qu431uHXNlPnO8bVls3OraMoWsdprqtk14DD0bc=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=YWUOEM2JUNDFCottOPi/lIciAWCQYy0ki1qzKWTuY4L7oLK+pefNr09fQFdvW4UDS
	 wF2t6WcpYtCYljdyGUW6Ake/mm758vJ12hUNMPZND4qMTh73b3KYPQVSxwUT0hzThc
	 a9Ff6GO4IgW5O7fJyoi8Lhv1EamfBJJ/HHBJYFGxKBDS3SGTgp9bMuY+jy1859wRKb
	 nsbpccT+9iY5hAmI3Sq/lCHxvTkOdSvwgtOvJv9fzzv9xrRjUUgcLgveLAbw1CIZDk
	 2mkwAJzPVGGGZyPrxogf5oAjg6XQCJ7jZwCFCIuP58tEMQg/CB4/hyQQ+rLoupg81t
	 ngg0qxuQk/sHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE05C617AE;
	Sat, 30 May 2026 06:28:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 47896F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 06:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 282E14263D
 for <buildroot@buildroot.org>; Sat, 30 May 2026 06:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YnIIDgJgqMn6 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 06:28:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1C8A540346
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C8A540346
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C8A540346
 for <buildroot@uclibc.org>; Sat, 30 May 2026 06:28:11 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1wTDB2-0008WR-8Y
 for buildroot@uclibc.org; Sat, 30 May 2026 08:28:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sat, 30 May 2026 08:27:04 +0200
Message-ID: <pan$16178$56b44c08$a21319fd$f79b1379@ID-313208.user.individual.net>
References: <20260501183421.2459291-1-bernd@kuhls.net>
 <20260501183421.2459291-3-bernd@kuhls.net>
 <ahoCoXu7k68axiSL__21429.6951702394$1780089650$gmane$org@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 3/5] package/stellarium: add extra downloads
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Am Fri, 29 May 2026 23:20:22 +0200 schrieb Thomas Petazzoni via buildroot:

> On Fri, May 01, 2026 at 08:34:19PM +0200, Bernd Kuhls wrote:
>> Building Stellarium includes the download of external tarballs during
>> configure.
> 
> But is this due to the bump in your PATCH 2/5, or already happening with
> the current stellarium version? I did a build of the current stellarium
> version, and a brief look at the configure step output doesn't show
> anything being downloaded.

here configure is broken:

-- Found CMake 4.3.2
[...]
-- Building Stellarium 25.4 (v25.4.0; Mode: Release)
[...]
-- CPM: Adding package md4c@0.5.2 (0.5.2)
[...]
[ 22%] Performing download step (download, verify and extract) for 'md4c-
populate'
-- Downloading...
   dst='/home/bernd/buildroot/output/build/stellarium-25.4/_deps/md4c-
subbuild/md4c-populate-prefix/src/release-0.5.2.tar.gz'
[...]
-- Using src='https://github.com/mity/md4c/archive/refs/tags/
release-0.5.2.tar.gz'
CMake Error at md4c-subbuild/md4c-populate-prefix/src/md4c-populate-stamp/
download-md4c-populate.cmake:163 (message):
  Each download failed!

    error: downloading 'https://github.com/mity/md4c/archive/refs/tags/
release-0.5.2.tar.gz' failed
          status_code: 1
          status_string: "Unsupported protocol"
          log:
          --- LOG BEGIN ---
          Protocol "https" not supported

using this defconfig

BR2_x86_64=y
BR2_x86_corei7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE=y
BR2_FORCE_HOST_BUILD=y
BR2_PACKAGE_STELLARIUM=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_XORG7=y

I will send v2 to clarify that this is an existing error and not caused by 
the version bump.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
