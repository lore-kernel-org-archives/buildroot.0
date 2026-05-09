Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCF0CD3447
	for <buildroot@archiver.kernel.org>; Sat,  9 May 2026 07:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07F5B6F4BA;
	Sat,  9 May 2026 07:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x8IA3AZn2jhl; Sat,  9 May 2026 07:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26BCA6F52F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778310075;
	bh=Gl6md4+7iESArms4U53V6P/6NUlXcJb992McZRWGpec=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jSleXbdtMHtzBjr5MtH4Pnu1zRvV0DD0i8q6oU64zxI7FYvuIOTABq5hniZQ9cdPP
	 5yWbJ/xax0s8zRrdOEuxUXFMji2BTU3fuxBElHtjbEbo8ir6FlOo53Y2ptYeVIx7Bo
	 sFo8BoRk4H5IfryTORvpPT6gbq9RY8CPM6RwAe87WtQB4NoV6RBNV+gbohu3GQzDvt
	 ooI5T2WYhtDkYwzIEiCMVJxiegvZauY9VSEB3x5P9RemNGGQuBqpWeLwdop5ZRtsgJ
	 wNlEkP18+dZdCuidoAG5PQ7NlTyxbhFM1vi7EjszBG/sTPzSTWor5kJfNOAGUJzq24
	 L5eVULk4chncA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26BCA6F52F;
	Sat,  9 May 2026 07:01:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EF2AB25B
 for <buildroot@buildroot.org>; Sat,  9 May 2026 07:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBFB340556
 for <buildroot@buildroot.org>; Sat,  9 May 2026 07:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bPceI7K4Wqls for <buildroot@buildroot.org>;
 Sat,  9 May 2026 07:01:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 31F394020B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31F394020B
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31F394020B
 for <buildroot@uclibc.org>; Sat,  9 May 2026 07:01:11 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1wLbgT-000298-Dj
 for buildroot@uclibc.org; Sat, 09 May 2026 09:01:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sat, 09 May 2026 09:00:04 +0200
Message-ID: <pan$51872$1013c278$a74b50e3$2f703bba@ID-313208.user.individual.net>
References: <69fea782.050a0220.8af99.ac9e__38452.1139830881$1778296731$gmane$org@mx.google.com>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: [Buildroot] Analysis of build errors,
 was: Re: [autobuild.buildroot.org] Daily results for 2026-05-08
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

Hi,

for some of the most often occuring build errors we have patches:

Am Sat, 09 May 2026 03:18:26 -0000 schrieb Buildroot Notifications:

> Classification of failures by reason for master
> -----------------------------------------------
> 
> odhcp6c-f19dd37fb467c9cf10c... | 7

https://patchwork.ozlabs.org/project/buildroot/list/?series=499255

>                      kbd-2.9.0 | 5
>                        unknown | 5
>                    perl-5.42.2 | 4
>              util-linux-2.41.4 | 4

https://patchwork.ozlabs.org/project/buildroot/list/?series=501521

>               dropbear-2026.90 | 3
>                    i2pd-2.59.0 | 3
>              libgphoto2-2.5.33 | 3
>                    linux-7.0.4 | 3

https://patchwork.ozlabs.org/project/buildroot/list/?series=487932

>                linux-pam-1.7.2 | 3
>                    ccrypt-1.11 | 2
>             gdk-pixbuf-2.42.12 | 2
> glibc-2.43-22-g8362e8ce10b2... | 2

fails only on hppa, no upstream fix in sight, what about reverting
1822f07e94951c5a37f78c1009d54fc95d01d39c?

>       libabseil-cpp-20260107.1 | 2
>              libblockdev-3.5.0 | 2
>                   libnfs-6.0.2 | 2
>               libsecret-0.20.5 | 2
>                    linux-tools | 2
>                 openssh-10.3p1 | 2
> phidgetwebservice-2.1.9.201... | 2

https://patchwork.ozlabs.org/project/buildroot/list/?series=501536

>                pulseaudio-17.0 | 2
>                  systemd-258.7 | 2
>           aardvark-dns-v1.17.0 | 1
>                   brotli-1.2.0 | 1
>                   cairo-1.18.4 | 1

https://patchwork.ozlabs.org/project/buildroot/list/?series=487004

>              dahdi-linux-3.3.0 | 1

https://patchwork.ozlabs.org/project/buildroot/list/?series=491188

>                    dante-1.4.4 | 1
>               e2fsprogs-1.47.4 | 1
>         edk2-edk2-stable202602 | 1
>                  empty-0.6.23d | 1
>             erofs-utils-1.8.10 | 1

https://patchwork.ozlabs.org/project/buildroot/list/?series=488695

>               fluent-bit-4.2.0 | 1
>   gobject-introspection-1.84.0 | 1
>                    guile-3.0.9 | 1
> host-am335x-pru-package-5f3... | 1
>     host-mender-artifact-4.2.0 | 1
>             host-protobuf-34.1 | 1 igd2-for-linux-2.2 | 1
>                  libavif-1.4.1 | 1
> libdill-32d0e8b733416208e04... | 1

https://patchwork.ozlabs.org/project/buildroot/list/?series=486915

>            libmicrohttpd-1.0.5 | 1

https://patchwork.ozlabs.org/project/buildroot/list/?series=501721

>                 libnss-3.123.1 | 1 libsoup3-3.6.6 | 1
>                  libzlib-1.3.2 | 1 linux-headers | 1
>                     lua-ev-1.5 | 1
>               luabitop-1.0.2-1 | 1
>                  mdevd-0.1.6.5 | 1
>             minizip-zlib-1.3.1 | 1

https://patchwork.ozlabs.org/project/buildroot/list/?series=494836

>                        mrp-1.2 | 1

https://patchwork.ozlabs.org/project/buildroot/list/?series=488778

>                  nettle-3.10.2 | 1
>                   ntp-4.2.8p18 | 1
>                openblas-0.3.32 | 1
>              parsec-tool-0.7.0 | 1
>       passt-2025_06_11.0293c6f | 1
>         perl-xml-libxml-2.0134 | 1
>                     polkit-126 | 1
>            python-html5lib-1.1 | 1
>               python-xlib-0.33 | 1
>          s6-linux-init-1.1.2.1 | 1
>                   stunnel-5.78 | 1
>               tailscale-1.78.1 | 1
>                tcf-agent-1.8.0 | 1
> uhttpd-15346de8d3ba42200249... | 1

https://patchwork.ozlabs.org/project/buildroot/list/?series=491243

> ustream-ssl-5a81c108d20e247... | 1

https://patchwork.ozlabs.org/project/buildroot/list/?series=487882

>                valgrind-3.26.0 | 1
>             vorbis-tools-1.4.3 | 1

https://patchwork.ozlabs.org/project/buildroot/list/?series=488770

>                  weston-15.0.0 | 1
> x264-baee400fa9ced6f5481a72... | 1

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
