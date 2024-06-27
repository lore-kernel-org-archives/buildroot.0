Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FB5C2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 20:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2523560E69;
	Thu, 27 Jun 2024 20:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B_cjyIoVbm4I; Thu, 27 Jun 2024 20:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A20DE60708
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A20DE60708;
	Thu, 27 Jun 2024 20:01:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE9311BF3D9
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 20:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5C0B4160A
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 20:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35uvWLY0WBNg for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 20:01:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CD41C415F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD41C415F0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD41C415F0
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 20:01:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 506A713F880;
 Thu, 27 Jun 2024 22:01:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 27 Jun 2024 22:01:33 +0200
Date: Thu, 27 Jun 2024 22:01:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <Zn3FHQXZ6atQbeeZ@landeda>
References: <e2b3835bcee63a27b24a757a2db3e9103faebc63.1719316003.git.yann.morin@orange.com>
 <CABGWkvobc38thMwekt0fsHefa6QSADKdemyZ9Mj84EgYB6UbXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABGWkvobc38thMwekt0fsHefa6QSADKdemyZ9Mj84EgYB6UbXQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719518496;
 bh=5thYKvmohe0LLoohwc0bR2HsjhgcHANe2DM6wDhohCs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qDWl56U4pjHyyz3WO4nZxXKXR4PSBW/oZLCAWTHq6NApENvi1sgHluwLzay55y9vm
 gxcvUpAyHgRXv0s2owo59rtaZlvpa4xZHnsy+s9ekxUY+YaGBFO9OR0JAQnZbf2+Gd
 al+DiuDO/iGU8HTssOIGc5NdUgPWSrbYYsJrW1gcZrANewm/h3QsIOpgD5We6nHCL1
 hj5KMXtcmROO0TE6qTsG2xkPun5gTThBqBuLEzLuaNuujuckJa+ELxKZQFsZdMosmm
 sLcZkC0d1nLOe+TcPBnUT4jQ8rNjmevQq0omN93nxgvk3h05wOOrsM0k0M34vtYJ09
 27F5SZCw8T6zg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qDWl56U4
Subject: Re: [Buildroot] [PATCH] package/slang: fix patch fuzz
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
Cc: yann.morin@orange.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-06-25 13:56 +0200, Dario Binacchi spake thusly:
> From: "Yann E. MORIN" <[5]yann.morin@orange.com>
> > Since commit 8f88a644ed7d (support/scripts/apply-patches.sh: set the
> > maximum fuzz factor to 0), we no longer accept fuzz in patches. Before
> > 8f88a644ed7d was applied, alot of patches were fixed in preparatory
> > commits, but slang was missed (although the patch has been present since
> > 2017.
> what configuration does contain this package?

I've devised a little script that finds almost all packages that have
patches, and test they can be downloaded and patched:

    #!/usr/bin/env bash
    export BR2_DL_DIR=$(pwd)/meh-dl
    make defconfig
    ./utils/config --set-str BR2_BACKUP_SITE ""
    # Ignore boot/ and linux/ as they are too special...
    find package/ -type f -name '*.mk' -printf '%h\n' \
    |sort -u \
    |while read dir; do
        [ -e "${dir}/Config.in" ] || continue
        ( find "${dir}" -type f -name '*.patch' -print -quit |grep -q . ) || continue
        pkg="$( basename "${dir}" )"
        [ -e "${dir}/${pkg}.mk" ] || continue
        sed -r -e '/^\$\(eval \$\((host-)?[^-]+-package\)\)$/!d; s//\1'"${pkg}"'/' "${dir}/${pkg}.mk"
    done \
    |while read pkg; do
        if ! make "${pkg}-patch"; then
            echo "${pkg}" >> fuzz.lst
        fi
    done

Them we've a bit of hand-guessing and the build log, here's what I could
conclude:

Fuzz errors:
  - cpulimit                    - crda                        - dahdi-tools
  - eigen                       - empty                       - exim
  - ficl                        - flite                       - freeradius-server
  - freerdp                     - imx-kobs                    - imx-vpu-hantro
  - gpm                         - grpc                        - haserl
  - janus-gateway               - leveldb                     - libblockdev
  - libfcgi                     - libcrypt                    - libgdiplus
  - libglfw                     - libhid                      - liblinear
  - libmad                      - libnfs                      - libsoup
  - libssh2                     - libsvg                      - libsvgtiny
  - libtheora                   - libtorrent                  - libyuv
  - clang                       - lxc                         - mediastreamer
  - memstat                     - mongrel                     - monit
  - ncmpc                       - nmap                        - nushell
  - nvidia-driver               - oatpp                       - openvmtools
  - paxtest                     - poke                        - pulseview
  - python-pybind               - qt5webkit                   - rdesktop
  - redis                       - rrdtool                     - rt-tests
  - rygel                       - sane-backends               - sdl_mixer
  - shairport-sync              - snort                       - sox
  - sunxi-mali-utgard-driver    - sylpheed                    - udpcast
  - vtun                        - wlroots                     - xdriver_xf86-video-mach64
  - xdriver_xf86-video-tdfx     - xfsprogs                    - yajl
  - ympd

Hash errors:
  - am335x-pru-package          - cgic                        - daq
  - dvb-apps                    - latencytop                  - linknx
  - linux-fusion                - lite                        - mimic
  - resiprocate                 - w_scan

Download errors:
  - aumix: 403 forbidden        - bsdiff: 403 forbidden       - dillo: 404
  - fbset: 410 Gone             - gamin: 404                  - giblib: 404
  - httping: 404                - libtorrent: 404             - live5: 404
  - lugaru: 404                 - matchbox-lib: 400 ???       - mpir: upstream DNS gone
  - qt5enginio: 404             - quagga: 404                 - racehound: 404
  - rp-pppoe: 404               - rtorrent: 404               - sysprof: 404
  - taskd: 404                  - trinity: TCP timeout        - zabbix: 404
  - xenomai: 404

Config issues:
  - aufs-util: needs a kernel

Of course, the hash, download, and config issues are not caused by the
fuzz restriction, which I still believe was a very good thing to do! :-)
Still, they may hide a few fuzz issues.

Anyway, the list is up for all to pick a package and help fix that as a
collective effort.

Bonus points for anyone that confirms the corner cases: binutils, gcc,
gdb, and a few others, which have a version choice... Or linux, which
has a conditional patch (Aha!) and a version with a patch... Of any of
the bootloaders, some of whioch have a version coice as well...

I think I'll be having a look at all the hash errors, but anyone is free
to look at them and post a patch that fixes the hash and explains the
issue...

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
