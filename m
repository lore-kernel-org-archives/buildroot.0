From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 9 Feb 2009 23:25:15 -0200
Subject: [Buildroot] What's up with the kernel names? (Again)
In-Reply-To: <1234219930.4143.16.camel@elrond.atmel.com>
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
	<873aeue676.fsf@macbook.be.48ers.dk>
	<1233865432.4148.6.camel@elrond.atmel.com>
	<87eiycarei.fsf@macbook.be.48ers.dk>
	<D071C392448744ECA7A451C54A46ABE6@aeglos>
	<d6cda7730902060631o54f2944rddc0f7cd8278a11a@mail.gmail.com>
	<1234200240.4143.8.camel@elrond.atmel.com>
	<87hc3376b4.fsf@macbook.be.48ers.dk>
	<1234219930.4143.16.camel@elrond.atmel.com>
Message-ID: <d6cda7730902091725o4f4adce7iddd0676ae1684a25@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 9, 2009 at 8:52 PM, Ulf Samuelsson <ulf.samuelsson@atmel.com> wrote:
> m?n 2009-02-09 klockan 20:34 +0100 skrev Peter Korsgaard:
>> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
>>
>> Hi,
>>
>>  >> You will get everything you had before, albeit in a different order
>>  >> (uImage-myprojec-2.6.28-20080106)
>>  >>
>>
>>  Ulf> Which breaks the U-Boot autoscripts.
>
>> Why? It looks like it uses LINUX26_KERNEL_NAME.
>>
>
> They work with the patches to u-boot which assumes
> that the name look like they used to.
> If the new naming remains, who is going to fix the u-boot patches?
>

I don't see anywhere where the kernel name is referenced in u-boot
except for the generation of the script, which I fixed. Looks like
Peter is also unable to guess what you are talking about. Perhaps you
might care to enlighten us.

>>  Ulf> I need it in this specific order.
>>  Ulf> I also would like to avoid unneccesary problems
>>  Ulf> due to someone forgetting to update strings.
>>
>> Then set the appropriate _SUFFIX / _PREFIX variables.
>>
>
> AGAIN: How can you RETROACTIVELY set _SUFFIX/_PREFIX
> if you forgot to set _SUFFIX/_PREFIX and thus
> overwrote another project.

Are you serious? It's irresponsible not to use version control for
work related development. If someone forgets to set it and they really
want to, they would detect it the first time they built and tested the
system.
Also, after said test, they would imediatly notice that if they want
to keep the binary, they should save it. That's the same for every
tool that generates binaries, from compilers, to CADs, even text
editors.

> It is high maintenance and error prone to do it this way.
>

You are probably only looking at this with the eyes of a chip
manufaturer. Atmel makes boards, we, customers from Atmel, we build
projects or products. We have boards that are used in countless
products, whose only difference is their firmwares or daughter boards.
It's not a BOARDNAME variable that will keep things from being
overwritten or completely mixed up to the point that it's impossible
to tell what is the contents of the rootfs.


>>  Ulf> And I repeat, I want all files related to a specific project
>>  Ulf> to be sorted together.
>>
>> Then put them in /tftpboot/<project>/.
>>
>
> Which again means fixing u-boot patches.
> Who is going to do that
> You suggested previously that the person breaking the build
> needs to fix it.
> Does that still apply?
>

As I said, it looks just ok to me. If you explain what seems to be the
problem I could take a look and see if I'm able to do it.
This policy won't work for long: If I don't have the skills to fix it,
no amount of complains is going to help unless explained. You can't
expect everyone on a project to have the same skills, not only unreal,
but also hurts the project as it drives away contributions. Helping
and explaining is much better than complaining.

I did my best not to break things. The build isn't broken on any of
the tests I've made, and I even got a u-boot.bin, therefore things
can't be horribly broken.

Regards,
    Thiago A. Correa
