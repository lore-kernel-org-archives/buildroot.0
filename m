From: Mike Davies <busybox_mail@rovoreed.com>
Date: Tue, 29 May 2018 14:18:37 +0100
Subject: [Buildroot] Buildroot 2018.05-rc3 released
In-Reply-To: <87efhvufjm.fsf@dell.be.48ers.dk>
References: <87efhvufjm.fsf@dell.be.48ers.dk>
Message-ID: <1527599917.2053.2.camel@rovoreed.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


ca-certificates fails to build. Though I see there is some discussion
on the list, I'm unsure if it is connected to the build failing.
My real build needs a lot more stuff, but it can be trimmed down to
this for it to fail...

tar -xzf /home/mike/Downloads/buildroot-2018.05-rc3.tar.gz
cd b*3
make raspberrypi3_64_defconfig
make menuconfig
Target Packages->Libraries->Crypto->CA Certificates
make
.
.
.

ln -sf python2 /home/mike/work/pi/buildroot-2018.05-rc3/output/host/bin/python
ln -sf python2-config /home/mike/work/pi/buildroot-2018.05-rc3/output/host/bin/python-config
>>> ca-certificates 20170717 Downloading
PATH="/home/mike/work/pi/buildroot-2018.05-rc3/output/host/bin:/home/mike/work/pi/buildroot-2018.05-rc3/output/host/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/home/mike/bin:/sbin:/home/mike/.local/bin:/home/mike/bin:/home/mike/bin:/sbin" BR2_DL_DIR="/home/mike/work/pi/buildroot-2018.05-rc3/dl" BUILD_DIR=/home/mike/work/pi/buildroot-2018.05-rc3/output/build O=/home/mike/work/pi/buildroot-2018.05-rc3/output flock /home/mike/work/pi/buildroot-2018.05-rc3/dl/ca-certificates/ support/download/dl-wrapper -c '20170717' -d '/home/mike/work/pi/buildroot-2018.05-rc3/dl/ca-certificates' -D '/home/mike/work/pi/buildroot-2018.05-rc3/dl' -f 'ca-certificates_20170717.tar.xz' -H 'package/ca-certificates//ca-certificates.hash' -n 'ca-certificates-20170717' -N 'ca-certificates' -o '/home/mike/work/pi/buildroot-2018.05-rc3/dl/ca-certificates/ca-certificates_20170717.tar.xz'  -u http+http://snapshot.debian.org/archive/debian/20170814T210836Z/pool/main/c/ca-certificates -u http\|urlencode+http://sources.buildroot.net/ca-certificates -u http\|urlencode+http://sources.buildroot.net  -- 
--2018-05-29 14:13:13--  http://snapshot.debian.org/archive/debian/20170814T210836Z/pool/main/c/ca-certificates/ca-certificates_20170717.tar.xz
Resolving snapshot.debian.org... 193.62.202.27, 185.17.185.185, 2001:630:206:4000:1a1a:0:c13e:ca1b, ...
Connecting to snapshot.debian.org|193.62.202.27|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 293028 (286K) [application/x-tar]
Saving to: ?/home/mike/work/pi/buildroot-2018.05-rc3/output/build/.ca-certificates_20170717.tar.xz.BjYGHQ/output?

/home/mike/work/pi/buildroot-2018. 100%[=============================================================>] 286.16K  --.-KB/s    in 0.08s   

2018-05-29 14:13:13 (3.31 MB/s) - ?/home/mike/work/pi/buildroot-2018.05-rc3/output/build/.ca-certificates_20170717.tar.xz.BjYGHQ/output? saved [293028/293028]

ca-certificates_20170717.tar.xz: OK (sha1: 4c093ceee1f1428d5aa7e9a5324b92961c0c0f06)
ca-certificates_20170717.tar.xz: OK (sha256: e487639b641fa75445174734dd6e9d600373e3248b3d86a7e3c6d0f6977decd2)
>>> ca-certificates 20170717 Extracting
xzcat /home/mike/work/pi/buildroot-2018.05-rc3/dl/ca-certificates/ca-certificates_20170717.tar.xz | tar --strip-components=1 -C /home/mike/work/pi/buildroot-2018.05-rc3/output/build/ca-certificates-20170717   -xf -
>>> ca-certificates 20170717 Patching
>>> ca-certificates 20170717 Configuring
>>> ca-certificates 20170717 Building
PATH="/home/mike/work/pi/buildroot-2018.05-rc3/output/host/bin:/home/mike/work/pi/buildroot-2018.05-rc3/output/host/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/home/mike/bin:/sbin:/home/mike/.local/bin:/home/mike/bin:/home/mike/bin:/sbin" /usr/bin/make -j9 -C /home/mike/work/pi/buildroot-2018.05-rc3/output/build/ca-certificates-20170717 all
for dir in mozilla; do \
  /usr/bin/make -C $dir all; \
done
python certdata2pem.py
Traceback (most recent call last):
  File "certdata2pem.py", line 23, in <module>
    import base64
  File "/home/mike/work/pi/buildroot-2018.05-rc3/output/host/lib64/python2.7/base64.py", line 9, in <module>
    import struct
  File "/home/mike/work/pi/buildroot-2018.05-rc3/output/host/lib64/python2.7/struct.py", line 1, in <module>
    from _struct import *
ImportError: /home/mike/work/pi/buildroot-2018.05-rc3/output/host/lib64/python2.7/lib-dynload/_struct.so: undefined symbol: PyUnicodeUCS2_AsEncodedString
Makefile:6: recipe for target 'all' failed
make[3]: *** [all] Error 1
Makefile:9: recipe for target 'all' failed
make[2]: *** [all] Error 2
package/pkg-generic.mk:223: recipe for target '/home/mike/work/pi/buildroot-2018.05-rc3/output/build/ca-certificates-20170717/.stamp_built' failed
make[1]: *** [/home/mike/work/pi/buildroot-2018.05-rc3/output/build/ca-certificates-20170717/.stamp_built] Error 2
Makefile:79: recipe for target '_all' failed
make: *** [_all] Error 2


On Tue, 2018-05-29 at 08:44 +0200, Peter Korsgaard wrote:
> Hi,
> 
> Buildroot 2018.05-rc3 is released - Go download it at:
> 
> http://buildroot.net/downloads/buildroot-2018.05-rc3.tar.gz
> 
> or
> 
> http://buildroot.net/downloads/buildroot-2018.05-rc3.tar.bz2
> 
> Or get it from Git:
> 
> git://git.buildroot.net/buildroot
> 
> Another week, another release candidate.
> 
> Please give it a spin and report any problems to the mailing list or
> bug tracker. Many thanks to the people contributing to this release:
> 
> git shortlog -sn 2018.05-rc2..
> ????10??Baruch Siach
> ?????5??Fabio Estevam
> ?????2??Fabrice Fontaine
> ?????2??Peter Korsgaard
> ?????2??Yann E. MORIN
> ?????1??Angelo Compagnucci
> ?????1??Arnout Vandecappelle (Essensium/Mind)
> ?????1??Carlos Santos
> ?????1??Evgeniy Didin
> ?????1??J?r?me Oufella
> ?????1??Matt Weber
> ?????1??Romain Naour
> ?????1??Waldemar Brodkorb
> 
> For more details, see the CHANGES file:
> 
> http://git.buildroot.net/buildroot/plain/CHANGES?id=2018.05-rc3
> 
> Expect the final 2018.05 release by a day or two, unless something
> critical shows up.
> 
