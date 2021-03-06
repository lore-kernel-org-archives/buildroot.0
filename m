From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 06 Mar 2021 22:59:32 +0100
Subject: [Buildroot] Buildroot 2021.02 released
Message-ID: <87mtvg6j0b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2021.02 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2021.02.tar.gz

or

http://buildroot.net/downloads/buildroot-2021.02.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

Again a very active development cycle with more than 1600 changes and
contributions from more than 120 unique contributors!

Of noteworthy new features/changes we have:

- Toolchain: Default to binutils 2.35.2, add 2.36.1, drop 2.33.x. Fix
  GCC 10.x ARC adc/sbc pattern handling, Update ARM toolchains to
  10.2-2020.11 release.

- Vulnerability scanning: The CVE checking logic has been extended to
  match packages based on CPE (Common Platform Enumeration) IDs for more
  accurate matching, and CPE identifiers have been added for a large
  amount of packages.

- Download: Rework the tarball creation logic (E.G. when a package is
  fetched from a git/svn repo) to no longer require a host-tar <=
  1.29. To differ between the old and the new format, the new tarballs
  have gained a -br1 suffix (<pkg>-<version>-br1.tar.gz).

- SELinux support: A significant number of packages now pull in the
  relevant refpolicy modules when enabled.

- New defconfigs: arrow avenger96, bananapi M1+, microchip sam9x60ek,
  pine64 rock64

- New packages: balena-engine, casync, coremark, coremark-pro,
  datatables, datatables-buttons, datatables-fixedcolumns,
  datatables-responsive, delve, frotz, gkrellm, inih, jszip, libgeos,
  libiec61850, libmdbx, lualdap, neofetch, nvidia-modprobe, open62541,
  perl-devel-cycle, perl-devel-size, perl-extutils-pkgconfig,
  perl-math-int64, ply, popperjs, python-bleak, python-defusedxml,
  python-pycups, python-pytest-asyncio, python-typing-extensions,
  qcom-db410c-firmware, qt5coap, qt5knx, qt5mqtt, quickjs,
  rcw-smarc-sal28, screenfetch, ssdp-responder, tpm2-pkcs11, wqy-zenhei,
  xorcurses

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2021.02

Upgrading from 2020.02.x:

In addition to these changes, for people upgrading from 2019.02.x the
most noteworthy changes since that release are:

 - Support for GCC 10.x, addition of Bootlin external toolchains, Glibc
   2.32, musl 1.2.2, uClibc-ng 1.0.37

 - Support for gobject-introspection: both the gobject-introspection
   package itself, but also introspection support was enabled in a
   number of other packages.

 - SELinux support improvements: File security contexts are now set when
   the file systems are created, so there is no need to run restorecon on
   first boot / read only rootfs is supported.  An optimized / stripped
   refpolicy SELinux policy is now used. Packages can enable additional
   refpolicy modules using <pkg>_SELINUX_MODULES.

 - Addition of support for the apparmor Linux security module, by
   adding the necessary user-space packages.

 - Addition of a qmake package infrastructure, now used by most
   Qt-related packages.

 - The Luarocks package infrastructure has been extended to
   support build host packages.

 - The package infrastructure was improved to allow each package
   to indicate the Linux kernel configuration options it needs.

 - Architectures: Support for IBM s390x

 - 'make pkg-stats' can now be used to output information about the
   packages enabled in a Buildroot configuration, including checking for
   known CVEs. Output is provided in both HTML and JSON format for
   viewing and easy post processing.

 - Go: Modules handling. The module name must be specified using
   <pkg>_GOMOD.

 - BR2_EXTERNAL: Support for defining filesystem skeletons and init
   system packages in external trees.

Future:

This release will be become our new long term support releases, which
means it will be supported with security and other important fixes until
2022.02 is out. The previous 2020.02.x LTS release will see atleast one
more update before it becomes EOL in April, so start migration to
2021.02 soon.

The next release will be 2021.05. Expect the first release candidate
in early May and the final release at the end of the month.

-- 
Bye, Peter Korsgaard
