From: Wade Berrier <wberrier@gmail.com>
Date: Fri, 1 Aug 2008 08:27:02 -0600
Subject: [Buildroot] my /etc/init.d/rcS won't run
In-Reply-To: <46a136670808010612r747b3315w1aa8d786b329ea10@mail.gmail.com>
References: <oVJvhsJM.1217543786.9718410.beattie@localhost>
	<4892BA2F.60606@cetrtapot.si> <1217594857.6188.11.camel@kokopelli>
	<46a136670808010612r747b3315w1aa8d786b329ea10@mail.gmail.com>
Message-ID: <bbbeeccd0808010727i23184f1ey54d7dd38376d6716@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm also running into this.

I've found out so far that bash is segfaulting when getting run from init.

Attached is an strace of this happening.

Wade

On Fri, Aug 1, 2008 at 7:12 AM, John Voltz <john.voltz@gmail.com> wrote:
>>
>> What I found was that including bash, caused /bin/sh to point to bash
>> and for dome reason bash does not want to run that early.  Currently
>> I've dropped bash.
>
> Try adding init=/bin/bash to your kernel parameters in your bootloader. This
> will boot you directly into a bash shell without running init, so you can
> see if something's wrong with bash.
>
> John
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: bash_strace_init.txt
Url: http://busybox.net/lists/buildroot/attachments/20080801/6622add6/attachment-0001.txt 
