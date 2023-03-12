Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA172C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 20:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 637BA819F5;
	Sun, 12 Mar 2023 20:54:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 637BA819F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1zlyZTgSpEfv; Sun, 12 Mar 2023 20:54:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AA9D819BE;
	Sun, 12 Mar 2023 20:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AA9D819BE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51A8E1BF4E3
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 20:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3895060C11
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 20:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3895060C11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SLL4anbeGkWI for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 20:54:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C45BC60BA9
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C45BC60BA9
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 20:54:48 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C87F91BF205
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 20:54:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1pbSiK-00B5Nn-SA
 for buildroot@buildroot.org; Sun, 12 Mar 2023 21:54:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 21:54:44 +0100
Message-ID: <87pm9dy9kb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2023.02 released
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

Buildroot 2023.02 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2023.02.tar.gz

or

http://buildroot.net/downloads/buildroot-2023.02.tar.xz

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

Again a quite active development cycle with almost 1700 changes and
contributions from 108 unique contributors!

Of noteworthy new features/changes we have:

Toolchain:

- The check for access to "unsafe" (E.G. from the build host) header
  files and libraries by the cross compiler is now unconditionally
  enabled.

- Bootlin external toolchains updated to 2022.08

- The handling of the CCACHE_* environment variables by the toolchain
  wrapper is now more strict, causing the variables to only be exported
  when BR2_CCACHE is enabled.

Infrastructure:

- Br2-external: Fix make performance issue when many (> 6) external
  trees are used together.

- Legal-info: Stop warning about not saving sources for local / override
  packages if <PKG>_REDISTRIBUTE is set to NO.

- Go: Ensure our go build and module cache is used, even for the
  download step.

- Cargo: CARGO_HOME (the location where cargo stores its downloaded
  artifacts) is now located under DL_DIR rather than in
  HOST_DIR/share/cargo, ensuring it is shared between builds.

Misc:

- Erofs: Use fixed timestamp and UUID when BR2_REPRODUCIBLE is used.

- Ext2: Year 2038+ compatible inodes are now used by default,
  independently of the filesystem size.

- A large number of NXP related packages and defconfigs have been
  updated as upstream moved the git repositories to Github.

- New defconfigs: i.MX8mn BSH SMM S2 / pro, QEMU ARM EBBR, Sipeed Lichee
  rv / rv dock, Starfive Visionfive2, Xilinx Versal VCK190.

- New packages: atkmm2_28, cairomm1_14, catch2, cli11, dotconf,
  edk2-non-osi, fluent-bit, fxdiv, glibmm2_66, hddtemp, highway,
  imx-vpu-hantro-daemon, libjxl, libsigc2, libsolv, libunibreak,
  neon-2-sse, open-iscsi, opencv4-contrib, pangomm2_46, perftest,
  perl-image-exiftool, python-apispec, python-async-generator,
  python-cppy, python-dbus-fast, python-dicttoxml2,
  python-flask-smorest, python-glslang, python-h11, python-hkdf,
  python-magic-wormhole, python-magic-wormhole-mailbox-server,
  python-magic-wormhole-transit-relay, python-marshmallow, python-munch,
  python-outcome, python-pycrate, python-pyspnego, python-reedsolo,
  python-selenium, python-smbprotocol, python-sniffio, python-spake2,
  python-trio, python-trio-websocket, python-uhid, python-webargs,
  python-wsproto, qt5speech, qt6serialbus, rdma-core, reproc,
  rtl8723ds-bt, rtl8821cu, sexpect, speechd, sscep, stb, sway,
  termcolor, ti-k3-r5-loader, tl-expected, unifdef, versal-firmware,
  xwayland, z3

- Removed packages: docker-proxy, elixir, gummiboot, python-bunch,
  python-m2r, sun20i-d1-spl, uccp420wlan, ucl,
  xdriver_xf86-input-keyboard, xdriver_xf86-video-glint,
  xdriver_xf86-video-imx-viv, xdriver_xf86-video-tga

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2023.02

Upgrading from 2022.02.x:

In addition to these changes, for people upgrading from 2022.02.x the
most noteworthy changes since that release can be seen in the
announcements for 2022.05, 2022.08 and 2022.11:

2022.05: http://lists.busybox.net/pipermail/buildroot/2022-June/644349.html
2022.08: http://lists.busybox.net/pipermail/buildroot/2022-September/650852.html
2022.11: http://lists.busybox.net/pipermail/buildroot/2022-December/656980.html

Future:

This release will be become our new long term support releases, which
means it will be supported with security and other important fixes until
2024.02 is out. The previous 2022.02.x LTS release will see atleast one
more update before it becomes EOL in April, so start migration to
2023.02 soon.

The next release will be 2023.05. Expect the first release candidate
in early May and the final release at the end of the month.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
