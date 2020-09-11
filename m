From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 11 Sep 2020 11:52:08 +0200
Subject: [Buildroot] CVE analysis of the resiprocate package
In-Reply-To: <87tuw4vf1e.fsf@BL-laptop>
References: <20200907071032.C7EB26064C@crulimr02.rockwellcollins.com>
 <CAMQcK5KyWBPOW7s9BD7xaE5nd15SzEARFf8sDm9aYq=E6bqVbA@mail.gmail.com>
 <20200909235739.4ccaa8b6@windsurf.hq.k.grp> <87zh5wvkvw.fsf@BL-laptop>
 <87wo10vhp1.fsf@BL-laptop> <20200911104753.49ab4f19@windsurf.hq.k.grp>
 <87tuw4vf1e.fsf@BL-laptop>
Message-ID: <87r1r8vdx3.fsf@BL-laptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gregory CLEMENT <gregory.clement@bootlin.com> writes:

> Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>
>> On Fri, 11 Sep 2020 10:30:34 +0200
>> Gregory CLEMENT <gregory.clement@bootlin.com> wrote:
>>
>>> Among the 2412 packages there are 121 packages for which CVEs refer to
>>> minor version.
>>
>> Could you provide that list, as well as the CPE ID entries that have a
>> minor version, so that we can get a feeling of what it looks like ?
>
> Here is the list:
>
> libssh
> util-linux
> cups
> qemu
> stunnel
> dnsmasq
> gnuplot
> bind
> c-ares
> aircrack-ng
> iodine
> libyang
> privoxy
> php
> dbus
> ruby
> glibc
> libgit2
> mariadb
> rpm
> openswan
> squid
> lxc
> thttpd
> exiv2
> xen
> libxml2
> dovecot
> monkey
> clamav
> putty
> freerdp
> openssh
> libmspack
> libevent
> freetype
> irssi
> fetchmail
> bootstrap
> graphicsmagick
> exim
> gnutls
> oniguruma
> openssl
> cgilua
> libtirpc
> libvpx
> pcsc-lite
> pure-ftpd
> grep
> xz
> dhcp
> libvorbis
> sudo
> socat
> rsyslog
> jquery
> openvpn
> proftpd
> libsndfile
> resiprocate
> logsurfer
> libpng
> syslog-ng
> nfs-utils
> docker
> libcurl
> postgresql
> bash
> busybox
> openjdk
> automake
> tor
> smack
> suricata
> unbound
> nut
> paxtest
> ffmpeg
> faad2
> lynx
> libesmtp
> chrony
> luajit
> redis
> valgrind
> snort
> ntp
> tinyproxy
> haproxy
> enscript
> libraw
> perl
> systemd
> zeromq
> netatalk
> gdb
> mysql
> nmap
> libcgroup
> dhcpcd
> logrotate
> readline
> collectd
> git
> subversion
> asterisk
> runc
> ngircd
> memcached
> tinc
> ipsec-tools
> go
> ejabberd
> tcpreplay
> dillo
> python
> imagemagick
> links
> gnupg
> linux
>
> For CPE-id I need to make more change in the script and the list will be
> bigger because for each package you can have many version.
>
> I am working on it.

As I feared the list was very huge. Here it is the output for only a few
packages (resiprocate,proftpd,monkey and bind):

cpe:2.3:a:isc:bind:4.9.5:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:8.2.2:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:8.2.2:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:8.2.2:p3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:8.2.2:p4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:8.2.2:p5:*:*:*:*:*:*
cpe:2.3:a:isc:bind:8.2.2:p6:*:*:*:*:*:*
cpe:2.3:a:isc:bind:8.2.2:p7:*:*:*:*:*:*
cpe:2.3:a:isc:bind:8.2:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.0.0:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.0.0:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.0.0:rc3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.0.0:rc4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.0.0:rc5:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.0.0:rc6:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.0.1:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.0.1:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.0:a1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.0:a2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.0:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.0:b2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.0:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.0:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.0:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.0:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.1:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.1:b2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.1:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.1:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.1:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.1:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.2:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.2:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.2:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.2:p3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.2:p4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.2:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.2:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.3:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.3:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.3:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.3:p3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.3:p4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.3:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.4:b2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.4:b3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.4:beta1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.4:beta2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.4:beta3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.4:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.4:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.4:p3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.4:p4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.4:p5:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.4:p6:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.4:p7:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.4:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.5:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.5:beta1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.5:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.5:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.5:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.5:s1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.5:s1:*:*:supported_preview:*:*:*
cpe:2.3:a:isc:bind:9.10.5:s2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.5:s4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.6:s1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.6:s2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.7:s1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.7:s1:*:*:supported_preview:*:*:*
cpe:2.3:a:isc:bind:9.10.8:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.8:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.10.8:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.1.0:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.0:a1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.0:a2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.0:a3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.0:alpha1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.0:alpha2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.0:alpha3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.0:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.0:b2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.0:b3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.0:beta1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.0:beta2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.0:beta3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.0:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.0:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.0:p3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.0:p4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.0:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.12:s1:*:*:supported_preview:*:*:*
cpe:2.3:a:isc:bind:9.11.1:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.1:beta1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.1:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.1:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.1:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.21:s1:*:*:supported_preview:*:*:*
cpe:2.3:a:isc:bind:9.11.3:s1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.3:s1:*:*:supported_preview:*:*:*
cpe:2.3:a:isc:bind:9.11.3:s2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.5:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.5:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.5:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.5:s3:*:*:*:supported_preview:*:*
cpe:2.3:a:isc:bind:9.11.5:s3:*:*:supported_preview:*:*:*
cpe:2.3:a:isc:bind:9.11.5:s5:*:*:supported_preview:*:*:*
cpe:2.3:a:isc:bind:9.11.5:s6:*:*:supported_preview:*:*:*
cpe:2.3:a:isc:bind:9.11.6:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.6:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.11.6:s1:*:*:supported_preview:*:*:*
cpe:2.3:a:isc:bind:9.11.7:s1:*:*:supported_preview:*:*:*
cpe:2.3:a:isc:bind:9.11.8:s1:*:*:supported_preview:*:*:*
cpe:2.3:a:isc:bind:9.1.1:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.1.1:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.1.1:rc3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.1.1:rc4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.1.1:rc5:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.1.1:rc6:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.1.1:rc7:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.12.0:a1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.12.0:alpha1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.12.0:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.12.0:b2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.12.0:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.12.0:rc3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.12.1:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.12.1:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.12.3:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.12.3:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.12.3:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.12.4:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.12.4:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.1.2:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.1.3:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.1.3:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.1.3:rc3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.0:a1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.0:a2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.0:a3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.0:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.0:b2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.0:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.0:rc10:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.0:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.0:rc3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.0:rc4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.0:rc5:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.0:rc6:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.0:rc7:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.0:rc8:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.0:rc9:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.1:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.1:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.2:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.2:p3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.2:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.3:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.3:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.3:rc3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.3:rc4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.4:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.4:rc3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.4:rc4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.4:rc5:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.4:rc6:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.4:rc7:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.4:rc8:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.5:b2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.5:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.6:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.6:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.7:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.7:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.7:rc3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.2.9:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.3.0:b2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.3.0:b3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.3.0:b4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.3.0:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.3.0:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.3.0:rc3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.3.0:rc4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.3.1:b2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.3.1:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.3.2:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.3.2:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.3.3:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.3.3:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.3.3:rc3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.3.5:p2_w1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.3.5-p2-w1:windows:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.3.5:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.3.5:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.3.6:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.4.0:a1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.4.0:a2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.4.0:a3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.4.0:a4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.4.0:a5:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.4.0:a6:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.4.0:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.4.0:b2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.4.0:b3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.4.0:b4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.4.0:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.4.0:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.4.2:p2_w1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.4.2:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.4.2:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.4.3:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.4.3:b2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.4.3:b3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.4.3:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.4.3:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.4.3:p3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.4.3:p4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.4.3:p5:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.4.3:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.4:b1:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.4:r1:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.4:r2:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.4:r3:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.4:r4:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.4:r4-p1:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.4:r5-b1:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.4:r5:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.4:r5-p1:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.4:r5-rc1:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.5.0:a1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.0:a2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.0:a3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.0:a4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.0:a5:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.0:a6:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.0:a7:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.0:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.0:b2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.0:b3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.0:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.0:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.0:p2_w1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.0:p2_w2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.0:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.1:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.1:b2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.1:b3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.1:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.1:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.2:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.2:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.2:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.2:p3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.2:p4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.2:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.3:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.5.3:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.6.0:a1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.6.0:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.6.0:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.6.0:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.6.0:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.6.1:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.6.1:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.6.1:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.6.1:p3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.6.1:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.6.2:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.6.2:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.6.2:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.6.2:p3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.6.2:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.6.3:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.6.3:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.6:r1:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.6:r2:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.6:r3:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.6:r4:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.6:r4_p1:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.6:r5_b1:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.6:r5:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.6:r5_p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.6:r5_p1:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.6:r6_b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.6:r6_b1:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.6:r6:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.6:r6_rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.6:r6_rc1:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.6:r6_rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.6:r6_rc2:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.6:r7:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.6:r7_p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.6:r7_p1:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.6:r7_p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.6:r7_p2:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.6:r9:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.6:r9_p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.6:r9_p1:*:*:esv:*:*:*
cpe:2.3:a:isc:bind:9.7.0:a1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.0:a2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.0:a3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.0:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.0:b2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.0:b3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.0:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.0:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.0:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.0:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.1:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.1:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.1:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.1:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.2:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.2:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.2:p3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.2:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.3:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.3:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.3:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.4:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.4:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.4:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.5:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.5:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.5:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.6:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.6:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.6:p3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.7.6:p4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.0:a1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.0:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.0:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.0:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.0:p4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.0:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.1:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.1:b2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.1:b3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.1:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.1:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.2:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.2:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.2:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.3:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.3:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.3:p3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.3:p4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.5:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.5:b2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.5:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.5:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.5:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.5:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.6:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.6:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.6:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.8.6:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.0:a1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.0:a2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.0:a3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.0:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.0:b2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.0:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.0:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.0:p3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.0:p4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.0:p5:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.0:p6:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.0:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.0:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.0:rc3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.0:rc4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.10:beta1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.10:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.10:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.10:s1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.10:s2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.11:s1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.12:s1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.12:s1:*:*:supported_preview:*:*:*
cpe:2.3:a:isc:bind:9.9.13:s1:*:*:supported_preview:*:*:*
cpe:2.3:a:isc:bind:9.9.1:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.1:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.1:p3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.1:p4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.2:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.2:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.3:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.3:b2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.3:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.3:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.3:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.3:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.3:s1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.3:s1:*:*:*:supported_preview:*:*
cpe:2.3:a:isc:bind:9.9.3:s1:*:*:supported_preview:*:*:*
cpe:2.3:a:isc:bind:9.9.4:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.4:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.4:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.4:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.6:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.7:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.7:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.7:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.7:rc2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.8:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.8:p3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.8:p4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.8:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.8:s1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.8:s2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.8:s3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.8:s4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.8:s5:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.8:s6:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.9:b1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.9:b2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.9:beta1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.9:beta2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.9:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.9:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.9:p3:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.9:p4:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.9:p5:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.9:p6:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.9:p7:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.9:rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.9:s1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.9:s1rc1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.9:s6:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.9:s7:*:*:*:*:*:*
cpe:2.3:a:isc:bind:9.9.9:s8:*:*:*:*:*:*
cpe:2.3:a:isc:bind:*:p1:*:*:*:*:*:*
cpe:2.3:a:isc:bind:*:p2:*:*:*:*:*:*
cpe:2.3:a:isc:bind:*:p3:*:*:*:*:*:*
cpe:2.3:a:monkey-project:monkey:0.8.4:2:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.2.0:pre10:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.2.0:pre9:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.2.0:rc1:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.2.0:rc2:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.2.0:rc3:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.2.10:rc1:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.2.10:rc2:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.2.10:rc3:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.2.2:rc1:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.2.2:rc2:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.2.2:rc3:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.2.5:rc1:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.2.5:rc2:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.2.5:rc3:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.2.6:rc1:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.2.6:rc2:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.2.7:rc1:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.2.7:rc2:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.2.7:rc3:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.2.8:rc1:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.2.8:rc2:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.2.9:rc1:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.2.9:rc2:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.2.9:rc3:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.0:a:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.0:rc1:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.0:rc2:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.0:rc3:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.0:rc4:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.0:rc5:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.1:rc1:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.1:rc2:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.1:rc3:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.2:a:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.2:b:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.2:c:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.2:d:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.2:e:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.2:rc1:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.2:rc2:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.2:rc3:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.2:rc4:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.3:a:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.3:b:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.3:c:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.3:d:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.3:e:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.3:rc1:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.3:rc2:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.3:rc3:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.3:rc4:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.4:d:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.4:rc1:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.4:rc2:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.4:rc3:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.5:rc3:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.6:a:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.6:alpha:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.6:beta:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.6:rc1:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.6:rc2:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.6:rc3:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.6:rc4:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:1.3.7:rc1:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:*:a:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:*:c:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:*:d:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:*:f:*:*:*:*:*:*
cpe:2.3:a:proftpd:proftpd:*:rc2:*:*:*:*:*:*
cpe:2.3:a:resiprocate:resiprocate:1.11.0:alpha1:*:*:*:*:*:*
cpe:2.3:a:resiprocate:resiprocate:1.11.0:alpha10:*:*:*:*:*:*
cpe:2.3:a:resiprocate:resiprocate:1.11.0:alpha11:*:*:*:*:*:*
cpe:2.3:a:resiprocate:resiprocate:1.11.0:alpha2:*:*:*:*:*:*
cpe:2.3:a:resiprocate:resiprocate:1.11.0:alpha3:*:*:*:*:*:*
cpe:2.3:a:resiprocate:resiprocate:1.11.0:alpha4:*:*:*:*:*:*
cpe:2.3:a:resiprocate:resiprocate:1.11.0:alpha5:*:*:*:*:*:*
cpe:2.3:a:resiprocate:resiprocate:1.11.0:alpha6:*:*:*:*:*:*
cpe:2.3:a:resiprocate:resiprocate:1.11.0:alpha7:*:*:*:*:*:*
cpe:2.3:a:resiprocate:resiprocate:1.11.0:alpha8:*:*:*:*:*:*
cpe:2.3:a:resiprocate:resiprocate:1.11.0:alpha9:*:*:*:*:*:*
cpe:2.3:a:resiprocate:resiprocate:1.11.0:beta1:*:*:*:*:*:*
cpe:2.3:a:resiprocate:resiprocate:1.11.0:beta2:*:*:*:*:*:*
cpe:2.3:a:resiprocate:resiprocate:1.11.0:beta3:*:*:*:*:*:*
cpe:2.3:a:resiprocate:resiprocate:1.11.0:beta4:*:*:*:*:*:*
cpe:2.3:a:resiprocate:resiprocate:1.11.0:beta5:*:*:*:*:*:*
cpe:2.3:a:resiprocate:resiprocate:1.12.0:alpha1:*:*:*:*:*:*

Gregory

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
