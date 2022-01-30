Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F6DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 22:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B35783F99;
	Sun, 30 Jan 2022 22:25:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VfRwUHU1_NWc; Sun, 30 Jan 2022 22:25:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EE8283F96;
	Sun, 30 Jan 2022 22:25:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C41261BF4DA
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 22:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEC2183F95
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 22:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a7kWw-uGjMGS for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 22:25:30 +0000 (UTC)
X-Greylist: delayed 00:10:00 by SQLgrey-1.8.0
Received: from mx.post.pl (mx.post.pl [89.161.252.35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6837683F96
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 22:25:30 +0000 (UTC)
Received: from leo (unknown [91.226.196.115])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail02.home.net.pl (Postfix) with ESMTPSA id 1C97B83087;
 Sun, 30 Jan 2022 23:09:51 +0100 (CET)
Date: Sun, 30 Jan 2022 23:09:50 +0100
From: Arek Marud <a.marud@post.pl>
To: buildroot@buildroot.org
Message-ID: <YfcMrhsNq6LnkKzP@leo>
MIME-Version: 1.0
Content-Disposition: inline
X-CLIENT-IP: 91.226.196.115
X-CLIENT-HOSTNAME: 91.226.196.115
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrfeelgdduheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecujffqoffgrffnpdggtffipffknecuuegrihhlohhuthemucduhedtnecunecujfgurhepfffhvffukfggtggusehttdertddttddvnecuhfhrohhmpeetrhgvkhcuofgrrhhuugcuoegrrdhmrghruhgusehpohhsthdrphhlqeenucggtffrrghtthgvrhhnpedtffeivdduleeugfdvvdeujedujeevudegieffgedujeeiffevleeifedvuedtgeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhmhihnrghmvgdrlhhotggrlhenucfkphepledurddvvdeirdduleeirdduudehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledurddvvdeirdduleeirdduudehpdhhvghloheplhgvohdpmhgrihhlfhhrohhmpeetrhgvkhcuofgrrhhuugcuoegrrdhmrghruhgusehpohhsthdrphhlqedpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprgdrmhgrrhhuugesphhoshhtrdhplh
X-DCC--Metrics: mail02.home.net.pl 1024; Body=2 Fuz1=2
Subject: [Buildroot] I have a problem adding new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi, 

I'm trying to add new package to Buildroot. I follow Buildroot tutorial
for autotools package. But I got an error message, and i have no idea
what is the problem.

https://gist.github.com/arekmd/c33a3a487ec73d8847c3c115f8fa3299

Best regards 
Arek

################################################################################
#
# libonvif
################################################################################
LIBONVIF_VERSION = 1.1.1
LIBONVIF_SOURCE = v$(LIBONVIF_VERSION).tar.gz
LIBONVIF_SITE = https://github.com/sr99622/libonvif/archive/refs/tags
LIBONVIF_INSTALL_STAGING = YES
LIBONVIF_INSTALL_TARGET = YES
LIBONVIF_CONF_OPTS = --with-libxml2 --includedir="$(STAGING_DIR)/usr/include/libxml2" 
LIBONVIF_DEPENDENCIES = libxml2 host-pkgconf

$(eval $(autotools-package))

------------------------------------------------------------------------------------------
- Config.in
------------------------------------------------------------------------------------------
config BR2_PACKAGE_LIBONVIF
        bool "libonvif"
        select BR2_PACKAGE_LIBXML2
        help
          libonvif  ONVIF library

          https://github.com/sr99622/libonvif

------------------------------------------------------------------------------------------
--- Error message
------------------------------------------------------------------------------------------



myname buildroot$>make
>>> libonvif 0.0.0 Installing to staging directory
PATH="/home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/host/bin:/home/myname/workbench/resources/development/myproj/buildroot/buildroot
/output/host/sbin:/home/myname/.local/bin:/home/myname/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/var/lib/flatpak/exports/bin:/usr/bin/site_perl:/usr/bin/
vendor_perl:/usr/bin/core_perl"  /usr/bin/make -j5 DESTDIR=/home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/host/aarch64-myproj-linux
-gnu/sysroot install -C /home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/build/libonvif-0.0.0/
make[1]: Entering directory '/home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/build/libonvif-0.0.0'
Making install in build
make[2]: Entering directory '/home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/build/libonvif-0.0.0/build'
make[3]: Entering directory '/home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/build/libonvif-0.0.0/build'
 /usr/bin/mkdir -p '/home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/host/aarch64-myproj-linux-gnu/sysroot/usr/lib'
 /bin/sh ../libtool   --mode=install /usr/bin/install -c   libonvif.la '/home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/host/aarch6
4-myproj-linux-gnu/sysroot/usr/lib'
 /usr/bin/mkdir -p '/home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/host/aarch64-myproj-linux-gnu/sysroot/usr/lib/pkgconfig'
 /usr/bin/mkdir -p '/home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/host/aarch64-myproj-linux-gnu/sysroot/home/myname/workbench/resour
ces/development/myproj/buildroot/buildroot/output/host/aarch64-myproj-linux-gnu/sysroot/usr/include/libxml2/libonvif'
 /usr/bin/install -c -m 644 libonvif.pc '/home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/host/aarch64-myproj-linux-gnu/sysroot/usr/l
ib/pkgconfig'
 /usr/bin/install -c -m 644 ../source/onvif.h ../source/sha1.h ../source/cencode.h '/home/myname/workbench/resources/development/myproj/buildroot/buildroot/output
/host/aarch64-myproj-linux-gnu/sysroot/home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/host/aarch64-myproj-linux-gnu/sysroot/usr/inclu
de/libxml2/libonvif'
libtool: install: /usr/bin/install -c .libs/libonvif.so.0.0.0 /home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/host/aarch64-myproj-li
nux-gnu/sysroot/usr/lib/libonvif.so.0.0.0
libtool: install: (cd /home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/host/aarch64-myproj-linux-gnu/sysroot/usr/lib && { ln -s -f li
bonvif.so.0.0.0 libonvif.so.0 || { rm -f libonvif.so.0 && ln -s libonvif.so.0.0.0 libonvif.so.0; }; })
libtool: install: (cd /home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/host/aarch64-myproj-linux-gnu/sysroot/usr/lib && { ln -s -f li
bonvif.so.0.0.0 libonvif.so || { rm -f libonvif.so && ln -s libonvif.so.0.0.0 libonvif.so; }; })
libtool: install: /usr/bin/install -c .libs/libonvif.lai /home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/host/aarch64-myproj-linux-g
nu/sysroot/usr/lib/libonvif.la
libtool: warning: remember to run 'libtool --finish /usr/lib'
make[3]: Leaving directory '/home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/build/libonvif-0.0.0/build'
make[2]: Leaving directory '/home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/build/libonvif-0.0.0/build'
make[2]: Entering directory '/home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/build/libonvif-0.0.0'
make[3]: Entering directory '/home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/build/libonvif-0.0.0'
make[3]: Nothing to be done for 'install-exec-am'.
 /usr/bin/mkdir -p '/home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/host/aarch64-myproj-linux-gnu/sysroot/usr/share/doc/libonvif'
 /usr/bin/install -c -m 644 README '/home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/host/aarch64-myproj-linux-gnu/sysroot/usr/share/
doc/libonvif'
make[3]: Leaving directory '/home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/build/libonvif-0.0.0'
make[2]: Leaving directory '/home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/build/libonvif-0.0.0'
make[1]: Leaving directory '/home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/build/libonvif-0.0.0'
>>> libonvif 0.0.0 Fixing libtool files
for la in $(find /home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/host/aarch64-myproj-linux-gnu/sysroot/usr/lib* -name "*.la"); do \
        cp -a "${la}" "${la}.fixed" && \
        /usr/bin/sed -i -e "s:/home/myname/workbench/resources/development/myproj/buildroot/buildroot/output:@BASE_DIR@:g" \
                -e "s:/home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/host/aarch64-myproj-linux-gnu/sysroot:@STAGING_DIR@:g" \
                 \
                -e "s:\(['= ]\)/usr:\\1@STAGING_DIR@/usr:g" \
                -e "s:\(['= ]\)/lib:\\1@STAGING_DIR@/lib:g" \
                 \
                -e "s:@STAGING_DIR@:/home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/host/aarch64-myproj-linux-gnu/sysroot:g" \
                -e "s:@BASE_DIR@:/home/myname/workbench/resources/development/myproj/buildroot/buildroot/output:g" \
                "${la}.fixed" && \
        if cmp -s "${la}" "${la}.fixed"; then \
                rm -f "${la}.fixed"; \
        else \
                mv "${la}.fixed" "${la}"; \
        fi || exit 1; \
done
libonvif: installs files in /home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/host/aarch64-myproj-linux-gnu/sysroot//home/myname/workben
ch/resources/development/myproj/buildroot/buildroot/output
make: *** [package/pkg-generic.mk:339: /home/myname/workbench/resources/development/myproj/buildroot/buildroot/output/build/libonvif-0.0.0/.stamp_staging_installe
d] Error 1
myname buildroot$> 


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
