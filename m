From: Andrew Dyer <amdyer@gmail.com>
Date: Wed, 30 Sep 2009 00:11:37 -0500
Subject: [Buildroot] problems building git head
In-Reply-To: <c166aa9f0909291514o4ba70e3p277df9dc924f9bb6@mail.gmail.com>
References: <c166aa9f0909291340j54ae2835o233fad9d89fdf96b@mail.gmail.com>
	<87fxa5pif5.fsf@macbook.be.48ers.dk>
	<c166aa9f0909291514o4ba70e3p277df9dc924f9bb6@mail.gmail.com>
Message-ID: <c166aa9f0909292211n7da2f8c0qb6adbde34a2a10f3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 29, 2009 at 5:14 PM, Andrew Dyer <amdyer@gmail.com> wrote:
> On Tue, Sep 29, 2009 at 4:09 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>>> "Andrew" == Andrew Dyer <amdyer@gmail.com> writes:
>>
>> ?Andrew> Hi - I'm attempting to build buildroot on a debian based system and
>> ?Andrew> having problems. ?Problem occured both on 2009.08 and on git head.
>> ?Andrew> I configured buildroot for generic ARM, EABI, and ramdisk via 'make
>> ?Andrew> menuconfig' and saved the config file. When I do 'make', I get:
>>
>> ?Andrew> package/multimedia/libvorbis/libvorbis.mk:20: *** missing `endif'. ?Stop.
>>
>> No, I haven't seen that (I use Debian as well). Please post your .config
>> so I can try to reproduce it.
>>
>
> Thanks for your help. ?Attached is the .config file and the output of
> 'make -d' (make -n doesn't return anything but the missing `endif'
> error message). ?I'm not a debian expert, but I believe the box is
> running 'Lenny' (based on /etc/issue)

I know part of the problem now - the machine in question has an
install of MontaVista 4.0 cross development tools on it, and it has an
old version of gnu make with the tools that was getting picked up
before the normal make due to path settings.

I updated the path and the compile is running now.  I'm still curious
what about the older make is not grokking in the Makefiles, but my
immediate roadblock is past.

Thanks for looking at this.
