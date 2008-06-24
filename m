From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 24 Jun 2008 09:00:17 +0200
Subject: [Buildroot] Modular X.org
References: <46a136670806231024o11a8f649r583107ac041c23e2@mail.gmail.com><87od5sau6s.fsf@macbook.be.48ers.dk><46a136670806231136r421060aatb105a6bb59ef1f4d@mail.gmail.com><87iqvzalr1.fsf@macbook.be.48ers.dk>
	<d6cda7730806231513y75b87d5am960d9bbc137a8e5b@mail.gmail.com>
Message-ID: <00c501c8d5d1$fff449a0$0a0514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thiago A. Corr?a wrote:
> On Mon, Jun 23, 2008 at 6:23 PM, Peter Korsgaard <jacmet@uclibc.org>
> wrote: 
>>  John> To be perfectly honest, I don't have the time to argue about
>>  John> whitespaces and other "nonsense", so I don't commit directly
>>  to John> uClibc.org anymore. I'm just offering up the work I've
>>  done if John> anyone is interested, because modular xorg has been a
>>  topic of John> some interest around the message boards.
>> 
>> That's honest talk. I might not agree, but it's honest atleast. Does
>> this mean that you don't need your uclibc svn access anymore?
>> 
> 
> Peter,
> 
>    That might not be all of the reasons. It's not just whitespaces
> that got reverted, but things that are very important to John, Amaur
> and me, such as AVR32 toolchain. That was pretty much the turning
> point. I even dare to say that it was the wishes of every single AVR32
> user to keep the buildroot toolchain support, but then again, my
> arguments either felt in to deaf ears or were just not compelling
> enough.

No, I am an AVR32 user, but I do not want the tree overloaded
with redundant patches.
You can build a toolchain using the external source.
The only difference is that you download the source 
*with* the patches from a different location, otherwise the build
process is identical.
If you need to fix something, you can apply patches.
The patches has to be located in target/device/Atmel/toolchain.

John requested that I put his prepatched toolchain source in the 
ATMEL_MIRROR and this was done within days after the
request, and it will not be hard to start supporting this
if someone is interested, and then the AVR32 toolchain
should have support for the latest version.
Again, if patches are needed for this, they can be added
to target/device/Atmel/toolchain tree.

Once I have time to test this, I will fix it, but unless
we have a rainy summer, I expect this to occur in August.

I know that there is complaints about not having write access
to the ATMEL_MIRROR. I do not need them to be at
this particular server, I prefer a server which will allow
access to more people.
Until we have a mirror with high bandwidth and high capacity
and accessible to all users with write access, I hope
we can live with this solution.  The cost will be a few days
of delay every time a completely new gcc version will
be available.

There was also complaints about speed, but I measured the download speed to several MBytes/s
so this must be temporary problems.

I have requested that the Atmel Trondheim provide official
prepatched source code of the toolset, but they think
that it is so close to have the toolchain support natively
that they think it is not worth the effort.
Hopefully they are right.

>   Anyway, even though I do plan to commit and support upstream
> buildroot, I will still keep committing to the google buildroot as
> well, for that reason. The platform/processor that we all who have
> access to the google fork use the most simply does not work upstream,
> and we hear objections when we try to improve that.
> 

No objections to improvements, but you can do it without adding
the large patches.

>   If disk space is more important, that's fine and I'm not going to
> try to change that, we just move that part to Google who doesn't have
> any issues with AVR32 patches.
> 
> Kind Regards,
>   Thiago A. Correa
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57


Technical support when I am not available:
AT90 AVR Applications Group: mailto:avr at atmel.com
AT91 ARM Applications Group: mailto:at91support at atmel.com
AVR32 Applications Group        mailto:avr32 at atmel.com
http://www.avrfreaks.net/;            http://avr32linux.org/
http://www.at91.com/ ;                 http://www.linux4sam.org/
