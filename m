Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E0CEE01E7
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AD2A6059D;
	Tue, 10 Sep 2024 20:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HwDzcoPDO9o6; Tue, 10 Sep 2024 20:43:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5265B605A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5265B605A9;
	Tue, 10 Sep 2024 20:43:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E2BF1BF4D8
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B9BF80E20
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ftD81cuVVn1W for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:43:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 604B580E16
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 604B580E16
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 20:43:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48F3A86F52; Tue, 10 Sep 2024 20:43:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 22:42:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2358693dd03a2657633241950f84d9761001d02d
X-Git-Newrev: 6cedd92744341c1c9b5f76026db05a9fd653485d
X-Patchwork-Hint: ignore
Message-Id: <20240910204328.48F3A86F52@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/misc/Vagrantfile: move to Debian
 bullseye (12)
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6cedd92744341c1c9b5f76026db05a9fd653485d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ubuntu Bionic (18.04) was EOL'ed in June 2023:

https://ubuntu.com//blog/18-04-end-of-standard-support

And the VM image is only available in virtualbox format:

https://app.vagrantup.com/ubuntu/boxes/bionic64

So move to Debian bullseye (12), matching what we do for the docker image.
This is available in virtualbox and libvirt (qemu) format:

https://app.vagrantup.com/debian/boxes/bullseye64

Bullseye does not come with rsync out of the box, so install it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
