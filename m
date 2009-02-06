From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 6 Feb 2009 00:28:01 -0200
Subject: [Buildroot] What's up with the kernel names? (Again)
In-Reply-To: <1233866252.4148.12.camel@elrond.atmel.com>
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
	<873aeue676.fsf@macbook.be.48ers.dk>
	<d6cda7730902041833r5e5af2ax26c0eebb48df19a4@mail.gmail.com>
	<87vdrpaug2.fsf@macbook.be.48ers.dk>
	<1233866252.4148.12.camel@elrond.atmel.com>
Message-ID: <d6cda7730902051828if9915d3u31cf79bf5a68fcac@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 5, 2009 at 6:37 PM, Ulf Samuelsson <ulf.samuelsson@atmel.com> wrote:
>>  Thiago> It will use the rootfs suffix if one is specified for the kernel, but
>>  Thiago> if none is supplied, we get default kernel names. Then you can get
>>  Thiago> both rootfs and kernel with your board names, dates, etc. And both
>>  Thiago> rootfs and kernel names will always match.
>>
>
>
> And you have no clue about the kernel version.
> And you have to modify the suffix for every project.
> Much better to just create the link to uImage etc.
>
> Then you have both.

But if you use the rootfs suffix, not only you have both, but you also
can disable it.
Following your argument, I might just as well want to have rootfs in
/tftpboot, and if the names match (same suffix) then I know which
kernel is inside each rootfs image.

The $(DATE) seams to be default to rootfs suffix already, all you have
to do is change it per project to include the project or board name.
You have to touch your projects at some point to change things anyway,
otherwise they would always build the same thing, so that's not a very
good argument against.

You can have the same functionality as before, but with added flexibility.

I'm just trying to test it out before commiting. Since I can't build
my usual platform, avr32, I'm giving arm a try.

Kind Regards,
   Thiago A. Correa
