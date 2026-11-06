Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA48F606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 10:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sDNOhLAl;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xKATJj2f
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DF63403C7;
	Fri,  6 Nov 2026 10:21:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z4v7yL6EExIu; Fri,  6 Nov 2026 10:21:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8C67C403E1
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793960466;
	b=fJChsnss+N0FyLomCuWeWIQ3CetdXNFKJwwtj+xS9pF4EEG8UUU6j/kzCSm8MvF98PZr
	 K9oC2kHUsO/tkg82ja/sGd7Qtq3MSijnbE2bOI3FZPRjL7HpABFi7kPR/iO4TwReXLkD9
	 iov7Dywvcu55/IdKDWEDtFz61qi5AF44psGGsghp4ieRihz0ygX3VmDl8zStoPAHzX0dj
	 3M7fv4HR7WL5/3OaMpm79xxpZh1PsxlgQV7+kUS6rHbHuajKZcksyBFJFlKjcdPUe7l9o
	 2VZNnAmieLTpCeeyW+Btq9drJ3dDKoYNQlP8Mb1DODLTXhnR2a6wodLfKw2tkyVtL7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793960466;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1CZ9qR9Snt+hqt/0eWLZk4QOVEUWRJYigox4LEeuI+0=;
	b=WRi+3alcZcdl0Rr8d+lm170TdBd8hG322VY3/D4R9DnM1dy8986Fbl9mScZo/Kps5bIW
	 uCuhTRTQXUwi0Ga4E9ge1/DisXPvklBC8/0cwU9uDrV10r+gnUmTdIJUwwym5y6njEfa3
	 vGVsL/BSdedXZrKCsLD74d7zl2kzgrqmaHJ1GeYnLwR7L6hMHDjpnj1oHg7aNRXqIeMN2
	 5GUbVOCcmKMxvBhyoH1ypoYTsQ2eMjYPX6jA6j7XIrv8t47b0ZKj8sAYFZdwlsEsZXJQo
	 +ieCtIBdnlOe5ks2WftPEoF1xnYZ9itHWL+0ehLWIvG+Bt66HXp/j6GonxroMyM0lXQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xKATJj2f;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793960466;
	bh=1CZ9qR9Snt+hqt/0eWLZk4QOVEUWRJYigox4LEeuI+0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sDNOhLAlCG+jwqjiaymmdES/SauWewfDmo177yntsnmfJRz64T5AHEMhfwxaa7kcO
	 3dd3d2XMko5l6qxZFzQTW9TSOOhfLXHRMdH1wxITZO8XacD1lFCLNBsEcMT1jYXKu9
	 qDbc63B45pOzW227mphzopF9LLn4ZedKaRXLkTp0ODiBM5iq3zkBQ80V1G5QQP82YJ
	 ggK1AnYQzrmylkINQvDM7S6av/UsYK/Ry4Zl/tt5Z8JThfXD2Lv7hNQhToaofpO5Ji
	 amjxSVsMAIdtywm1CQAkJ/ywBv2qE39ga5PXw2Ys2a2cR1sPArRNMZZwzR/VoD10kq
	 rP6ROC070UOtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C67C403E1;
	Fri,  6 Nov 2026 10:21:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A02534D
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 10:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60773403B3
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 10:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id elVanPFaClmv for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 10:21:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1715740956
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=xKATJj2f
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1715740956
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 10:21:03 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a2153c8525so3254685e9.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 02:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793960462; x=1794565262; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=OnLnky3Z3tK6QY8lQrszJx35lvI0jH6478AMvs0Lk7I=;
 b=xKATJj2frkfeSD8WoFbvz8k8rCxpAqY4G8f61L64RRojj8T0DSybyigFMXEw/ttCkr
 Hcj0s8KHxvKjLVp0fBE9d100dBs2pKndhb6sjl3LoehMTdrra/YhUsA7lt/aEGp/BVX4
 JNOCVPBr08HXKZER40S47AByheyBG2PaUsiYtdcB75req13+0oVzcmsGqVSlOVJLKc4G
 sJOkDv0q/YXkAWJEl1ukO+rtqn9+bqdRL5AXhdIOPFm/0ZiE+utt6UQ3K0eA/8ATd6T5
 VAtars5XgCkbsKfvjOG4M3kdyiK2yjNPDhT10KFcIp2aF5nCkA5UyBwfb23iXEK4u7od
 09DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793960462; x=1794565262;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OnLnky3Z3tK6QY8lQrszJx35lvI0jH6478AMvs0Lk7I=;
 b=rtmSKcF2si+MxhHUwfoWTJu4icLRVSqEV+ZeAnMDhgqxZcBuIeEkpOFnH80HxLFOTQ
 7GSJ1IU2HvBLC4QP25oJ4WheL9YzoploKVENZCl21kXuD2L2yC/a/JQ1nRfhpptF4Xe1
 YgRALigMrPXvdKWX73QBbKBNK7LWmEJuy4bKXhU8KQpbhEHl5XsPyT35t8tzV+/OgdOR
 s7cAhtr4MP54NBkD0PoqYQR43dW4Ygs+PkgGxLTgWMR4+Bid0qRBuwyePdv899ZdqcjQ
 RG3MHJG7JchaxXc7fX5ADv2kjDAfa2bG4lawnXv+i6cHXHQovCs4yVhQqeprudnmLnXN
 t6kw==
X-Gm-Message-State: APuU4Z9ACNiq+nwrwd7tsy7bxuNKq3oytnt2CFjhCCIDGq58CH30xlCh
 M3pSi3GZgCW8+ghfIcsOSHT48lxVUwI4vcKhUBIY66yJKi8xShsP5XbEayFn1g==
X-Gm-Gg: AYBFou3+zY59EYhRN06PNjO8zQs2hn1UhwUugQqppf7UovtphtTbCoLshJtfl1RDFS3
 V/6fiNs8yG13LfiIb2cAOV7WsPIwnhRuIZdeN/T1uqYXy8hd0i6u9Od8UvnZCTg/JgWTZZeahnR
 vc0RiAr3m5PGOzpOJ1oAc0SViYOVJR21Hhz4hlvWZnv6UVCnMsNZlhPwvLvetPJfmBThVg5t3k5
 FIdc+GhY8VI+nl7dAJaStpquvbFznBGUVHNyUmbi6ZtUHvoC9N05dxIAk0oJCpxzkpPYWrpkInG
 q8fFQHYmAb5usURDc03aodtssemBQTfXjG+2kNDbb/5gG0yLmg8DCq2wsoC2aLDpgD7BNLgo8c5
 sDVhfOJJRRjmgyT2w0JTRoz18E0yTFmOVs/RMlcDIdQHzOvYpSbrYOurjTDR5lc1jjgpXFHwEO7
 5RaMQSn0bbWKB4RdmKHfUWtZs7q6BPzqM+26zet7uzIwu3wh/0jVrYzIMncZ/lLoPrXhbsK3mE/
 8RY1R1mj5wOzCOwJ5UM2p9HQOP3n8vO3o/VLqdr4tG628ObNtDkTwB48Nvsq73JnbqCXDUspOMn
 VdU9l5wqSMvV0PMmiQgBwnt7guDHmuo4MGGc26D+XG1bkcHJvqE4gTsbJZrVza7LqGt4r0ChUj8
 =
X-Received: by 2002:a05:600c:34d5:b0:4a3:59c2:b41e with SMTP id
 5b1f17b1804b1-4b6dc6df61amr33489615e9.4.1793960461437; 
 Fri, 06 Nov 2026 02:21:01 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b6ed5b8159sm43766145e9.2.2026.11.06.02.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 02:21:01 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri,  6 Nov 2026 11:20:58 +0100
Message-Id: <20261106102059.1407103-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] support/misc/Vagrantfile: move to Ubuntu
 26.04
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Debian bullseye (11) reached the end of its LTS support on 2026-08-31,
and the official boxes of the newer Debian releases are only built for
libvirt.

Move to the Bento Ubuntu 26.04 box, as the same image is available for
VirtualBox, VMware and libvirt:

https://portal.cloud.hashicorp.com/vagrant/discover/bento/ubuntu-26.04

While at it:
- purge snapd, the Ubuntu management tools and the services not needed
  in a build VM, to keep it minimal;
- use the GNU install, Buildroot does not work with the uutils one;
- install libncurses-dev (libncurses5-dev is gone), cpio, file and wget;
- replace the vagrant-vbguest plugin, archived since 2023 and broken
  with recent Vagrant versions, with the virtualbox-guest-utils package,
  which uses the kernel drivers;
- use the vmware_desktop provider name;
- download the release over https.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 support/misc/Vagrantfile | 39 +++++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 4fb2c9728a..91504468a6 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -12,9 +12,13 @@ VM_MEMORY=2048
 VM_CORES=1
 
 Vagrant.configure('2') do |config|
-	config.vm.box = 'debian/bullseye64'
+	# Ubuntu is used because the same Bento box is available for all the
+	# providers below: VirtualBox, VMware and libvirt. There is no such box
+	# for Debian trixie: the official one is only built for libvirt, and
+	# the Bento one has no libvirt image.
+	config.vm.box = 'bento/ubuntu-26.04'
 
-	config.vm.provider :vmware_fusion do |v, override|
+	config.vm.provider :vmware_desktop do |v, override|
 		v.vmx['memsize'] = VM_MEMORY
 		v.vmx['numvcpus'] = VM_CORES
 	end
@@ -23,10 +27,13 @@ Vagrant.configure('2') do |config|
 		v.memory = VM_MEMORY
 		v.cpus = VM_CORES
 
-		required_plugins = %w( vagrant-vbguest )
-		required_plugins.each do |plugin|
-		  system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
-		end
+		# Replace the Guest Additions built in the box with the Ubuntu
+		# ones, which use the drivers of the kernel: nothing to compile,
+		# and they keep working across kernel updates
+		override.vm.provision 'shell', privileged: true, inline:
+			"/opt/VBoxGuestAdditions-*/uninstall.sh || true
+			apt-get -q update
+			apt-get -q -y install virtualbox-guest-utils"
 	end
 
 	config.vm.provider :libvirt do |v, override|
@@ -37,7 +44,7 @@ Vagrant.configure('2') do |config|
 	config.vm.provision 'shell' do |s|
 		s.inline = 'echo Setting up machine name'
 
-		config.vm.provider :vmware_fusion do |v, override|
+		config.vm.provider :vmware_desktop do |v, override|
 			v.vmx['displayname'] = "Buildroot #{RELEASE}"
 		end
 
@@ -49,15 +56,27 @@ Vagrant.configure('2') do |config|
 	config.vm.provision 'shell', privileged: true, inline:
 		"dpkg --add-architecture i386
 		apt-get -q update
-		apt-get -q -y install build-essential libncurses5-dev \
-			git bzr cvs mercurial rsync subversion libc6:i386 unzip bc
+		# Keep the VM minimal: drop snapd and the Ubuntu specific management
+		# tools, the services and the storage tools a build VM does not need
+		apt-get -q -y purge --auto-remove snapd lxd-installer lxd-agent-loader \
+			ubuntu-pro-client landscape-common apport pollinate unminimize \
+			cloud-init cloud-initramfs-copymods cloud-initramfs-dyn-netconf \
+			software-properties-common ufw needrestart fwupd packagekit \
+			modemmanager plymouth kdump-tools sos overlayroot multipath-tools \
+			open-iscsi bcache-tools btrfs-progs xfsprogs ntfs-3g mdadm
+		apt-get -q -y install build-essential libncurses-dev \
+			git bzr cvs mercurial rsync subversion libc6:i386 unzip bc \
+			cpio file wget gnu-coreutils
+		# Buildroot does not work with the uutils install of Ubuntu
+		update-alternatives --install /usr/bin/install install \
+			/usr/bin/gnuinstall 100
 		apt-get -q -y autoremove
 		apt-get -q -y clean
 		update-locale LC_ALL=C"
 
 	config.vm.provision 'shell', privileged: false, inline:
 		"echo 'Downloading and extracting buildroot #{RELEASE}'
-		wget -q -c http://buildroot.org/downloads/buildroot-#{RELEASE}.tar.gz
+		wget -q -c https://buildroot.org/downloads/buildroot-#{RELEASE}.tar.gz
 		tar axf buildroot-#{RELEASE}.tar.gz"
 
 end
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
