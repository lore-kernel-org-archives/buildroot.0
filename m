From: Wade Berrier <wberrier@gmail.com>
Date: Mon, 4 Aug 2008 10:31:41 -0600
Subject: [Buildroot] my /etc/init.d/rcS won't run
In-Reply-To: <KAEOLFIOAJBBAFKHIDEACEBPEMAA.marc@tensilica.com>
References: <bbbeeccd0808010727i23184f1ey54d7dd38376d6716@mail.gmail.com>
	<KAEOLFIOAJBBAFKHIDEACEBPEMAA.marc@tensilica.com>
Message-ID: <bbbeeccd0808040931t57f01b5endea3440270d97f67@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Aug 1, 2008 at 9:55 AM, Marc Gauthier <marc@tensilica.com> wrote:
> We've also seen this in other architectures (Xtensa).
> Turned out bash turns off a whole bunch of features when cross-compiled,
> not sure why.  Someone worked around it by fiddling with the bash
> configure script, IIRC.  But we haven't yet come up with a patch to
> package/bash/bash.mk to fix it.  If you can do that, that would be great!
> (Or, talk to bash maintainers and fix the configure script itself.)

Thanks for the fix!  This turned out to be the case for me as well.
I'll attach a fix to the list momentarily.

Wade

>
> Don't know if that's the same problem you're seeing here.  We haven't
> sync'ed with the main buildroot tree in a few months.  So I could be
> way off here...
>
> -Marc
>
>
> Wade Berrier wrote:
>> I'm also running into this.
>>
>> I've found out so far that bash is segfaulting when getting run from init.
>>
>> Attached is an strace of this happening.
>>
>> Wade
>>
>> On Fri, Aug 1, 2008 at 7:12 AM, John Voltz <john.voltz@gmail.com> wrote:
>> >>
>> >> What I found was that including bash, caused /bin/sh to point to bash
>> >> and for dome reason bash does not want to run that early.  Currently
>> >> I've dropped bash.
>> >
>> > Try adding init=/bin/bash to your kernel parameters in your
>> bootloader. This
>> > will boot you directly into a bash shell without running init,
>> so you can
>> > see if something's wrong with bash.
>> >
>> > John
>
>
>
