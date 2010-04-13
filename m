From: Ravi Kumar Kulkarni <ravilinux4u@gmail.com>
Date: Tue, 13 Apr 2010 16:41:33 +0545
Subject: [Buildroot] module-init-tools build problem in Buildroot
	buildroot-2010.02
In-Reply-To: <n2z47b4a4c91004100711h5517cedfx17cfde4953402a3@mail.gmail.com>
References: <w2p47b4a4c91004061809l6fbeffdz4cb71ef7d7a19557@mail.gmail.com>
	<x2i532dd5841004062307z6b769350p63d09e0b90226dea@mail.gmail.com>
	<q2u47b4a4c91004070743w5498b7ddu8e3d4ca048202da0@mail.gmail.com>
	<j2r532dd5841004082152z14e3a4a6y98097dbbe7f75680@mail.gmail.com>
	<n2z47b4a4c91004100711h5517cedfx17cfde4953402a3@mail.gmail.com>
Message-ID: <k2r532dd5841004130356t8aca0068i6f36b6c4fddf22fe@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Sat, Apr 10, 2010 at 7:56 PM, Chris Kerios <ckerios@gmail.com> wrote:
> Fixed it!!!
>
> Sometimes when we have too much knowledge it kills us, we just don't look at
> what's in front of our faces!
>
> As it turns out the system was telling me just what I needed to know.? The
> build was looking for libc, but it was looking for libc.a.? Fedora 12
> doesn't install the statically linked version by default and only installs
> the dynamic libs...
ok. i also tried something similar today
I tried module-init tools today morning and was facing same problem.
so for module init tools to compile all u av do is
"yum install glibc-static " on fedora.
so it will now compile . for other distros please replace the
correspoonding with yum

warm regards,
Ravi Kulkarni.

>
> Went to Fedora site and downloaded the static version of the library and
> everything runs just fine.? What I don't know is why.? I would think that
> the dynamic library would have resolved just as well but it doesn't appear
> to.? This I believe is beyond my learning at this point.? Anybody out there
> that can explain to me what is going on?? Just trying to learn...
>
> Tha
>
> On Fri, Apr 9, 2010 at 12:52 AM, Ravi Kumar Kulkarni <ravilinux4u@gmail.com>
> wrote:
>>
>> Hi Chris
>>
>> On Wed, Apr 7, 2010 at 8:13 PM, Chris Kerios <ckerios@gmail.com> wrote:
>> > Hi Ravi,
>> > Thanks for your prompt reply.? I have been playing with this all morning
>> > and
>> > am at my wits end.? So far I am still unsuccessful.? I understand what
>> > you
>> > are saying about the build not finding the "c" library.? I have looked
>> > all
>> > over my system (Fedora 12) and the C libs and links to those libs all
>> > look
>> > to be in place and with the right permissions.? I have tried all sorts
>> > of
>> > tricks including exporting the LD_LIBRARY_PATH variable and editing the
>> > Makefile to force it to look in the system lib directories.? ldconfig -p
>> > shows:
>> >
>> > libc.so.6 (libc6, hwcap: 0x0018000000000000, OS ABI: Linux 2.6.18) =>
>> > /lib/i686/nosegneg/libc.so.6
>> > ??? libc.so.6 (libc6, OS ABI: Linux 2.6.18) => /lib/libc.so.6
>>
>> ?all i could say is try to make sure the link u av given is correct by
>> ldd.
>>
>> warm regards,
>> Ravi Kulkarni.
>> >any ideas???? I'm sinking here and exceeded any knowledge I have on this
>> > one.
>> > Regards,
>> > Chris
>> >
>> > On Wed, Apr 7, 2010 at 2:07 AM, Ravi Kumar Kulkarni
>> > <ravilinux4u@gmail.com>
>> > wrote:
>> >>
>> >> Hi Chris
>> >>
>> >> On Wed, Apr 7, 2010 at 6:39 AM, Chris Kerios <ckerios@gmail.com> wrote:
>> >> > Hello,
>> >> > I am a relative noob when it comes to using buildroot as I am just
>> >> > getting
>> >> > started with embedded on an old AVR32ngw board.? I am running Fedora
>> >> > 12
>> >> > as
>> >> > my host and I am trying to build the toolchain, kernel, etc. using
>> >> > buildroot
>> >> > from scratch.? Cool work/tool by the way!? Anyway I am getting the
>> >> > following
>> >> > error message attached below.? I have scoured the mailing list
>> >> > archive
>> >> > on
>> >> > this and can only find 1 reference in which the person asked the
>> >> > question
>> >> > and then followed up immediately with notice that he fixed the
>> >> > problem.
>> >> > He
>> >> > only left a vague reference that it had something to do with glibc
>> >> > not
>> >> > being
>> >> > built for his target.? If this is the case, I can't figure it out as
>> >> > the
>> >> > module-init-tools is built after the successful build of gcc, ulibC,
>> >> > gdb,
>> >> > etc.? If it has anything to do with my host I have all the glibc and
>> >> > glibc-devel built on the Fedora side as well.? Dumb question here:
>> >> > Which
>> >> > C
>> >> > lib is it looking for?? The ulibC under the buildroot directory I am
>> >> > building the toolchain/cross-compiler in or the Fedora host glibc?
>> >> >
>> >> > Am I missing something here?
>> >> > Thanks in Advance.
>> >> >
>> >> >
>> >> > modinfo.c: In function ?main?:
>> >> > modinfo.c:338: warning: ?infosize? may be used uninitialized in this
>> >> > function
>> >> > /usr/lib/ccache/gcc? -g -O2 -Wunused -Wall?? -o modinfo? modinfo.o
>> >> > zlibsupport.o
>> >> > /usr/lib/ccache/gcc? -g -O2 -Wunused -Wall?? -o insmod.static -static
>> >> > insmod.o
>> >> > /usr/bin/ld: cannot find -lc
>> >>
>> >> lc means tat GCC does not find link to C library ,which ?is something
>> >> strange.
>> >> try to create a symbolink for lc and tat should hopefull work.please
>> >> try n let me know.
>> >>
>> >>
>> >> > collect2: ld returned 1 exit status
>> >> > make[1]: *** [insmod.static] Error 1
>> >> > make[1]: Leaving directory
>> >> >
>> >> >
>> >> > `/home/chris/buildroot-avr32-v2.3.0/toolchain_build_avr32/module-init-tools-3.2.2'
>> >> > make: ***
>> >> >
>> >> >
>> >> > [/home/chris/buildroot-avr32-v2.3.0/toolchain_build_avr32/module-init-tools-3.2.2/depmod]
>> >> > Error 2
>> >> >
>> >> warm regards,
>> >> Ravi Kulkarni.
>> >
>> >
>> > _______________________________________________
>> > buildroot mailing list
>> > buildroot at busybox.net
>> > http://lists.busybox.net/mailman/listinfo/buildroot
>> >
>
>
