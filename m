From: Nataraj S Narayan <natarajsn@gmail.com>
Date: Sun, 20 Jun 2010 12:41:10 +0530
Subject: [Buildroot] Buildroot] [PATCH 08/10] linux: adjust kernel config
	according to the Buildroot configuration
Message-ID: <AANLkTim0tMStgE2C6v8-_laWvfIOZfIDD8n5PiaxFq_B@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I was using  atmel patched kernel 2.6.30 on at91sam9263 Sbc with
CONFIG_OABI_COMPAT=y default.  But when disabled, my freepascal (
ww.freepascal.org) binanies wouldnt work.

Maybe fpc dont generate  fully EABI for arm-uclibc.


regards

Nataraj




On Sat, Jun 19, 2010 at 11:15 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> writes:
>
> Hi,
>
>  >> I'm not sure I like this hardcoded policy. What if the user wants to
> run
>  >> some precompiled OABI binaries together with his EABI rootfs?
>
>  Thomas> I don't really like this hardcoded policy either, but I kept what
>  Thomas> existed before.
>
>  Thomas> What should we do ? Just not modify the kernel configuration,
> except
>  Thomas> for the initramfs case ? Isn't the EABI thing going to hit a large
>  Thomas> number of users, coming back with a "my Busybox init doesn't
> start"
>  Thomas> question ?
>
> I find the EABI one ok, but the COMPAT thing is afaik just an
> optimization, it doesn't really harm to have it enabled.
>
>  Thomas> +      yes "" | $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) oldconfig
> 2>&1 >/dev/null
>  >>
>  >> The yes shouldn't be needed, and I don't like hiding errors.
>
>  Thomas> It does not hide errors, it uses the default choice for every
> unset
>  Thomas> option :-)
>
> It's the 2>&1 >/dev/null that I don't like - That does hide errors.
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100620/bb5d28f8/attachment.html>
