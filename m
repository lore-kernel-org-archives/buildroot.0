From: Charles Krinke <charles.krinke@gmail.com>
Date: Sat, 14 Jul 2012 15:00:18 -0700
Subject: [Buildroot] Qt tribulations take 2
In-Reply-To: <20120714182555.4b7b267d@jl-desk-LL>
References: <CALo-6+iZBhkaZJCOG8BLNOGfV36C_ZOHx+-U7hzuArLbrTmN4w@mail.gmail.com>
 <20120713165557.1b39651c@skate>
 <CALo-6+gv+zb1peT7ngOGLL7VnS6xpCUOZRn_J6CD86Kmn7vX=A@mail.gmail.com>
 <20120714182555.4b7b267d@jl-desk-LL>
Message-ID: <CALo-6+hSrFrqua1s48qzYn9J8qF0F6=zCpgfbguO2hf3VmqeOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Julian:

You were right as usual. It was an environment variable. It was
QMAKESPEC which was set by my installation of the TI SDK a week ago. I
should have checked my  .bashrc after installing the SDK, but I did
not expect any environment changes as a result of installing a
toolchain and u-boot source.

I can compile successfully Qt with the buildroot generated toolchain
now. However, that gets me to the next step. When I try to go back to
using TI's external toolchain, I get this error with libtool. I get no
corresponding libtool error with the buildroot compiled toolchain.
Would you be willing to comment on what might be going on here?

Charles

libtool: Version mismatch error.  This is libtool 2.2.10, but the
libtool: definition of this LT_INIT comes from libtool 2.2.6b.
libtool: You should recreate aclocal.m4 with macros from libtool 2.2.10
libtool: and run autoconf again.
make[5]: *** [gcache.lo] Error 63
make[5]: *** Waiting for unfinished jobs....
libtool: Version mismatch error.  This is libtool 2.2.10, but the
libtool: definition of this LT_INIT comes from libtool 2.2.6b.
libtool: You should recreate aclocal.m4 with macros from libtool 2.2.10
libtool: and run autoconf again.
m

On Sat, Jul 14, 2012 at 9:25 AM, Julian Lunz <git@jlunz.de> wrote:
> Took your provided config and gave it a try on my machine (32bit-Ubuntu
> 10.04).
> Went through without any hassles :/
> What's your environment?
>
>
>  On Fri, 13 Jul 2012 08:41:37 -0700
> Charles Krinke <charles.krinke@gmail.com> wrote:
>
>> My apologies, Thomas, I did mean buildroot-2012.05 and here is its
>> .config renamed as dotconfig. In the mean time, I am frustrating
>> myself with !#$%* openembedded in an attempt to glean some knowledge
>> about how Qt fits together in an embedded environment as I slide into
>> this new project.
>>
>> Charles
>>
>> On Fri, Jul 13, 2012 at 7:55 AM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>> > Le Fri, 13 Jul 2012 06:51:34 -0700,
>> > Charles Krinke <charles.krinke@gmail.com> a ?crit :
>> >
>> >> Let me start over with my Qt question.
>> >>
>> >> I downloaded buildroot-2011.05 and ran several tests, each with
>> >> "make
>> >
>> > I presume you wanted to say 2012.05, right?
>> >
>> >> clean && make" and each with C++ support checked, both with powerpc
>> >> and arm and the results are the same, so either my understanding of
>> >> what to click in xconfig is faulty (probable) or there is an issue
>> >> in the Qt package scripts. In both cases, I can compile
>> >> successfully without Qt checked and in both cases, I get into
>> >> problems with Qt checked. I would have expected one of powerpc or
>> >> arm to successfully compile and wonder if a suggestion could be
>> >> made. Creating qmake. Please wait...
>> >> make[1]: Entering directory
>> >> `/home/ckrinke/buildroot-2012.05/output/build/qt-4.8.1/qmake'
>> >> make[1]: c: Command not found
>> >> make[1]: [project.o] Error 127 (ignored)
>> >> make[1]: c: Command not found
>> >> make[1]: [property.o] Error 127 (ignored)
>> >
>> > Please send your Buildroot .config file.
>> >
>> > Thanks!
>> >
>> > Thomas
>> > --
>> > Thomas Petazzoni, Free Electrons
>> > Kernel, drivers, real-time and embedded Linux
>> > development, consulting, training and support.
>> > http://free-electrons.com
>> > _______________________________________________
>> > buildroot mailing list
>> > buildroot at busybox.net
>> > http://lists.busybox.net/mailman/listinfo/buildroot
>>
>>
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Charles Krinke
