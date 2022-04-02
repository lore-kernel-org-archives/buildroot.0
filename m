Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D16C433F5
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 20:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCD8584086;
	Sat,  2 Apr 2022 20:03:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mf7wO_qaAU4Y; Sat,  2 Apr 2022 20:03:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1C8284078;
	Sat,  2 Apr 2022 20:03:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69ABD1BF400
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 20:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6517584078
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 20:03:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EMXRiLKyC4Bl for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 20:03:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3994284072
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 20:03:18 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 k124-20020a1ca182000000b0038c9cf6e2a6so3364183wme.0
 for <buildroot@buildroot.org>; Sat, 02 Apr 2022 13:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ffUG710Kk5xn6wOZiriUKh+xd9p+QE//np+Vq0Oh2mA=;
 b=Er7OG7aFEup1TrpDfGwpVaHKUDOABn2mwg/zKVqERVcraC0INdwBiZTo9e1F+L00gf
 1qmHLQ00yFqiZGgIrI2uWaNzozysxcjwjGIAFxuCr5TvmLa672sSBbf1HWFFh/zDERtz
 UojAaqGgcYSjjBcdCPS3mIpe4FLo3PzEDdYAHqLu2Atv2txK3Gu/aVSq8A9quHRHCZe1
 SmIn0qoO4p7vxHPQe0/3AZOVsf8a4I2vmLnouAtj5ko37QjLyA9nNCLrODi4v+m+lCm7
 2B+f8zwL2a8quLR0ktBdOMT9gyxJGRIu6O85DArIfqzpvi25+qbm4mWENnvnYXEX2Qco
 T8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ffUG710Kk5xn6wOZiriUKh+xd9p+QE//np+Vq0Oh2mA=;
 b=TNbOiptpGyIpY8U7PKGF+c/NJY1tGZA7FGeSyh/TpR/fJL0T3UebPLw/57bFkQy+wM
 8FLifun3PUbr38C/o0q8fIbYLWrG91jYUau+ENL2oVwo86EPEaW9mn74LeseDMCyY1t4
 EO7jgXEaGdxQeRiCWtO7TtMU5TGtm2a/MQXV1pP5T6g7bgD4q2BZzn5cbDos1SO98S7D
 59VeaiBlhSaIkz65fWGsnocbQsuhQjAAc+29qknhWZ+o6Osp1m1hxRZHoTBG0OHxlbLE
 5gKbQDSP3D7E9Pm4MSQ7nXkKIwZBUFKWq5LvGnfWJGM3PeCr44o6HBdQtpjnnTEarFne
 HO+Q==
X-Gm-Message-State: AOAM532p+cGo4FfomQVRaxISS1NV55qzQV8kyKfvWFNGMw0y9bY0QXtT
 aApIPjcQ1D4sUL4hcQaamGIepuigQrw=
X-Google-Smtp-Source: ABdhPJxpmGU3Q6pXx0CSh3twN+dRPyDVfV+14f8DqfTNpUrEA7ry0lhYo2bGETmOBGStoa47fuXmig==
X-Received: by 2002:a7b:cd03:0:b0:37b:fc83:a4e2 with SMTP id
 f3-20020a7bcd03000000b0037bfc83a4e2mr13476994wmj.193.1648929795959; 
 Sat, 02 Apr 2022 13:03:15 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 v18-20020adfc5d2000000b0020589b76704sm5580224wrg.70.2022.04.02.13.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Apr 2022 13:03:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Apr 2022 22:01:18 +0200
Message-Id: <20220402200118.1193238-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] fs/oci: depends on
 BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a dependency on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS to avoid
the following build failure when GO_GOARCH is empty (e.g. on mips32)
raised since the addition of the package in commmit
ccda2f4bdc97d2f5a4a1efdb357ece8e5b57e10d:

printf '   	rm -rf /home/autobuild/autobuild/instance-6/output-1/images/rootfs-oci\n	/home/autobuild/autobuild/instance-6/output-1/host/bin/sloci-image --arch   --entrypoint "sh" --author "Buildroot" --user "0" /home/autobuild/autobuild/instance-6/output-1/build/buildroot-fs/oci/target /home/autobuild/autobuild/instance-6/output-1/images/rootfs-oci:latest\n' >> /home/autobuild/autobuild/instance-6/output-1/build/buildroot-fs/oci/fakeroot
chmod a+x /home/autobuild/autobuild/instance-6/output-1/build/buildroot-fs/oci/fakeroot
PATH="/home/autobuild/autobuild/instance-6/output-1/host/bin:/home/autobuild/autobuild/instance-6/output-1/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl" FAKEROOTDONTTRYCHOWN=1 /home/autobuild/autobuild/instance-6/output-1/host/bin/fakeroot -- /home/autobuild/autobuild/instance-6/output-1/build/buildroot-fs/oci/fakeroot
rootdir=/home/autobuild/autobuild/instance-6/output-1/build/buildroot-fs/oci/target
table='/home/autobuild/autobuild/instance-6/output-1/build/buildroot-fs/full_devices_table.txt'
Usage:
  sloci-image [options] ROOTFS NAME[:TAG]
  sloci-image [-h | -V]

Create a single-layer OCI image with the given rootfs.

Arguments:
  ROOTFS                 Directory or tar.gz archive with rootfs to pack into the image.
                         Important: Archive will be *moved* to the image, so make a copy if you
                         need it. Directory will be preserved.

  NAME                   Name of the image.

  TAG                    Tag for the image. Defaults to "latest".

Options:
  -m --arch ARCH         CPU architecture which the binaries in this image are built to run on.
                         Defaults to $(uname -m).

     --arch-variant      Variant of the CPU. This is typically used only for arm (v6, v7, v8).

  -a --author NAME       Name and/or email address of the person which created the image.

  -c --cmd CMD           Default arguments to the entrypoint of the container.

     --debug             Print debug messages (it can be also enabled with env. variable DEBUG).

  -C --entrypoint EP     Arguments to use as the command to execute when the container starts.

  -e --env VAR=VAL       Default environment variables for container.

  -l --label KEY=VALUE   Metadata for the container compliant with OCI annotation rules.
                         If KEY starts with a dot, it will be prefixed with
                         "org.opencontainers.image" (e.g. .url -> org.opencontainers.image.url).

     --os OS             Name of the OS which the image is built to run on. Defaults to "linux".

  -p --port PORT[/PROT]  Default set of ports to expose from a container running this image in
                         format: <port>/tcp, <port>/udp, or <port> (same as <port>/tcp).
                         Aliases: --expose.

  -t --tar               Pack image in a TAR archive.

  -u --user USER         The username or UID of user the process run as.

  -v --volume PATH       Default set of directories describing where the process is likely write
                         data specific to a container instance.

  -w --working-dir DIR   Sets the current working directory of the entrypoint process in the
                         container.

  -V --version           Print version and exit.

  -h --help              Print this message and exit.

Please report bugs at <https://github.com/jirutka/sloci-image/issues>.
make: *** [fs/oci/oci.mk:99: /home/autobuild/autobuild/instance-6/output-1/images/rootfs.oci] Error 1

Fixes:
 - http://autobuild.buildroot.org/results/44da17a393421dfcb8bbdd63074cb82b436dfa94

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 fs/oci/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/oci/Config.in b/fs/oci/Config.in
index 176785810a..8f36c91c8f 100644
--- a/fs/oci/Config.in
+++ b/fs/oci/Config.in
@@ -1,5 +1,6 @@
 config BR2_TARGET_ROOTFS_OCI
 	bool "oci image"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	help
 	  Build an OCI (Open Container Initiative) image.
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
