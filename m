From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 Feb 2021 22:06:08 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20210208204524.9C7A3836E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b8331fd6a35eec6063e698c3b3661fb26f4fc53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/CHANGES b/CHANGES
index 733951d6eb..56c09ecb7b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,54 @@
+2021.02-rc1, not yet released
+
+	Fixes all over the tree and new features.
+
+	Toolchain: Default to binutils 2.35.2, add 2.36.1, drop
+	2.33.x. Fix GCC 10.x ARC adc/sbc pattern handling, Update ARM
+	toolchains to 10.2-2020.11 release.
+
+	Architectures: ARC: add support for generic HS48 processor,
+	PPC: drop PPC601 support, which was removed from Linux 5.10.
+
+	Vulnerability scanning: The CVE checking logic has been
+	extended to match packages based on CPE (Common Platform
+	Enumeration) IDs for more accurate matching, and CPE
+	identifiers have been added for a large amount of packages.
+
+	Download: Rework the tarball creation logic (E.G. when a
+	package is fetched from a git/svn repo) to no longer require a
+	host-tar <= 1.29. To differ between the old and the new
+	format, the new tarballs have gained a -br1 suffix
+	(<pkg>-<version>-br1.tar.gz).
+
+	New defconfigs: arrow avenger96, bananapi M1+, microchip
+	sam9x60ek, pine64 rock64
+
+	Removed defconfigs: QEMU ppc virtex-ml507
+
+	New packages: balena-engine, casync, coremark, coremark-pro,
+	datatables, datatables-buttons, datatables-fixedcolumns,
+	datatables-responsive, delve, frotz, gkrellm, inih, jszip,
+	libgeos, libiec61850, libmdbx, lualdap, neofetch,
+	nvidia-modprobe, open62541, perl-devel-cycle, perl-devel-size,
+	perl-math-int64, ply, popperjs, python-bleak,
+	python-defusedxml, python-pycups, python-pytest-asyncio,
+	python-typing-extensions, qcom-db410c-firmware, qt5coap,
+	qt5knx, qt5mqtt, quickjs, rcw-smarc-sal28, screenfetch,
+	ssdp-responder, tpm2-pkcs11, wqy-zenhei, xorcurses
+
+	Removed packages: audiofile, boa, ipsec-tools, libupnp18,
+	ti-sgx-libgdbm
+
+	Renamed rcw package to qoriq-rcw
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13316: beaglebone_qt5_defconfig: PowerVR fails to start
+	#13416: dhcpcd start warning message: no such user dhcpcd
+	#13456: ccache prevents build
+	#13471: package/mpd/mpd.conf make use of path not created
+	#13506: BR2_PACKAGE_DHCPCD missing directory creation
+
 2020.11.2, released January 31st, 2021
 
 	Important / security related fixes.
