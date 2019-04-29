From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Apr 2019 11:52:17 +0200
Subject: [Buildroot] Buildroot 2019.02.2 released
Message-ID: <875zqxrve6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2019.02.2 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2019.02.2.tar.gz

or

http://buildroot.org/downloads/buildroot-2019.02.2.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2019.02.2 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2019.02.1 release.

- Linux: Also build default make target to ensure extra files like the
  gdb scripts enabled by CONFIG_GDB_SCRIPTS are also built. Notice: This
  may mean that extra host utilities like uboot-mkimage are needed.

- Only build host-lzip / host-xz when really needed by packages,
  not just when not available on the build host.

- fs: Set FAKEROOTDONTTRYCHOWN environment variable to not forward
  {f,l,}chown calls to libc when running under fakeroot to fix issues
  when building in restricted environments (E.G. user namespace with
  bubblewrap).

- Security fixes for apache, bind, cjson, dovecot, freerdp, ghostscript,
  gnutls, go, hostapd, libpng, libxslt, live555, php, python-urllib3,
  python3, rpm, ruby, samba4, sane-backends, stunnel, thttpd, tiff,
  wget, wpa_supplicant, znc

- Fixes for download/compilation/runtime issues in android-tools,
  binutils, civetweb, copas, davfs2, docker-cli, docker-engine,
  docker-containerd, gerbera, git, gst-omx, gst1-plugins-ugly, haproxy,
  ipsec-tools, libfreefare, libfuse, libkrb5, linknx, linux,
  linux-tools, lldpd, lrzsz, lynx, madplay, make, minicom, mongodb,
  musl, mutt, neon, netsnmp, opus, perl, postgresql, pure-ftpd, qt5base,
  rapidxml, runc, softether, stunnel, syslinux, syslog-ng,
  systemd-bootchart, tor, tpm2-tools, tpm2-tss, webkitgtk, wsapi,
  xapp_xfd, xapp_xload, xlib_libXpm, xserver_xorg-server, xz,
  yaffs2utils

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2019.02.2

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2019.02.1..

    49  Fabrice Fontaine
    41  Peter Korsgaard
    11  Thomas Petazzoni
     6  Bernd Kuhls
     6  Giulio Benetti
     3  Adam Duskett
     3  Francois Perrad
     3  Max Filippov
     3  Romain Naour
     2  Carlos Santos
     2  Christian Stewart
     2  Nityananda Padhan
     2  Norbert Lange
     2  Shyam Saini
     2  Yann E. MORIN
     1  Alexey Brodkin
     1  Alexey Lukyanchuk
     1  Angelo Compagnucci
     1  Anisse Astier
     1  Arnout Vandecappelle (Essensium/Mind)
     1  Baruch Siach
     1  David Lechner
     1  J?rg Krause
     1  Matt Flax
     1  Samuel Mendoza-Jonas
     1  Stuart Summers
     1  S?rensen, Stefan
     1  Thomas De Schampheleire
     1  Vadim Kochan

-- 
Bye, Peter Korsgaard
