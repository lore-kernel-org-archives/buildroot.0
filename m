From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 29 Nov 2013 10:00:52 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20131129095110.3c7fc674@skate> (Thomas Petazzoni's message of
 "Fri, 29 Nov 2013 09:51:10 +0100")
References: <20131129073003.AF5B01014F0@stock.ovh.net>
 <20131129095110.3c7fc674@skate>
Message-ID: <87wqjrwpiz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > This is probably the last day (or last two days) to fix more
 > autobuilder failures.

Thanks for the overview.


 >> arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/efe26c54361094fb1e201da6915900cd9b24d596/

 > The EGL functionality test failed!
 >  EGL is required for OpenGL ES to manage contexts & surfaces.
 >  You might need to modify the include and library search paths by editing
 >  QMAKE_INCDIR_EGL, QMAKE_LIBDIR_EGL and QMAKE_LIBS_EGL in
 >  /scratch/peko/build/qt-4.8.5/mkspecs/qws/linux-arm-g++.
 > make: *** [/scratch/peko/build/qt-4.8.5/.stamp_configured] Error 1

 > OpenGL implementation is the RPi one.

I'm taking a look.


 >> arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/7cf107566da47670bc8ef6d16c5e1bb7bcccef3e/

 > Build machine issue?

I think so too.

 >   CXX    libzmq_la-encoder.lo
 > /scratch/peko/host/usr/libexec/gcc/arm-buildroot-linux-uclibcgnueabi/4.7.3/cc1plus: error while loading shared libraries: libc.so.6: failed to map segment from shared object: Cannot allocate memory
 > make[3]: *** [libzmq_la-decoder.lo] Error 1
 > make[3]: *** Waiting for unfinished jobs....

I don't recall it triggering before atleast.

-- 
Bye, Peter Korsgaard
