From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 12 Mar 2014 10:57:32 +0100
Subject: [Buildroot] How to change buildroot directory
In-Reply-To: <5320168E.2090709@gmail.com> (Marco Trapanese's message of "Wed, 
 12 Mar 2014 09:10:54 +0100")
References: <5320168E.2090709@gmail.com>
Message-ID: <87ob1bpwmr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marco" == Marco Trapanese <marcotrapanese@gmail.com> writes:

 > Hello,
 > I prepared a virtual machine with a fully configured (and compiled)
 > buildroot filesystem/toolchain.
 > Now I have to transfer this buildroot environment to another machine,
 > which has a different path of course.

 > How this could be done?

 > Currently I tried:

 > 1) create from scratch a new buildroot clone on the new machine and
 > use my .config. Disadvantages: you need to recompile everything and
 > using the latest builds you cannot have the same version.

 > 2) copy the whole buildroot directory: the problem is every Makefile
 > has the old path... so it's not possible to launch a make without a
 > full clean/make cycle.

The host/build directory of buildroot is currently not relocatable, so
right now you only have option 1.

The issue is also listed in our TODO, but so far hasn't been
implemented:

http://elinux.org/Buildroot#Core_Buildroot_infrastructure

-- 
Bye, Peter Korsgaard
