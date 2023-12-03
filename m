Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6255C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 11:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CDD760A8D;
	Sun,  3 Dec 2023 11:47:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CDD760A8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qmyTlC1HVQQW; Sun,  3 Dec 2023 11:47:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DF1160E6D;
	Sun,  3 Dec 2023 11:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DF1160E6D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B347F1BF36E
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 11:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CC724098A
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 11:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CC724098A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EyoajwHDZusz for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 11:47:04 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3F054089C
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 11:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3F054089C
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id 09FFB240E30;
 Sun,  3 Dec 2023 12:47:02 +0100 (CET)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix02.mail.de (Postfix) with ESMTP id E237EA00E2;
 Sun,  3 Dec 2023 12:47:01 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id C3036240C88;
 Sun,  3 Dec 2023 12:47:00 +0100 (CET)
To: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 03 Dec 2023 12:47:00 +0100
Message-ID: <23317020.6Emhk5qWAg@kilian-aisec>
In-Reply-To: <20230902094244.0251e004@windsurf>
References: <5969347.lOV4Wx5bFT@kilian-aisec>
 <7af21f66-d3c5-e42f-03e5-8a1f6b370520@mind.be>
 <20230902094244.0251e004@windsurf>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 7012
X-purgate-ID: 154282::1701604021-17E3A959-76DC0F35/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1701604021;
 bh=vviO6ZTIaRCF3uljkN9FCA8XpH/+mEKHLg1A0L580ig=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=dwQymbqmc2FRNpSK1Zjsdl8L6B4ygCLfX2mNh4eoiETfaK6DtmKqaYchAGX1TPB5+
 qHDPNRxxECPWzyUmvarBKOlkgK9gN/LT5Jao18UHH1qMB1MEPQzzISnZhw2mOeSH0W
 7OXP0bM149nmuM0ytLYC7Zlu9RJ11FDnNts3fwVqyQrgXakFqr3PhPUctzf9LJUUal
 CiRIhwH7sKrcT3HYGU6bD086P0rPcQH+8dTBL6UXuQQjV5tw/OMJtew8qi55dCaPIX
 Mmt6Kba9eGmL/sCtXTGq8C5S36QA16Q/hTIPqPXGMgvWrS4huOV71o0JUKH7AcR7Sa
 km4wyrO0SzjVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=dwQymbqm
Subject: Re: [Buildroot] Buildroot docker image
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: yann.morin.1998@free.fr, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas, Arnout and Yann,

[--SNIP--]

> Yann has been working on and off on a set of Docker images for
> Buildroot. See his branch at
> https://gitlab.com/ymorin/buildroot/-/commits/yem/dockers/. I indeed
> shared with him recently on IRC that it would be nice to have a really
> minimal image, separate from the image used in CI (which has more stuff
> enabled, most notably python3).

I agree. This would for example be useful if someone has their own out-of-tree 
customized board support and wants to setup a CI for that.

I started to try to setup a docker (please note again, that I am not very 
familiar with anything regarding docker). As Arnout suggested, I tried Alpine 
as a base. See below a patch, where I add the dockerfile to the support folder. 
It downloads dependencies, then buildroot. When running the docker it tries to 
build a board support. However, during compilation of fakeroot, it throws the 
following error:

======
libfakeroot.c:147:13: error: conflicting types for 'id_t'; have 'int'
  147 | typedef int id_t;
      |             ^~~~
In file included from /usr/include/sys/types.h:57,
                 from communicate.h:84:
/usr/include/bits/alltypes.h:240:18: note: previous declaration of 'id_t' with 
type 'id_t' {aka 'unsigned int'}
  240 | typedef unsigned id_t;
      |                  ^~~~
/bin/bash ./libtool  --tag=CC   --mode=link /usr/bin/gcc  -O2 -I/home/br-user/
buildroot/output/host/include  -L/home/br-user/buildroot/output/host/lib -Wl,-
rpath,/home/br-user/buildroot/output/host/lib -o libfakeroot_time64.la  
libfakeroot_time64_la-libfakeroot_time64.lo  -ldl
libfakeroot.c: In function 'common_setxattr':
libfakeroot.c:140:33: warning: implicit declaration of function 
'SEND_GET_XATTR'; did you mean 'SEND_GET_XATTR64'? [-Wimplicit-function-
declaration]
  140 | #define INT_SEND_GET_XATTR(a,b) SEND_GET_XATTR(a,b,_STAT_VER)
      |                                 ^~~~~~~~~~~~~~
libfakeroot.c:1717:3: note: in expansion of macro 'INT_SEND_GET_XATTR'
 1717 |   INT_SEND_GET_XATTR(st, &xattr);
      |   ^~~~~~~~~~~~~~~~~~
make[3]: *** [Makefile:686: libfakeroot.lo] Error 1
======

I tried to research this. The issue seems to be related is this patch, added 
to an openwrt repository, speaking about fixing the "conflicting types for 
'id_t'" and the "SEND_GET_XATTR: symbol not found" issue:

https://gitea.auro.re/jeltz/openwrt/commit/
a162fe9a96fc83cb890944d40dadaf1091084f98

Now I checked the current soure code used for fakeroot, an it is obtained from 
the fakeroot_1.32.1.orig.tar.gz from here: https://snapshot.debian.org/
archive/debian/20230724T160429Z/pool/main/f/fakeroot/
And indeed it seems to not contain the changes from the openwrt patch. So when 
I download this patch and put it into the package/fakeroot folder, the docker 
continues beyond building the fakeroot tool. However, it is slow and currently 
still building, so I can't yet tell, whether there are other issues. So what 
do you think? Shall we then apply this patch to the fakeroot package? If so, 
the raw fakeroot patch does not contain a "signed-off-by". Would that be a 
problem?

And of course I appreciate feedback regarding the alpine dockerfile. The 
dockerfile downloads the fakeroot patch and puts it into the fakeroot folder 
for now. See the patch below

Best regards,
Kilian

====== Patch below ======

From 7016be22cf4b32e7b359bab5e6434991e1f0d13b Mon Sep 17 00:00:00 2001
From: Kilian Zinnecker <kilian.zinnecker@mail.de>
Date: Sun, 3 Dec 2023 12:10:09 +0100
Subject: [PATCH 1/1] Add alpine based dockerfile

The dockerfile builds a docker based on alpine. The docker builds a
board support with buildroot. It is work in progress to create a
docker based on alpine, containing buildroot for use in CIs.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 support/docker/alpine-latest/Dockerfile       | 62 +++++++++++++++++++
 .../docker/alpine-latest/build-buildroot.sh   |  6 ++
 2 files changed, 68 insertions(+)
 create mode 100644 support/docker/alpine-latest/Dockerfile
 create mode 100755 support/docker/alpine-latest/build-buildroot.sh

diff --git a/support/docker/alpine-latest/Dockerfile b/support/docker/alpine-
latest/Dockerfile
new file mode 100644
index 0000000000..cafd069766
--- /dev/null
+++ b/support/docker/alpine-latest/Dockerfile
@@ -0,0 +1,62 @@
+FROM alpine:latest
+
+RUN apk add --no-cache wget
+RUN apk add --no-cache linux-headers
+RUN apk add --no-cache which
+RUN apk add --no-cache sed
+RUN apk add --no-cache make
+RUN apk add --no-cache binutils
+RUN apk add --no-cache dpkg
+RUN apk add --no-cache libc6-compat
+RUN apk add --no-cache fakeroot
+RUN apk add --no-cache diffutils
+RUN apk add --no-cache gcc
+RUN apk add --no-cache g++
+RUN apk add --no-cache bash
+RUN apk add --no-cache patch
+RUN apk add --no-cache gzip
+RUN apk add --no-cache bzip2
+RUN apk add --no-cache perl
+RUN apk add --no-cache tar
+RUN apk add --no-cache cpio
+RUN apk add --no-cache unzip
+RUN apk add --no-cache rsync
+RUN apk add --no-cache file
+RUN apk add --no-cache bc
+RUN apk add --no-cache findutils
+
+RUN apk add --no-cache python3
+RUN apk add --no-cache ncurses
+RUN apk add --no-cache qt5-qtbase
+RUN apk add --no-cache glib
+RUN apk add --no-cache gtk+2.0
+RUN apk add --no-cache glade
+RUN apk add --no-cache cvs
+RUN apk add --no-cache git
+RUN apk add --no-cache mercurial
+RUN apk add --no-cache rsync
+RUN apk add --no-cache dropbear-scp
+RUN apk add --no-cache openssh-sftp-server
+RUN apk add --no-cache subversion
+RUN apk add --no-cache openjdk8
+
+RUN apk add --no-cache asciidoc
+RUN apk add --no-cache w3m
+RUN apk add --no-cache graphviz
+RUN apk add --no-cache py3-matplotlib
+
+RUN addgroup --gid 1000 br-user
+RUN adduser --disabled-password --ingroup "br-user" --uid "1000" br-user
+
+USER root
+WORKDIR /home/br-user
+ADD https://github.com/buildroot/buildroot/archive/refs/heads/master.tar.gz /
home/br-user/buildroot.tar.gz
+RUN chown -R br-user /home/br-user
+RUN chgrp -R br-user /home/br-user
+USER br-user
+RUN mkdir /home/br-user/buildroot
+RUN tar -xzvf /home/br-user/buildroot.tar.gz -C /home/br-user/buildroot --
strip-components=1
+RUN wget https://gitea.auro.re/jeltz/openwrt/raw/commit/
7a70f78fb7da4dc3e8c58e7662f4dc623274a78b/tools/fakeroot/patches/400-alpine-
libc.musl-fix.patch -P /home/br-user/buildroot/package/fakeroot/
+ENV HOME /home/br-user
+COPY ./build-buildroot.sh /home/br-user/build-buildroot.sh
+CMD ["/home/br-user/build-buildroot.sh"]
diff --git a/support/docker/alpine-latest/build-buildroot.sh b/support/docker/
alpine-latest/build-buildroot.sh
new file mode 100755
index 0000000000..39d31646ec
--- /dev/null
+++ b/support/docker/alpine-latest/build-buildroot.sh
@@ -0,0 +1,6 @@
+#!/bin/bash
+
+cd buildroot
+make clean distclean clean
+make rock5b_defconfig
+make
--
2.34.1




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
