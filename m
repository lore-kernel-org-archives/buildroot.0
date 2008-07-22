From: John Voltz <john.voltz@gmail.com>
Date: Tue, 22 Jul 2008 15:34:21 -0400
Subject: [Buildroot] Debugging VICE emulator for AVR32
In-Reply-To: <48863574.4040806@mimc.co.uk>
References: <46a136670806181844p49b1c2e8lbaedac85bb739f29@mail.gmail.com>
	<877iclx5ur.fsf@macbook.be.48ers.dk> <48863574.4040806@mimc.co.uk>
Message-ID: <46a136670807221234g363b7764wbdec66c7bfad05f7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

My problem was that VICE wasn't being linked against libpthread. Simply
adding a LDFLAGS="-lpthread" to the configure statement fixed it.

John


On Tue, Jul 22, 2008 at 3:31 PM, Mark Jackson <mpfj@mimc.co.uk> wrote:

> Peter Korsgaard wrote:
>
>> I've also noticed pthread problems with avahi on uclibc 0.9.29 (on
>> PPC), but I haven't had time to debug it yet. The same setup works
>> with 0.9.28.3
>>
> Hi Peter,
>
> I'm also having problems with avahi-daemon segfaulting (on the NGW100
> defconfig plus avahi).
>
> I raised a ticket on avahi.org (http://avahi.org/ticket/224), and after a
> bit of novice gdb investgations have shown up a "pthread" function may well
> be the cause.
>
> In case of a post 0.9.29 bug fix, I did try to use the uclibc daily
> snapshot, but it didn't compile at all.
>
> Did you manage to get anywhere with this, or is it still outstanding ?
>
> Regards
> Mark
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080722/2a9a5c32/attachment.htm 
