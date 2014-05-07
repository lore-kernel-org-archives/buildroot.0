From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Wed, 7 May 2014 10:26:49 -0500
Subject: [Buildroot] Packages Missing License Information
Message-ID: <OFDB06073D.7A986E79-ON86257CD1.0054D967-86257CD1.0054DA94@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

With my recent submission of patches to fix missing license information, I 
was curious to see how many packages are missing licensing information. I 
have found that we are missing licensing information on 186 packages 
according to my basic grep command. The command I used to get 186 is as 
follows:

git grep -L "_LICENSE" package/*/*.mk | wc -l

Granted, this command isn't perfect and there are probably already some 
packages that have license information defined in a subdirectory 
(specifically thinking of gcc). However, I think that it gives a good idea 
of how many packages are missing license files.

I will try to update license information for these files as times permits 
but I thought I would share the list of packages that I found don't have 
license information for them. The command I used is:

git grep -L "_LICENSE" package/*/*.mk | cut -d '/' -f2 | tr '\n' ' '

The list of packages:

acl alsamixergui at attr blackbox bmon bonnie bootutils bsdiff can-utils 
cloop crosstool-ng cryptodev cvs dbus-glib dbus-python devmem2 dfu-util 
dhrystone dmraid doom-wad eeprog efl elftosb explorercanvas ezxml fconfig 
feh fis flac freescale-imx gadgetfs-test gcc genromfs giblib 
glib-networking gob2 gptfdisk gqview grantlee gstreamer gstreamer1 
gtk2-engines gtk2-themes gtkperf gvfs heirloom-mailx hwdata input-tools 
iperf ipkg ipsec-tools irda-utils jpeg-turbo jpeg jsmin kexec latencytop 
leafpad lesstif libaio libarchive libargtable2 libart libconfuse libedit 
liberation libesmtp libev libevent libfreefare libftdi libgail libgeotiff 
libglade libgtk2 libhid libical libiconv libiqrf libjpeg 
liblog4c-localtime libmbus libmms liboauth libraw libraw1394 librsvg 
libsvgtiny libsysfs libv4l libxml-parser-perl libyaml linux-fusion 
linux-headers lite localedef logsurfer lpc3250loader lshw lsuio 
luainterpreter lzma makedevs matchbox metacity mplayer mrouted musepack 
nasm ndisc6 netplug network-manager nss-mdns ocf-linux open2300 opencv 
opengl openocd pango pcmanfm perf powervr prboom proxychains-ng 
python-distutilscross python-dpkt python-id3 python-m2crypto python-mad 
python-nfc python-pygame python3 qt5 quota qwt radvd read-edid rpm 
rsh-redone rsyslog rt-tests rtai rubix sane-backends sawman setserial 
shared-mime-info slang socketcand sound-theme-borealis 
sound-theme-freedesktop sqlcipher squashfs sredird sstrip 
startup-notification statserial sunxi-boards sunxi-cedarx sunxi-mali-prop 
sunxi-mali synergy sysklogd sysprof texinfo tftpd thttpd ti-utils 
tinyhttpd torsmo transmission uclibc udpcast uemacs usbmount vtun webkit 
webrtc-audio-processing whetstone x11r7 x11vnc xfsprogs xterm xvkbd yasm

Thanks,
-Ryan
