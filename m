From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 11 Sep 2020 11:27:57 +0200
Subject: [Buildroot] CVE analysis of the resiprocate package
In-Reply-To: <20200911104753.49ab4f19@windsurf.hq.k.grp>
References: <20200907071032.C7EB26064C@crulimr02.rockwellcollins.com>
 <CAMQcK5KyWBPOW7s9BD7xaE5nd15SzEARFf8sDm9aYq=E6bqVbA@mail.gmail.com>
 <20200909235739.4ccaa8b6@windsurf.hq.k.grp> <87zh5wvkvw.fsf@BL-laptop>
 <87wo10vhp1.fsf@BL-laptop> <20200911104753.49ab4f19@windsurf.hq.k.grp>
Message-ID: <87tuw4vf1e.fsf@BL-laptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

> On Fri, 11 Sep 2020 10:30:34 +0200
> Gregory CLEMENT <gregory.clement@bootlin.com> wrote:
>
>> Among the 2412 packages there are 121 packages for which CVEs refer to
>> minor version.
>
> Could you provide that list, as well as the CPE ID entries that have a
> minor version, so that we can get a feeling of what it looks like ?

Here is the list:

libssh
util-linux
cups
qemu
stunnel
dnsmasq
gnuplot
bind
c-ares
aircrack-ng
iodine
libyang
privoxy
php
dbus
ruby
glibc
libgit2
mariadb
rpm
openswan
squid
lxc
thttpd
exiv2
xen
libxml2
dovecot
monkey
clamav
putty
freerdp
openssh
libmspack
libevent
freetype
irssi
fetchmail
bootstrap
graphicsmagick
exim
gnutls
oniguruma
openssl
cgilua
libtirpc
libvpx
pcsc-lite
pure-ftpd
grep
xz
dhcp
libvorbis
sudo
socat
rsyslog
jquery
openvpn
proftpd
libsndfile
resiprocate
logsurfer
libpng
syslog-ng
nfs-utils
docker
libcurl
postgresql
bash
busybox
openjdk
automake
tor
smack
suricata
unbound
nut
paxtest
ffmpeg
faad2
lynx
libesmtp
chrony
luajit
redis
valgrind
snort
ntp
tinyproxy
haproxy
enscript
libraw
perl
systemd
zeromq
netatalk
gdb
mysql
nmap
libcgroup
dhcpcd
logrotate
readline
collectd
git
subversion
asterisk
runc
ngircd
memcached
tinc
ipsec-tools
go
ejabberd
tcpreplay
dillo
python
imagemagick
links
gnupg
linux

For CPE-id I need to make more change in the script and the list will be
bigger because for each package you can have many version.

I am working on it.
>
> The question is how to deal with this minor version field. Ignore the
> CPE ID when the minor version field is not "*" ? Something else ?

It will work of non of the package managed by buildroot use minor
version. If some packages points on minor version, then should provide
this information.

Using cpeid would allow to provide this information.

Gregory

>
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
