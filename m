From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Jan 2012 10:54:41 +0100
Subject: [Buildroot] [PATCH v3] Add pygame package
In-Reply-To: <4F0D5742.7060803@free.fr> (Julien Boibessot's message of "Wed,
 11 Jan 2012 10:32:50 +0100")
References: <1326266671-9161-1-git-send-email-julien.boibessot@free.fr>
 <87sjjmbpva.fsf@macbook.be.48ers.dk> <4F0D5742.7060803@free.fr>
Message-ID: <87fwfmbm3i.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Boibessot <julien.boibessot@free.fr> writes:

Hi,

 >> Any idea?

 Julien> Oups. I missed that one because error seems to occur only when the
 Julien> Host is a 64bits architecture (I have a 32 bits Host).
 Julien> Seems like a problem in distutils that adds
 Julien> "-I/home/peko/source/buildroot/output/host/usr/include/python2.7" when
 Julien> compiling, which isn't a problem when Host and Target python
 Julien> installations match.

 Julien> You have the same problem (include added) in python-mad package. Does
 Julien> it compile on your Host ?

It does compile here. Presumably because of the --include-dirs, even
though it ends up adding both an -I for host-python and target-python
(but target is first, so used) which isn't really nice:

building 'madmodule' extension
creating build
creating build/temp.linux-x86_64-2.7
creating build/temp.linux-x86_64-2.7/src
/home/peko/source/buildroot/output/host/usr/bin/arm-linux-gcc -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -pipe -Os -fPIC -DVERSION_MAJOR=0 -DVERSION_MINOR=6 -DVERSION="0.6" -I/home/peko/source/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include -I/home/peko/source/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/python2.7 -I/home/peko/source/buildroot/output/host/usr/include/python2.7 -c src/madmodule.c -o build/temp.linux-x86_64-2.7/src/madmodule.o

-- 
Bye, Peter Korsgaard
