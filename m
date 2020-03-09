From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Mar 2020 08:26:52 +0100
Subject: [Buildroot] Buildroot 2020.02 released
Message-ID: <87v9neq98j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2020.02 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2020.02.tar.gz

or

http://buildroot.net/downloads/buildroot-2020.02.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

Again a very active development cycle with more than 1600 changes and
contributions from more than 120 unique contributors!

Of noteworthy new features/changes we have:

- Add experimental support for building with a per-package target and
  host directory. This still has some rough edges, but brings a number
  of advantages:

  - Packages will only be able to access the explicitly listed
    dependencies and not any other packages that happen to be built
    before, ensuring correct dependency information in Buildroot.

  - Possibility for top-level parallel builds, speeding up builds on
    multicore machines.

- Architecture: Add support for ARC-HS38 with 64bit multiplier variant,
  allow building glibc for big endian ARC, handle 16KB MMU page size for
  ARC in toolchain wrapper.

- Toolchain: Add binutils 2.33.1, GCC 7.5.0, Arm 9.2-2019.12 toolchains,
  ARC 2019.09 toolchain. Allow using custom kernel headers newer than
  what is known by Buildroot.

- pkg-stats: Support for CVE vulnerability reporting by comparing to NVD
  database.

- Util-linux: Ensure that hwclock is built without GPLv3 code. Notice
  that builds with hwclock has contained GPLv3-licensed code since
  util-linux 2.30 (Buildroot 2017.08+)

- New defconfigs: Beelink GS1, Raspberrypi4 64bit

- New packages: alura, avro-c, bubblewrap, cctz, cereal, qcpuburn-arm,
  elixir, erlang-base64url, erlang-idna, erlang-jose, erlang-p1-acme,
  erlang-p1-mqtree, erlang-p1-yconf, fluid-soundfont, fluidsynth,
  gcnano-binaries, gensio, glslsandbox-player, libargon2,
  libmodsecurity, libpam-nfc, libtelnet, lua-codegen, lua-livr,
  lua-livr-extra, lua-rotas, lua-silva, mfoc, network-manager-openvpn,
  nginx-modsecurity, perl-crypt-openssl-aes, perl-math-prime-util,
  pipewire, ptm2human, python-aenum, python-aiohttp-debugtoolbar,
  python-aiohttp-mako, python-aiologstash, python-aiosignal,
  python-aiozipkin, python-async-lru, python-avro, python-bunch,
  python-crontab, python-dnspython, python-entrypoints, python-esptool,
  python-frozenlist, python-future, python-gitdb, python-janus,
  python-lockfile, python-logstash, python-nested-dict, python-pbr,
  python-pyaes, python-pydantic, python-smmap2, python-sockjs,
  python-zc-lockfile, raspi-gpio, rocksdb, sdbusplus, spidermonkey,
  thermald, ti-sgx-libgbm, tinyssh, tio, umtprd, weston-imx,
  wireguard-linux-compat, wireguard-tools, xdg-dbus-proxy

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2020.02

Upgrading from 2019.02.x:

In addition to these changes, for people upgrading from 2019.02.x the
most noteworthy changes since that release are:

- Dependencies: Gcc/g++ 4.8 or newer is now required on the build host.

- Br2-external: Add support for injecting additional options to the list
  of preconfigured external toolchains and libjpeg and openssl providers
  using files under provides/. See the manual for details.

- Br2-external: Linux kernel extensions can now also be provided in an
  external tree by adding packages under linux/linux-ext-*.mk. See the
  manual for details.

- Infrastructure: show-info and <pkg>-show-info make targets
  added to output package metadata in JSON format for external
  use.

- Fakeroot now works correctly under Microsoft Windows 10 Services for
  Linux, which does not provide SYSV IPC support

- Removed packages: alljoyn, alljoyn-base, alljoyn-tcl-base,
  bluez_utils, celt051, devmem2, erlang-p1-iconv, eventlog, fis,
  gadgetfs-test, gstreamer, gst-ffmpeg, gst-fsl-plugins, gst-omapfb,
  gst-plugins-bad, gst-plugins-base, gst-plugins-good, gst-plugins-ugly,
  kodi-audiodecoder-opus, kodi-screensaver-planestate,
  kodi-visualisation-waveforhue, libamcodec, libplayer, libump, lunit,
  odroid-mali, odroid-scripts, perl-digest-md5, perl-mime-base64,
  perl-net-ping, python-pysnmp-apps, python-scapy3k, riscv-pk, sunxi-mali,
  ustr, wireguard, xapp_mkfontdir

Future:

This release will be become our new long term support releases, which
means it will be supported with security and other important fixes until
2021.02 is out. The previous 2019.02.x LTS release will see atleast one
more update before it becomes EOL in April, so start migration to
2020.02 soon.

The next release will be 2020.05. Expect the first release candidate
in early May and the final release at the end of the month.

-- 
Bye, Peter Korsgaard
