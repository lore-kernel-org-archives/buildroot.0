Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18201C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 11:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC14A41878;
	Tue, 19 Apr 2022 11:30:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nBaTb0C4C-Ro; Tue, 19 Apr 2022 11:30:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 471E1402AD;
	Tue, 19 Apr 2022 11:30:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6897F1BF8A8
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 11:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65AA68290B
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 11:30:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XBgbdZAdujQi for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 11:30:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A776B82AF8
 for <buildroot@uclibc.org>; Tue, 19 Apr 2022 11:30:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id D528783694; Tue, 19 Apr 2022 11:20:31 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 19 Apr 2022 11:30:30 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: joerg.hering@macgregor.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone attachments.created
Message-ID: <bug-14766-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14766] New: package dhcp on buildroot 2022.02.1
 failed
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

https://bugs.busybox.net/show_bug.cgi?id=14766

            Bug ID: 14766
           Summary: package dhcp on buildroot 2022.02.1 failed
           Product: buildroot
           Version: unspecified
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: joerg.hering@macgregor.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Created attachment 9291
  --> https://bugs.busybox.net/attachment.cgi?id=9291&action=edit
buildlog dhcp

the package dhcp cannot build for buildroot 2022.02.1
the target is a aarch64 processor (NXP LS1046A)

/home/Public/BuildRoot/Machine/mdp-ls1046s510/build/dhcp-4.4.2-P1/bind/bind-9.11.14/lib/dns/include/dns/types.h:230:10:
schwerwiegender Fehler: dns/enumtype.h: Datei oder Verzeichnis nicht gefunden
  230 | #include <dns/enumtype.h> /* Provides dns_rdatatype_t. */
      |          ^~~~~~~~~~~~~~~~
Kompilierung beendet.
make[4]: *** [Makefile:241: aclconf.lo] Fehler 1

for details see dhcpfailed.txt

the buildroot host is 

Linux 05-johe-pc 5.13.0-39-generic #44~20.04.1-Ubuntu SMP Thu Mar 24 16:43:35
UTC 2022 x86_64 x86_64 x86_64 GNU/Linux

the config is here

BR2_aarch64=y
BR2_cortex_a72=y
BR2_OPTIMIZE_2=y
BR2_SSP_REGULAR=y
BR2_RELRO_PARTIAL=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TARGET_GENERIC_HOSTNAME="MDP-LS1046"
BR2_TARGET_GENERIC_ISSUE="Welcome to Maritime Data Processor ..."
BR2_TARGET_GENERIC_PASSWD_SHA512=y
BR2_INIT_SYSTEMD=y
BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES=y
BR2_TARGET_GENERIC_ROOT_PASSWD="1234"
BR2_SYSTEM_BIN_SH_BASH=y
BR2_TARGET_GENERIC_GETTY_PORT="tty0"
BR2_SYSTEM_DHCP="eth1"
BR2_ROOTFS_USERS_TABLES="$(BR2_EXTERNAL_ISM_PATH)/board/is/MDP-LS1046/users.txt"
BR2_ROOTFS_OVERLAY="$(BR2_EXTERNAL_ISM_PATH)/board/is/MDP-LS1046/ofsd"
BR2_ROOTFS_POST_BUILD_SCRIPT="$(BR2_EXTERNAL_ISM_PATH)/board/is/MDP-LS1046/post_build_s.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="$(BR2_EXTERNAL_ISM_PATH)/board/is/MDP-LS1046/post_image_s.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Freescale/linux-fslc"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="5.10-2.1.x-imx"
BR2_LINUX_KERNEL_PATCH="$(BR2_EXTERNAL_ISM_PATH)/patches/linux/0001-linux-up510.patch"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(BR2_EXTERNAL_ISM_PATH)/board/is/MDP-LS1046/linux-up510.config"
BR2_LINUX_KERNEL_IMAGEGZ=y
BR2_LINUX_KERNEL_XZ=y
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1046a-mdp-sdk"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_LINUX_TOOLS_GPIO=y
BR2_PACKAGE_LINUX_TOOLS_PCI=y
BR2_PACKAGE_BUSYBOX_CONFIG="$(BR2_EXTERNAL_ISM_PATH)/board/is/MDP-LS1046/busybox.config"
BR2_PACKAGE_XZ=y
BR2_PACKAGE_LSOF=y
BR2_PACKAGE_JQ=y
BR2_PACKAGE_E2FSPROGS=y
BR2_PACKAGE_MMC_UTILS=y
BR2_PACKAGE_DBUS_TRIGGERD=y
BR2_PACKAGE_GPSD=y
BR2_PACKAGE_GPSD_DEVICES="/dev/ttyUSB1"
BR2_PACKAGE_GPSD_SQUELCH=y
BR2_PACKAGE_HWDATA=y
BR2_PACKAGE_HWDATA_IAB_OUI_TXT=y
BR2_PACKAGE_HWDATA_PNP_IDS=y
BR2_PACKAGE_LM_SENSORS=y
BR2_PACKAGE_LM_SENSORS_FANCONTROL=y
BR2_PACKAGE_LM_SENSORS_PWMCONFIG=y
BR2_PACKAGE_PARTED=y
BR2_PACKAGE_PCIUTILS=y
BR2_PACKAGE_RNG_TOOLS=y
BR2_PACKAGE_SMARTMONTOOLS=y
BR2_PACKAGE_UBOOT_TOOLS=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON3_SQLITE=y
BR2_PACKAGE_PYTHON_GOBJECT=y
BR2_PACKAGE_PYTHON_PIP=y
BR2_PACKAGE_PYTHON_PYTEST=y
BR2_PACKAGE_BEECRYPT=y
BR2_PACKAGE_LIBSSH=y
BR2_PACKAGE_LIBSSH2=y
BR2_PACKAGE_LIBOPENSSL_BIN=y
BR2_PACKAGE_LIBOPENSSL_ENGINES=y
BR2_PACKAGE_CAIRO_PS=y
BR2_PACKAGE_CAIRO_SVG=y
BR2_PACKAGE_PANGO=y
BR2_PACKAGE_LIBAIO=y
BR2_PACKAGE_LIBSERIALPORT=y
BR2_PACKAGE_LIBUSB=y
BR2_PACKAGE_LIBNETFILTER_ACCT=y
BR2_PACKAGE_LIBNETFILTER_LOG=y
BR2_PACKAGE_LIBURIPARSER=y
BR2_PACKAGE_LIBATOMIC_OPS=y
BR2_PACKAGE_LIBDAEMON=y
BR2_PACKAGE_LIBICAL=y
BR2_PACKAGE_LIBEDIT=y
BR2_PACKAGE_NEWT=y
BR2_PACKAGE_ONIGURUMA=y
BR2_PACKAGE_PCRE2=y
BR2_PACKAGE_TCLAP=y
BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO=y
BR2_PACKAGE_CONNTRACK_TOOLS=y
BR2_PACKAGE_DHCP=y
BR2_PACKAGE_DHCP_SERVER=y
BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK=y
BR2_PACKAGE_DHCP_RELAY=y
BR2_PACKAGE_DHCP_CLIENT=y
# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
BR2_PACKAGE_IPROUTE2=y
BR2_PACKAGE_IPSET=y
BR2_PACKAGE_MODEM_MANAGER_LIBMBIM=y
BR2_PACKAGE_MODEM_MANAGER_LIBQMI=y
BR2_PACKAGE_NETWORK_MANAGER=y
BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER=y
BR2_PACKAGE_NFTABLES=y
BR2_PACKAGE_NTP=y
# BR2_PACKAGE_NTP_NTPD is not set
BR2_PACKAGE_OPENSSH=y
BR2_PACKAGE_OPENVPN=y
BR2_PACKAGE_OPENVPN_SMALL=y
BR2_PACKAGE_PPPD=y
BR2_PACKAGE_RPCBIND=y
BR2_PACKAGE_TCPDUMP=y
BR2_PACKAGE_POLICYCOREUTILS=y
BR2_PACKAGE_REFPOLICY=y
BR2_PACKAGE_REFPOLICY_POLICY_STATE_DISABLED=y
BR2_PACKAGE_AT=y
BR2_PACKAGE_BASH_COMPLETION=y
BR2_PACKAGE_FILE=y
BR2_PACKAGE_SUDO=y
BR2_PACKAGE_ACL=y
BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE=y
BR2_PACKAGE_SYSTEMD_FIRSTBOOT=y
# BR2_PACKAGE_SYSTEMD_HWDB is not set
BR2_PACKAGE_SYSTEMD_LOGIND=y
# BR2_PACKAGE_SYSTEMD_MYHOSTNAME is not set
# BR2_PACKAGE_SYSTEMD_NETWORKD is not set
BR2_PACKAGE_SYSTEMD_POLKIT=y
BR2_PACKAGE_SYSTEMD_RANDOMSEED=y
BR2_PACKAGE_SYSTEMD_RFKILL=y
BR2_PACKAGE_SYSTEMD_SYSUSERS=y
# BR2_PACKAGE_SYSTEMD_VCONSOLE is not set
BR2_PACKAGE_UTIL_LINUX_LIBFDISK=y
BR2_PACKAGE_UTIL_LINUX_UUIDD=y
BR2_PACKAGE_MC=y
BR2_TARGET_ROOTFS_CPIO=y
BR2_TARGET_ROOTFS_CPIO_XZ=y
BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_E2FSPROGS=y
BR2_PACKAGE_HOST_GENEXT2FS=y
BR2_PACKAGE_HOST_QORIQ_RCW=y
BR2_GENERIC_HW_MDP1046=y
BR2_PACKAGE_INTERSCHALT=y
BR2_PACKAGE_IS_PLATFORMD=y
BR2_PACKAGE_IS_NVRAM=y
BR2_PACKAGE_PYADDITIONALS=y
BR2_PACKAGE_PYTHON_MENDER=y
BR2_PACKAGE_PYTHON_UFW=y
BR2_PACKAGE_MCG=y
BR2_PACKAGE_MCG_WEBCONFIG=y
BR2_PACKAGE_MCG_WEB_BACKEND=y

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
