From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 21 Apr 2011 23:19:59 +0200
Subject: [Buildroot] [PATCH 4/7] libcap: bump to version 2.20
In-Reply-To: <1303321319-16553-4-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Wed, 20 Apr 2011 14:41:56 -0300")
References: <1303321319-16553-1-git-send-email-gustavo@zacarias.com.ar>
	<1303321319-16553-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8739lbz4hs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Bump libcap to version 2.20 and adjust style to match buildroot's
 Gustavo> defacto standard.

Breaks here (I don't have libcap development headers on my build host):

/usr/bin/make -C libcap all
make[2]: Entering directory `/home/peko/source/buildroot/output/build/libcap-2.20/libcap'
/usr/bin/gcc -O2 -I/home/peko/source/buildroot/output/host/include -I/home/peko/source/buildroot/output/host/usr/include _makenames.c -o _makenames
_makenames.c:10:28: error: sys/capability.h: No such file or directory
_makenames.c:25: error: invalid application of ?sizeof? to incomplete type ?struct __user_cap_data_struct? 
make[2]: *** [_makenames] Error 1
make[2]: Leaving directory `/home/peko/source/buildroot/output/build/libcap-2.20/libcap'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/peko/source/buildroot/output/build/libcap-2.20'
make: *** [/home/peko/source/buildroot/output/build/libcap-2.20/.stamp_built] Error 2


It seems like we'll need to first build libcap for the host.

-- 
Bye, Peter Korsgaard
