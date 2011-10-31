From: Bruno Niklaus <niklaus.bruno@gmail.com>
Date: Mon, 31 Oct 2011 10:29:41 +0100
Subject: [Buildroot] Building opencv for OMAP4430 / Armv7 / Cmake problem
Message-ID: <CANVadiHy0cddWJrWqF6RPS2QLp-yjY1yPYUhXm2si27m0C7M8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi @all

i tried to build opencv for armv7 / omap4430 processor, i'm using
codesourcery toolchain with neon optimations enabled.
when cmake tries to build opencv i allways get strange error with
*"z_offset64_t"*
The generated "toolchainfile.cmake" file in the "buildroot/outpout"
directory sets additional CMAKE_C_FLAGS and CMAKE_CXX_FLAGS at the end:
*"-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"*
I dont think these are the right flags, if i delete them and rebuild opencv
i runs trough without any errors.
but i dont know where the toolchainfile.cmake is generated? Where should i
apply a patch?
And is it okay to just delete the flags or should there be other flags?

best regards
Bruno
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111031/b2abbb6c/attachment.html>
