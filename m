From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 16:58:45 +0200
Subject: [Buildroot] Buildroot 2018.05-rc3 released
In-Reply-To: <1527599917.2053.2.camel@rovoreed.com> (Mike Davies's message of
 "Tue, 29 May 2018 14:18:37 +0100")
References: <87efhvufjm.fsf@dell.be.48ers.dk>
 <1527599917.2053.2.camel@rovoreed.com>
Message-ID: <87fu2a7bkq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Davies <busybox_mail@rovoreed.com> writes:

 > ca-certificates fails to build. Though I see there is some discussion
 > on the list, I'm unsure if it is connected to the build failing.
 > My real build needs a lot more stuff, but it can be trimmed down to
 > this for it to fail...

 > tar -xzf /home/mike/Downloads/buildroot-2018.05-rc3.tar.gz
 > cd b*3
 > make raspberrypi3_64_defconfig
 > make menuconfig
 > Target Packages->Libraries->Crypto->CA Certificates
 > make

 > PATH="/home/mike/work/pi/buildroot-2018.05-rc3/output/host/bin:/home/mike/work/pi/buildroot-2018.05-rc3/output/host/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/home/mike/bin:/sbin:/home/mike/.local/bin:/home/mike/bin:/home/mike/bin:/sbin" /usr/bin/make -j9 -C /home/mike/work/pi/buildroot-2018.05-rc3/output/build/ca-certificates-20170717 all
 > for dir in mozilla; do \
 >   /usr/bin/make -C $dir all; \
 > done
 > python certdata2pem.py
 > Traceback (most recent call last):
 >   File "certdata2pem.py", line 23, in <module>
 >     import base64
 >   File "/home/mike/work/pi/buildroot-2018.05-rc3/output/host/lib64/python2.7/base64.py", line 9, in <module>
 >     import struct
 >   File "/home/mike/work/pi/buildroot-2018.05-rc3/output/host/lib64/python2.7/struct.py", line 1, in <module>
 >     from _struct import *
 > ImportError: /home/mike/work/pi/buildroot-2018.05-rc3/output/host/lib64/python2.7/lib-dynload/_struct.so: undefined symbol: PyUnicodeUCS2_AsEncodedString

Hmm, strange. Nothing has really changed to host-python recently. Is
this a new regression since 2018.05-rc2? What host OS are you using?

-- 
Bye, Peter Korsgaard
