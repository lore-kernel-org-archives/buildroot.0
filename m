From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 17 Nov 2011 20:23:56 +0100
Subject: [Buildroot] arm-unknown-linux-uclibcgnueabi-g++
In-Reply-To: <004101cca55a$c8a68e20$0400a8c0@dspcgrnzks9p98> (Jeff Krasky's
 message of "Thu, 17 Nov 2011 12:57:40 -0600")
References: <004101cca55a$c8a68e20$0400a8c0@dspcgrnzks9p98>
Message-ID: <87sjlma6yb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jeff" == Jeff Krasky <jeff.krasky@dspcg.com> writes:

 Jeff> Hi,

 Jeff> I am using buildroot-2011.05 and I am in need of a g++ compiler
 Jeff> in order to compile for the target board.  So I assume it would
 Jeff> be called arm-unknown-linux-uclibcgnueabi-g++. I notice it does
 Jeff> not include anything called
 Jeff> "arm-unknown-linux-uclibcgnueabi-g++". Does anyone know anything
 Jeff> about this? I ran 'make uclibc-menuconfig' to try and tell it to
 Jeff> build a g++ compiler but I didn't see that listed.  I do see
 Jeff> arm-unknown-linux-uclibcgnueabi-gcc though.

You probably didn't enable C++ support. To enable it simply do:

make menuconfig, enable 'Toolchain->Enable C++ support' option, save
make clean; make

-- 
Bye, Peter Korsgaard
