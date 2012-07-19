From: Charles Krinke <charles.krinke@gmail.com>
Date: Thu, 19 Jul 2012 09:32:34 -0700
Subject: [Buildroot] Qt on AM3517EVM
In-Reply-To: <20120719181109.481c2882@jl-desk-LL>
References: <CALo-6+hhvCkfT_4Rz4POqw5j_BPPLKHZ0saqEyeiKsp-tSJLdA@mail.gmail.com>
 <20120717093212.0c7d5415@skate>
 <CALo-6+hsekD6L5pZhmsZD_4mW0CQTLbearUxdr-F_HitXq5W9Q@mail.gmail.com>
 <20120719181109.481c2882@jl-desk-LL>
Message-ID: <CALo-6+j_ZrbQhRWE9vyLs2aWh=7Hm7r3+4qN8xSKbFtxOLbrEA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the encouragement, Julian. I agree on the Qt5 question,
especially as I have a long list of things that need to be done first.

One thing I have been struggling with the the last day or so is the
console. Maybe you have a suggestion.

TI defines their 3rd serial port as the console and their uImage sets
it as "ttyO2" (that's ohh, not zero). Their uImage displays this as it
starts. I can also see that TI's omap-serial.c driver enumerates as a
console. I can also see that if I poke the THR (transmit holding
register) directly on their 3rd uart, I can emit a character.

But, what doesnt work is respawning the console as ttyO2 in inittab or
$ echo "astring" > /dev/ttyO2

So, something else is not quite right. I can boot to linux as long as
I use single user mode.

Any suggestions or comments (including RTFM, although a URL would
help) would be appreciated.

Charles

On 7/19/12, Julian Lunz <git@jlunz.de> wrote:
> Hi Charles:
>
> Glad to hear that you succeeded in building!
>
> Since you're targeting a TI-chip, have a look at these links:
> http://gpupowered.org/node/8
> https://github.com/prabindh/qt-configs
>
> For a Qt5 package, I'd wait a bit longer until it reaches final, current
> release plan:
>
> Beta : release expected by mid-July 2012
> Final: release expected by September 2012
>
> Julian
>
>
> On Tue, 17 Jul 2012 06:44:49 -0700
> Charles Krinke <charles.krinke@gmail.com> wrote:
>
>> Dear Thomas:
>>
>> Could you give us (me) a few pointers on the pre-requisite packages
>> and the path to move along to get Qt5 put together for buildroot?
>> Maybe with your guidance one of us can get at least partway down that
>> path.
>>
>> Charles
>>
>> On 7/17/12, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> wrote:
>> > Le Mon, 16 Jul 2012 10:40:23 -0700,
>> > Charles Krinke <charles.krinke@gmail.com> a ?crit :
>> >
>> >> First of all, +100 for Thomas, Arnout and Julian. This morning, I
>> >> was able to load the jffs2 compiled file system from buildroot and
>> >> run "ts_calibrate" and got a functioning touch screen and color
>> >> LCD with Qt on the LogicPD AM3517EVM after *removing* the
>> >> environment variable QMAKESPEC which the TI-SDK insisted on adding
>> >> to my .bashrc.
>> >
>> > Great.
>> >
>> >> Of course, no sooner had I gotten it to work then my customer says
>> >> "Thats cool, how about Qt5?"
>> >>
>> >> So, ... are we considering either a Qt5 bump or either Qt4/Qt5
>> >> with an xconfig option?
>> >
>> > I think Qt5 needs a separate package from qt4, because many, many
>> > things have changed in Qt5. Also Qt5 apparently requires an OpenGL
>> > renderer, which wasn't the case in Qt4, so we will probably be
>> > keeping Qt4 around for quite a while for low-end platforms.
>> >
>> > Anyone willing to work on packaging Qt5 is definitely more than
>> > welcome to contribute such effort.
>> >
>> > Thanks!
>> >
>> > Thomas
>> > --
>> > Thomas Petazzoni, Free Electrons
>> > Kernel, drivers, real-time and embedded Linux
>> > development, consulting, training and support.
>> > http://free-electrons.com
>> >
>>
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Charles Krinke
