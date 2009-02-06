From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 6 Feb 2009 12:31:18 -0200
Subject: [Buildroot] What's up with the kernel names? (Again)
In-Reply-To: <D071C392448744ECA7A451C54A46ABE6@aeglos>
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
	<873aeue676.fsf@macbook.be.48ers.dk>
	<1233865432.4148.6.camel@elrond.atmel.com>
	<87eiycarei.fsf@macbook.be.48ers.dk>
	<D071C392448744ECA7A451C54A46ABE6@aeglos>
Message-ID: <d6cda7730902060631o54f2944rddc0f7cd8278a11a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 6, 2009 at 6:56 AM, Ulf Samuelsson <ulf.samuelsson@atmel.com> wrote:
> Can we agree on
> $(PROJECT)-linux-$(LINUX_VERSION)$(<XXX>_SUFFIX).$(<XXX>_EXT)
>
> and leave $(DATE) in SUFFIX?
>
> This is a stable name, and also gives the information I require.
>

What's wrong with ROOTFS_SUFFIX = -$(PROJECT)-$(LINUX_VERSION)$(DATE) ?

You will get everything you had before, albeit in a different order
(uImage-myprojec-2.6.28-20080106)

I work on different projects all the time, most of the time more than
2, and I don't see how that information is usefull at all. All I
really need to preserve is a copy of buildroot and dl folder. On the
other hand, the support ppl just need to preserve the firmware image
(rootfs in this case). Binaries are of no use to a developer, we need
is to be able to reproduce builds.

Whenever I need to update something in a product, it usually goes in a
full system update. The kernel is no speciall case for updates, it's
just one of the many stuff in rootfs.

On the other hand, during developent, you will often need to repeat
the build with the same configuration over and over. Specially if you,
like me, needs to add your own custom programs in there. It doesn't
make any sense then having several binaries of all your previous
failled attempts.

But please, again notice, that we are not forcing our way on others.
It's still possible to get all that info into the generated files if
you want. Plus, if you have many different projects, you know which
kernel belongs to each rootfs, since the suffix matches.


Ulf> If you add KERNEL_VERSION to the root fs name you do things
Ulf> automatically, if you dont then everything is manually, and you
Ulf> have a risk of mismatch between name and actual version.  I
Ulf> would not mind that the rootfs contains kernel version, but it
Ulf> will break the at91 u-boot autoscripts which means that it
Ulf> should avoided at this point, and introduced in a future
Ulf> buildroot.

I suspect that the autoscript generation uses the same variable as the
kernel build. Otherwise it's impossible to predict your current naming
scheme. If so, it wouldn't break anything, as the variable is
preserved, just it's contents changed slightly.

Kind Regards,
   Thiago A. Correa
