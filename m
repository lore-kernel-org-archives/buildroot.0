From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Mar 2020 17:40:03 +0100
Subject: [Buildroot] [PATCH] package/binutils: fix assertion failure in
 xtensa ld
In-Reply-To: <20200306035803.14320-1-jcmvbkbc@gmail.com> (Max Filippov's
 message of "Thu, 5 Mar 2020 19:58:03 -0800")
References: <20200306035803.14320-1-jcmvbkbc@gmail.com>
Message-ID: <87fteiu7fg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > xtensa ld fails with the following message
 >   ld: BFD (GNU Binutils) 2.31.1 internal error, aborting at
 >   elf32-xtensa.c:3283 in elf_xtensa_finish_dynamic_sections

 > during domoticz package build. It happens because of mismatch between
 > the size allocated for dynamic relocations in the executable image and
 > the number of PLT relocations actually written to the image. The
 > mismatch is caused by the fact that undefined weak symbol is treated as
 > dynamic (and thus needing PLT relocation), but xtensa linker not
 > expecting that.

 > Fixes: http://autobuild.buildroot.net/results/7885705f1b1c0f31cf21b464150f5509929c1906/
 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
 > Backported from: e15a8da9c71336b06cb5f2706c3f6b7e6ddd95a3

Committed, thanks.

-- 
Bye, Peter Korsgaard
