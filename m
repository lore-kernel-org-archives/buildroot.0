From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Nov 2012 11:51:14 -0800
Subject: [Buildroot] can-utils or site method git broken
In-Reply-To: <50B8FB71.4000309@relinux.de> (Stephan Hoffmann's message of
 "Fri, 30 Nov 2012 19:31:13 +0100")
References: <50B8FB71.4000309@relinux.de>
Message-ID: <87y5hiamz1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephan" == Stephan Hoffmann <sho@relinux.de> writes:

 Stephan> Hi,
 Stephan> I am currently trying to build can-utils without success. Obviously,
 Stephan> getting the required commit from gitorious.org fails. I verified that I
 Stephan> can clone the repo by hand and that it contains the right hash.

 Stephan> Configuration: beaglebone_defconfig, added can-utils, branch
 Stephan> master from today (82583bf4), Ubuntu 10.04 LTS.

Odd, it works here:

make can-utils-patch
>>> can-utils 836d3cc0122ce31a1b732d369cbd27b690c3110f Downloading
Cloning into bare repository 'can-utils-836d3cc0122ce31a1b732d369cbd27b690c3110f'...
warning: Could not find remote branch 836d3cc0122ce31a1b732d369cbd27b690c3110f to clone.
fatal: Remote branch 836d3cc0122ce31a1b732d369cbd27b690c3110f not found in upstream origin
Cloning into bare repository 'can-utils-836d3cc0122ce31a1b732d369cbd27b690c3110f'...
remote: Counting objects: 732, done.
remote: Compressing objects: 100% (253/253), done.
remote: Total 732 (delta 485), reused 706 (delta 468)
Receiving objects: 100% (732/732), 221.56 KiB | 118 KiB/s, done.
Resolving deltas: 100% (485/485), done.
>>> can-utils 836d3cc0122ce31a1b732d369cbd27b690c3110f Extracting
gzip -d -c /var/lib/downloads/can-utils-836d3cc0122ce31a1b732d369cbd27b690c3110f.tar.gz | tar --strip-components=1 -C /home/peko/source/buildroot/output/build/can-utils-836d3cc0122ce31a1b732d369cbd27b690c3110f  -xf -
>>> can-utils 836d3cc0122ce31a1b732d369cbd27b690c3110f Patching package//can-utils
>>> can-utils 836d3cc0122ce31a1b732d369cbd27b690c3110f  Updating config.sub and config.guess
for file in config.guess config.sub; do for i in $(find /home/peko/source/buildroot/output/build/can-utils-836d3cc0122ce31a1b732d369cbd27b690c3110f -name $file); do cp support/gnuconfig/$file $i; done; done
>>> can-utils 836d3cc0122ce31a1b732d369cbd27b690c3110f Patching libtool

Do you have an old git version on your build machine? I have 1.7.10.4.

-- 
Bye, Peter Korsgaard
