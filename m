From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Jan 2013 14:46:01 +0100
Subject: [Buildroot] [PATCH 1/3] Makefile: export BR2_CONFIG_FILE,
	pointing to our .config
In-Reply-To: <50EC1A1B.5080804@mind.be>
References: <cover.1357595083.git.yann.morin.1998@free.fr>
 <201301081351.38832.yann.morin.1998@free.fr> <50EC1A1B.5080804@mind.be>
Message-ID: <201301081446.01172.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Tuesday 08 January 2013 14:07:39 Arnout Vandecappelle wrote:
> On 08/01/13 13:51, Yann E. MORIN wrote:
> > On Tuesday 08 January 2013 07:50:51 Arnout Vandecappelle wrote:
> >> On 07/01/13 22:52, Yann E. MORIN wrote:
> > [--SNIP--]
> >>> +# Scripts in support/ may need to parse out .config, so give
> >>> +# them easy access
> >>> +export BR2_CONFIG_FILE=$(CONFIG_DIR)/.config.
> >>
> >>    Convention is that BR2_* is set by Kconfig. I kind of like that, it
> >> helps us developers to understand a variable's meaning.
> >
> > I am afraid CONFIG_FILE as is could clash with some packages.
> > Maybe DOT_CONFIG instead? I'll use that.
> 
>   DOT_CONFIG is equally likely to conflict.
> 
>   (None of our own files use CONFIG_FILE, cfr. 'git grep -w CONFIG_FILE').

I was not referring to our .mk files, but rather to the packages themselves.
I did a quick survey in 110+ packages, and:
  - kconfig-based packages are not affected: kernel, uClibc, busybox, ct-ng
  - packages using CONFIG_FILE:
    - gdb:     gdb/sim/ppc/Makefile.in:CONFIG_FILE = @sim_config@
    - xbmc:    xbmc/lib/freetype/builds/detect.mk:ifndef CONFIG_FILE
  - no package uses DOT_CONFIG
  - openbricks is using DOT_CONFIG, too

List of tested packages in attached file, searched for with:
    grep --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn  \
         -r -E '\<(CONFIG_FILE|DOT_CONFIG)\>' * 2>/dev/null

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
-------------- next part --------------
aboriginal
Android
aports
Archipel
autoconf
automake
bencode-tools
binutils
bitfield
bizou
btrfs-progs
buildroot
buildroot-test
busybox
CEGUI
ceph
cloog
cloog-ppl
config
curl
debtree
ditaa
dokuwiki
dpkg-repack
dtc
dvb-apps
dvcs-autosync
e2fsprogs
eglibc
fakeroot
fakerootng
fast-export
feh
firefox-sync-server
force_bind
freelan-all
gcc
gdb
gentoo
giblib
git
gitdm
glibc
gmailfs
Gource
hg
infobot
irker
kexec-tools
klibc
kmod
libiscsi
LibLime-Koha
libmtp
libseccomp
libssh2
libtirpc
libtool
libvirt
lighttpd
lima
linux
linux-firmware
liquidprompt
ltrace
mpfr
mplayer2
nilfs2-utils
oe
openbricks
openocd
openwrt
owncloud
pam_usb
paperwork
patchelf
patchwork
petitboot
PhotoShow
pkgxx
ppl
python-virtinst
qcontrol
qemu
raspberrypi-firmware
retroshare
rofs
rpi-userland
sane-backends
sane-frontends
sd
send-patches-org
shim
showtime
sim1
smbnetfs
smem
snipmate.vim
socat
spice
squashfs-tools
sshuttle
stgit
synergy
tinyproxy
toybox
tslib
tvheadend
tz
tz-history-scripts
u-boot
uClibc
uClibc++
unetbootin
unionfs-fuse
vash
virt-manager
virt-viewer
weird-compiler
xbmc
Xpra
xz
zbar
