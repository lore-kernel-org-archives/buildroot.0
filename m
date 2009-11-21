From: Nicholas Walton <nwalton@aplopteng.com>
Date: Sat, 21 Nov 2009 10:20:53 -0800
Subject: [Buildroot] How do I configure the kernel?
In-Reply-To: <he7s4s$330$1@ger.gmane.org>
References: <he74ti$hbd$1@ger.gmane.org>
	<b680c1c10911201430s25dadd6aj8d1c48afaff91445@mail.gmail.com> 
	<b680c1c10911201435k3e8e6988pea7dcaaa301ee5d7@mail.gmail.com> 
	<he7s4s$330$1@ger.gmane.org>
Message-ID: <b680c1c10911211020m45f8c6demf05edc4e92883430@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 20, 2009 at 9:00 PM, Grant Edwards
<grant.b.edwards@gmail.com> wrote:
> On 2009-11-20, Nicholas Walton <nwalton@aplopteng.com> wrote:
>> On Fri, Nov 20, 2009 at 2:23 PM, Grant Edwards
>><grant.b.edwards@gmail.com> wrote:
>>> How do you configure the kernel when using buildroot?
>>
>> make linux26-menuconfig
>
> Doh! ?I trield make kernel-menuconfig and several other
> variations. ?For future reference, is there somewhere that's
> documented?

I don't recall. I think I found it by bash autocomplete on make.

> The next question was going to be where do I put a kernel
> .config file if I already have one I want to use. ?I can
> probably do a "find" to search for files named .config and
> figure out which is the right one. Then I assume I do "make
> linux26-oldconfig"?

In target/devices/{manufacturer}/{board} as linux-{version}.config, if
I recall correctly. You can automatically create or update the
appropriate file with "make linux26-update". And either menuconfig or
oldconfig will fetch the linux-{version}.config file if
output/build/linux-$version/.config does not exist.

Nicholas

>
>> Other targets, such as Busybox, follow the same convention.
>
> Yes, the docs do explain how to configure busybox and uclibc.
> I just hadn't guessed the correct "label" for doing the same
> thing for the kernel.
>
> --
> Grant
