From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 6 Feb 2009 13:18:48 -0200
Subject: [Buildroot] What's up with the kernel names? (Again)
In-Reply-To: <d6cda7730902060631o54f2944rddc0f7cd8278a11a@mail.gmail.com>
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
	<873aeue676.fsf@macbook.be.48ers.dk>
	<1233865432.4148.6.camel@elrond.atmel.com>
	<87eiycarei.fsf@macbook.be.48ers.dk>
	<D071C392448744ECA7A451C54A46ABE6@aeglos>
	<d6cda7730902060631o54f2944rddc0f7cd8278a11a@mail.gmail.com>
Message-ID: <d6cda7730902060718x3fc1ef01q401f0dc5a9bb12e6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 6, 2009 at 12:31 PM, Thiago A. Corr?a
<thiago.correa@gmail.com> wrote:
> Ulf> If you add KERNEL_VERSION to the root fs name you do things
> Ulf> automatically, if you dont then everything is manually, and you
> Ulf> have a risk of mismatch between name and actual version.  I
> Ulf> would not mind that the rootfs contains kernel version, but it
> Ulf> will break the at91 u-boot autoscripts which means that it
> Ulf> should avoided at this point, and introduced in a future
> Ulf> buildroot.
>
> I suspect that the autoscript generation uses the same variable as the
> kernel build. Otherwise it's impossible to predict your current naming
> scheme. If so, it wouldn't break anything, as the variable is
> preserved, just it's contents changed slightly.

From target/u-boot/Makefile.in:
        echo setenv linux $(LINUX26_KERNEL_NAME).gz >> $(U_BOOT_AUTOSCRIPT)

So, it should be ok.
