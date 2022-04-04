Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D7AC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F405401BA;
	Mon,  4 Apr 2022 19:33:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ynFgsIodi9Cr; Mon,  4 Apr 2022 19:33:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC760400C6;
	Mon,  4 Apr 2022 19:33:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 702461BF9AF
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E6BB401B7
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:32:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N0wcQBUcUhKG for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:32:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8730E401A3
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:32:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DBA1B8259A; Mon,  4 Apr 2022 19:22:57 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 21:19:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6619214d46ea41d8f8a60b67a6737becfe1b95c6
X-Git-Newrev: efe832dbc3c8d0d2caa1e8ba0ccba8254292de6c
X-Patchwork-Hint: ignore
Message-Id: <20220404192257.DBA1B8259A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs/oci: depends on
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=efe832dbc3c8d0d2caa1e8ba0ccba8254292de6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a dependency on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS to avoid
the following build failure when GO_GOARCH is empty (e.g. on mips32)
which leads to an empty --arch argument in the sloci-image call, raised
since the addition of the package in commmit
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
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
