From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 May 2014 23:41:54 +0200
Subject: [Buildroot] [PATCH 1/1] ti-gfx: pkg-config should also set
	parent include dir
In-Reply-To: <5388F853.1020406@gmx.net> ("Peter =?utf-8?Q?K=C3=BCmmel=22's?=
 message of "Fri, 30 May 2014 23:29:55 +0200")
References: <1401462022-10744-1-git-send-email-syntheticpp@gmx.net>
 <CAEBucnAiAtrF1uthDyuTPyS5TF8OQdSBchCLZOwRuLJ+ZP67wg@mail.gmail.com>
 <5388A9DC.1010204@gmx.net>
 <CAEBucnDa_EjmUu2buXEA16by0_Wck+sp-RF1Rajc8uSOswb_Zg@mail.gmail.com>
 <20140530222718.5cb42dd5@free-electrons.com>
 <5388ECDC.6050909@gmx.net> <8761kn7zw8.fsf@dell.be.48ers.dk>
 <5388F853.1020406@gmx.net>
Message-ID: <87ha476j19.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter K?mmel <syntheticpp@gmx.net> writes:

Hi,

 > I don't know if Ubuntu is a reference here, but when you install gles2
 >     sudo apt-get install libgles2-mesa-dev
 > and have a look at the.pc file,
 >     cat /usr/lib/x86_64-linux-gnu/pkgconfig/glesv2.pc
 > (or gl.pc) you see, that there also the path to the dir containing GLES2 is set:

 > prefix=/usr
 > exec_prefix=${prefix}
 > libdir=${prefix}/lib/x86_64-linux-gnu
 > includedir=${prefix}/include

 > Name: glesv2
 > Description: Mesa OpenGL ES 2.0 library
 > Requires.private:
 > Version: 9.0.3
 > Libs: -L${libdir} -lGLESv2
 > Libs.private: -lm -lpthread -ldl
 > Cflags: -I${includedir}

And what does pkg-config --cflags glesv2.pc show? pkg-config afaik
strips -I<standard-include-dir> away.

-- 
Bye, Peter Korsgaard
