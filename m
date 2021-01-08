From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Date: Fri, 8 Jan 2021 11:07:59 +0100
Subject: [Buildroot] Upgrading LLVM and Clang to version 11.0.0... issue
 with libclc
In-Reply-To: <0a47a156-bcde-41a3-bd34-24df0549d0ba@gmail.com>
References: <1ff5aafd-9aeb-2cf0-8e90-333c7c39cbaa@bootlin.com>
 <0a47a156-bcde-41a3-bd34-24df0549d0ba@gmail.com>
Message-ID: <148a6a55-99e4-e4f1-252c-17c693f5df57@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

Many thanks for your help and insights!

On 1/7/21 6:41 PM, Romain Naour wrote:
> I believe CMake try to check clang as cross-compiler before using it.
> Can you share the CMake error log file ?


Here are the contents of the CMakeError.log file:

>>>

Determining if the CLC compiler works failed with the following output:


Determining if the CLC compiler works failed with the following output:


Determining if the CLC compiler works failed with the following output:


Determining if the CLC compiler works failed with the following output:

<<<

CMakeOutput.log is a bit too big to share here

>
> For now, host/bin/clang can't be used as cross-compiler to build application
> (the simple test program) because we need to add a wrapper like for gcc.
>
> configure.py was kind enough to accept host/bin/clang as is to build libclc library.
>
> If we can skip the cmake test, the library should build as before.

Ok, I'll try.

> I don't think we have to build libclc before clang, as you can see in the
> current packaging only mesa3d depends on libclc. Clang itself doesn't depend on
> libclc.
>
> You can find some details about the initial work in this blog:
> https://www.linuxembedded.fr/2018/07/llvmclang-integration-into-buildroot/


Great! This will definitely be useful.

Many thanks,

Michael.

-- 
Michael Opdenacker, CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
