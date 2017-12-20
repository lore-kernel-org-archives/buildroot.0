From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Dec 2017 21:34:12 +0100
Subject: [Buildroot] package "expat" fails to build without a C++
 compiler
In-Reply-To: <20171219215831.4rlfcixr32ocr7tg@workotop.localdomain> (Damien
 Riegel's message of "Tue, 19 Dec 2017 16:58:31 -0500")
References: <20171219215831.4rlfcixr32ocr7tg@workotop.localdomain>
Message-ID: <87r2rpcf5n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Damien" == Damien Riegel <damien.riegel@savoirfairelinux.com> writes:

 > Hi,
 > I tried to build an image with the "expat" package in it, using a
 > toolchain without a C++ compiler. It fails with the following error:

 >   configure: error: in `/home/dkc/src/buildroot/build/build/expat-2.2.4':
 >   configure: error: C++ preprocessor "/lib/cpp" fails sanity check

 > Enabling C++ support fixed that error.

Hmm, can you have a look in expat-2.2.4/config.log to see what exactly
goes wrong?

/lib/cpp is from your host toolchain, so enabling or not enabling C++
support shouldn't matter.

I've just tried here with a toolchain configuration without C++ support
and it works:

checking dependency style of false... none
checking how to run the C++ preprocessor... /lib/cpp
checking whether the false linker (/home/peko/source/buildroot/output-expat/host/bin/arm-linux-ld) supports shared libraries... yes
libtool.m4: error: problem compiling CXX test program
..
configure: creating ./config.status

So it complains about not being able to test C++ support, bus as expat
isn't written in C++ it doesn't matter and configure just continues.

-- 
Bye, Peter Korsgaard
