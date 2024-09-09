Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB03ECE57A
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 15:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FE63400F9;
	Mon,  9 Sep 2024 15:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NzkcOvbP0c_n; Mon,  9 Sep 2024 15:33:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B13C84045A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B13C84045A;
	Mon,  9 Sep 2024 15:33:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA5081BF362
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 15:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 970994023C
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 15:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u6qh3M2HHAM5 for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 15:33:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4572540239
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4572540239
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4572540239
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 15:33:21 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 09954C15C9
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 15:27:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5DBAFF806;
 Mon,  9 Sep 2024 15:27:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1sngIz-00GGWx-0I;
 Mon, 09 Sep 2024 17:27:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  9 Sep 2024 17:27:46 +0200
Message-Id: <20240909152748.3876779-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 1/2] support/misc/Vagrantfile: move to Debian
 bullseyes (12)
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

Ubuntu Bionic (18.04) was EOL'ed in June 2023:

https://ubuntu.com//blog/18-04-end-of-standard-support

And the VM image is only available in virtualbox format:

https://app.vagrantup.com/ubuntu/boxes/bionic64

So move to Debian bullseye (12), matching what we do for the docker image.
This is available in virtualbox and libvirt (qemu) format:

https://app.vagrantup.com/debian/boxes/bullseye64

Bullseye does not come with rsync out of the box, so install it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/misc/Vagrantfile | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 2251a992dc..8252f555b6 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -12,7 +12,7 @@ VM_MEMORY=2048
 VM_CORES=1
 
 Vagrant.configure('2') do |config|
-	config.vm.box = 'ubuntu/bionic64'
+	config.vm.box = 'debian/bullseye64'
 
 	config.vm.provider :vmware_fusion do |v, override|
 		v.vmx['memsize'] = VM_MEMORY
@@ -42,12 +42,10 @@ Vagrant.configure('2') do |config|
 	end
 
 	config.vm.provision 'shell', privileged: true, inline:
-		"sed -i 's|deb http://us.archive.ubuntu.com/ubuntu/|deb mirror://mirrors.ubuntu.com/mirrors.txt|g' /etc/apt/sources.list
-		dpkg --add-architecture i386
+		"dpkg --add-architecture i386
 		apt-get -q update
-		apt-get purge -q -y snapd lxcfs lxd ubuntu-core-launcher snap-confine
 		apt-get -q -y install build-essential libncurses5-dev \
-			git bzr cvs mercurial subversion libc6:i386 unzip bc
+			git bzr cvs mercurial rsync subversion libc6:i386 unzip bc
 		apt-get -q -y autoremove
 		apt-get -q -y clean
 		update-locale LC_ALL=C"
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
