Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E224C5B552
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 05:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D40F41964;
	Wed,  4 Jun 2025 05:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DiQF1Q_T0U6N; Wed,  4 Jun 2025 05:29:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A660540E57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A660540E57;
	Wed,  4 Jun 2025 05:29:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AFDE122B
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 05:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A07361140
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 05:29:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQNSSEbV2dEj for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 05:29:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=daggs@gmx.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 088E56111C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 088E56111C
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 088E56111C
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 05:29:13 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [87.70.229.102] ([87.70.229.102]) by web-mail.gmx.net
 (3c-app-mailcom-bs13.server.lan [172.19.170.181]) (via HTTP); Wed, 4 Jun
 2025 07:29:10 +0200
MIME-Version: 1.0
Message-ID: <trinity-44f0d655-4627-4053-9c31-47d5a4a93e8c-1749014950599@3c-app-mailcom-bs13>
To: buildroot@buildroot.org
Content-Type: multipart/mixed;
 boundary=kenitram-01aeb136-de54-41c5-8b6d-6b01b8fa5129
Date: Wed, 4 Jun 2025 07:29:10 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:SRx60g6AQ1M4CIZYpRfg27mAQ2n3SO5xognMX8R/2ptctSRKdaRCtyABQQ8pL//PDNonR
 G0KiDHey+VaP0PX/wq8N1NQRZrp2E1vuaejLbv3/TOmyuiiIkys1TQurK8VFhkzmKl//2mUeKOdv
 sGvIIl/X/hliJVjQ/9SbyC3ZCwZ1M9JAINB9k05R9VDUFrSA7CgLeVAiyreiAKairWC8BQI8ON5j
 K2qXTh6LgQzOaWVdUsUOJV+xD1NRkt9ogkaLgZJRC5EEXlPJflWgvGOCBbV2V6e4CjNj76ulmqOK
 ac=
UI-OutboundReport: notjunk:1;M01:P0:lLu1OZV4ycY=;vSC27aXt2UYXvRTMKqiIl7a/kYH
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.com; 
 s=s31663417; t=1749014950; x=1749619750; i=daggs@gmx.com;
 bh=9FEzMBQXPjORjlIA66Ll10HiTsVIVSXNZl/gd4qn77k=;
 h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Subject:
 Content-Type:Date:cc:content-transfer-encoding:content-type:date:
 from:message-id:mime-version:reply-to:subject:to;
 b=Xiyrceyu63PIoY1kvQis98M1KxwZPt6ZPUJf7bIQ2DhMGo01HQXZaF7DM0woLiDa
 e06CtqgdC0RvUHbzm8yZWHzlDL/dW7PbZqbo2TWuWlqNMIDIUZVKIduzkouelTPoA
 ZxV5y1uS2euFa+59AicvnORCBkb8feHWdOiuulHlqzSEmb7iYHe/tbQkR2IN5wRX0
 HiLDaqoPICaMJcFJs7LjcK+shw7fD8o3qkVhVLr89LR1Yc24JbKsScDvm2haLpZmS
 19yCZovl8jnMxk48CChYF2FHp1/O9NKDQP+GTZrL6QofNjVWWzMmksI/C53xW654L
 xtQaBL5tprduhfdAVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.com header.i=daggs@gmx.com header.a=rsa-sha256
 header.s=s31663417 header.b=Xiyrceyu
Subject: [Buildroot] [BUG] kodi: default on addon install
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
From: daggs via buildroot <buildroot@buildroot.org>
Reply-To: daggs <daggs@gmx.com>
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--kenitram-01aeb136-de54-41c5-8b6d-6b01b8fa5129
Content-Type: text/plain; charset=UTF-8

Greetings,

I'm trying to create an buildroot image that runs kodi on a qemu vm, I'm using the attached defconfigs.
when I try to install this addon: https://github.com/Fishenzon/repo/blob/master/zips/script.module.myresolver/script.module.myresolver-1.0.2.zip kodi segfaults, see:
kodi.bin[233]: segfault at 8 ip 000055590e634aea sp 00007ffc74c19130 error 4 in kodi.bin[1034aea,55590dbb7000+12b5000] likely on CPU 3 (core 1, socket 0)
Code: 48 8b 85 30 f7 ff ff 44 89 ad a0 f7 ff ff 48 8d 35 83 9f 8a 00 48 89 85 90 f7 ff ff 48 8b 85 38 f7 ff ff 48 89 85 98 f7 ff ff <41> 0f b6 46 08 4c 8b b5 50 f6 ff ff 88 85 b0 f7 ff ff 4c 89 f7 e8
kodi.bin[1564]: segfault at 8 ip 00005576155c2aea sp 00007ffe4cdaf440 error 4 in kodi.bin[1034aea,557614b45000+12b5000] likely on CPU 3 (core 1, socket 0)
Code: 48 8b 85 30 f7 ff ff 44 89 ad a0 f7 ff ff 48 8d 35 83 9f 8a 00 48 89 85 90 f7 ff ff 48 8b 85 38 f7 ff ff 48 89 85 98 f7 ff ff <41> 0f b6 46 08 4c 8b b5 50 f6 ff ff 88 85 b0 f7 ff ff 4c 89 f7 e8
kodi.bin[1602]: segfault at 8 ip 000055c2cfe49aea sp 00007ffdd326fd30 error 4 in kodi.bin[1034aea,55c2cf3cc000+12b5000] likely on CPU 1 (core 0, socket 0)
Code: 48 8b 85 30 f7 ff ff 44 89 ad a0 f7 ff ff 48 8d 35 83 9f 8a 00 48 89 85 90 f7 ff ff 48 8b 85 38 f7 ff ff 48 89 85 98 f7 ff ff <41> 0f b6 46 08 4c 8b b5 50 f6 ff ff 88 85 b0 f7 ff ff 4c 89 f7 e8

this addon works on both bare metal and the same vm within libreelec, the issue persists on both 521920831ceedb28389802c8d9ceedfb685a7be2 and 47713b4ac9a38c57d6e38601c0c6a030ee777b7e

any idea how to fix it or even debug it?

Dagg.
--kenitram-01aeb136-de54-41c5-8b6d-6b01b8fa5129
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=defconfig

CONFIG_SYSVIPC=y
CONFIG_CGROUPS=y
CONFIG_CGROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
CONFIG_USER_NS=y
CONFIG_SMP=y
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
CONFIG_EFI=y
# CONFIG_CPU_MITIGATIONS is not set
# CONFIG_VIRTUALIZATION is not set
# CONFIG_GCC_PLUGINS is not set
CONFIG_MODULES=y
CONFIG_MODULE_UNLOAD=y
CONFIG_NET=y
CONFIG_PACKET=y
CONFIG_UNIX=y
CONFIG_INET=y
CONFIG_NETFILTER=y
CONFIG_IP_NF_IPTABLES=y
CONFIG_IP_NF_FILTER=y
CONFIG_NET_SCHED=y
CONFIG_NET_SCH_FQ_CODEL=y
CONFIG_CFG80211=m
CONFIG_CFG80211_WEXT=y
CONFIG_MAC80211=m
CONFIG_PCI=y
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_DMI_SYSFS=y
CONFIG_VIRTIO_BLK=y
CONFIG_BLK_DEV_SD=y
CONFIG_BLK_DEV_SR=y
CONFIG_SCSI_VIRTIO=y
CONFIG_ATA=y
CONFIG_ATA_PIIX=y
CONFIG_NETDEVICES=y
CONFIG_VIRTIO_NET=y
CONFIG_ATL2=m
CONFIG_ATL1=m
CONFIG_ATL1E=m
CONFIG_ATL1C=m
CONFIG_ALX=m
CONFIG_E100=m
CONFIG_E1000=m
CONFIG_E1000E=m
CONFIG_IGB=m
CONFIG_NE2K_PCI=y
CONFIG_8139CP=y
CONFIG_R8169=m
# CONFIG_USB_NET_DRIVERS is not set
# CONFIG_WLAN is not set
CONFIG_INPUT_EVDEV=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_VIRTIO_CONSOLE=y
CONFIG_HW_RANDOM_VIRTIO=m
CONFIG_MEDIA_CEC_SUPPORT=y
CONFIG_USB_PULSE8_CEC=y
CONFIG_AGP=y
CONFIG_AGP_INTEL=y
CONFIG_DRM=y
CONFIG_DRM_I915=y
CONFIG_DRM_VIRTIO_GPU=y
CONFIG_DRM_BOCHS=y
CONFIG_FB=y
CONFIG_FB_VESA=y
CONFIG_FB_EFI=y
CONFIG_FIRMWARE_EDID=y
CONFIG_SOUND=y
CONFIG_SND=y
CONFIG_SND_HDA_INTEL=y
CONFIG_SND_HDA_HWDEP=y
CONFIG_SND_HDA_INPUT_BEEP=y
CONFIG_SND_HDA_PATCH_LOADER=y
CONFIG_SND_HDA_CODEC_REALTEK=y
CONFIG_SND_HDA_CODEC_ANALOG=y
CONFIG_SND_HDA_CODEC_SIGMATEL=y
CONFIG_SND_HDA_CODEC_VIA=y
CONFIG_SND_HDA_CODEC_HDMI=y
CONFIG_SND_HDA_CODEC_CIRRUS=y
CONFIG_SND_HDA_CODEC_CS8409=y
CONFIG_SND_HDA_CODEC_CONEXANT=y
CONFIG_SND_HDA_CODEC_SENARYTECH=y
CONFIG_SND_HDA_CODEC_CA0110=y
CONFIG_SND_HDA_CODEC_CA0132=y
CONFIG_SND_HDA_CODEC_SI3054=y
CONFIG_SND_HDA_INTEL_HDMI_SILENT_STREAM=y
CONFIG_SND_HDA_CTL_DEV_ID=y
CONFIG_USB_XHCI_HCD=y
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_UHCI_HCD=y
CONFIG_USB_STORAGE=y
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_INPUT=y
CONFIG_VIRTIO_MMIO=y
CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
# CONFIG_SURFACE_PLATFORMS is not set
CONFIG_VIRTIO_IOMMU=y
CONFIG_EXT4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=y
CONFIG_VIRTIO_FS=y
CONFIG_ISO9660_FS=y
CONFIG_JOLIET=y
CONFIG_ZISOFS=y
CONFIG_UDF_FS=y
CONFIG_VFAT_FS=y
CONFIG_NTFS_FS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_SQUASHFS=y
CONFIG_NFS_FS=y
CONFIG_CIFS=y
CONFIG_CRC_CCITT=m
CONFIG_UNWINDER_FRAME_POINTER=y

--kenitram-01aeb136-de54-41c5-8b6d-6b01b8fa5129
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=pc_x86_64_efi_defconfig

BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_INIT_SYSTEMD=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
BR2_ROOTFS_USERS_TABLES="user_table.txt"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
BR2_ROOTFS_POST_FAKEROOT_SCRIPT="test.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="defconfig"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_KODI_ALSA_LIB=y
BR2_PACKAGE_KODI_AVAHI=y
BR2_PACKAGE_KODI_BLUEZ=y
BR2_PACKAGE_KODI_DBUS=y
BR2_PACKAGE_KODI_EVENTCLIENTS=y
BR2_PACKAGE_KODI_LIBBLURAY=y
BR2_PACKAGE_KODI_LIBCEC=y
BR2_PACKAGE_KODI_LCMS2=y
BR2_PACKAGE_KODI_LIBMICROHTTPD=y
BR2_PACKAGE_KODI_LIBNFS=y
BR2_PACKAGE_KODI_MYSQL=y
BR2_PACKAGE_KODI_PULSEAUDIO=y
BR2_PACKAGE_KODI_OPTICALDRIVE=y
BR2_PACKAGE_PULSEAUDIO_DAEMON=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_LLVM=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_LINUX_FIRMWARE=y
BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9170=y
BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3168=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2B=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265D=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8000C=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8265=y
BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73=y
BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX=y
BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=y
BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=y
BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX=y
BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
BR2_PACKAGE_ACPID=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON3_PY_PYC=y
BR2_PACKAGE_LIBVA_INTEL_DRIVER=y
BR2_PACKAGE_CONNMAN=y
BR2_PACKAGE_CONNMAN_CLIENT=y
BR2_PACKAGE_ETHTOOL=y
BR2_PACKAGE_OPENSSH=y
BR2_PACKAGE_WIRELESS_REGDB=y
BR2_PACKAGE_WPA_SUPPLICANT=y
BR2_PACKAGE_WPA_SUPPLICANT_DBUS=y
BR2_PACKAGE_VIM=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="1G"
# BR2_TARGET_ROOTFS_TAR is not set
BR2_TARGET_GRUB2=y
BR2_TARGET_GRUB2_X86_64_EFI=y
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y

--kenitram-01aeb136-de54-41c5-8b6d-6b01b8fa5129
Content-Type: application/x-shar
Content-Disposition: attachment; filename=test.sh
Content-Transfer-Encoding: quoted-printable

#!/bin/bash

root_path=3D"$1"
run_as_root=3D1

if [ ${run_as_root} -eq 1 ]; then
	echo -e "home\t/home/streamer\tvirtiofs\tdefaults,rw\t0 0" >> ${root_path=
}/etc/fstab
	sed -i "s/^After =3D /After =3D root.mount /g" ${root_path}/usr/lib/syste=
md/system/kodi.service=20
	sed -ie "s/\[Service\]/[Service]\nEnvironment =3D \"HOME=3D\/root\"/g" ${=
root_path}/usr/lib/systemd/system/kodi.service
else
	sed -ie "s/\[Service\]/[Service]\nUser =3D streamer\nEnvironment =3D \"HO=
ME=3D\/home\/streamer\"/g" ${root_path}/usr/lib/systemd/system/kodi.servic=
e
fi

--kenitram-01aeb136-de54-41c5-8b6d-6b01b8fa5129
Content-Type: text/plain
Content-Disposition: attachment; filename=user_table.txt

streamer 1002 streamer 1002 =foo /home/streamer /bin/bash dialout,cdrom,video,audio,avahi,plugdev,wheel Streamer User

--kenitram-01aeb136-de54-41c5-8b6d-6b01b8fa5129
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--kenitram-01aeb136-de54-41c5-8b6d-6b01b8fa5129--

