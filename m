From: Charles Krinke <charles.krinke@gmail.com>
Date: Sat, 26 Feb 2011 14:45:59 -0800
Subject: [Buildroot] dtc (device tree compiler)
In-Reply-To: <87hbbqpikp.fsf@macbook.be.48ers.dk>
References: <AANLkTikXg3URUg5XqPJKey5X-0BsgE2gimAPGzF94oUR@mail.gmail.com>
	<87hbbqpikp.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTinEy5uDyc=7hQFwActuqDoVH0uKVA=PK8EiREFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry I was not clear enough.

I dont see a .dtb file anywhere after building the kernel, it just isnt
there.

I can see mention of libfdt and if_changed_dep,bootcc in the Makefile, but,
... I guess I am not quite a Makefile guru.

Maybe some dependency is not being satisfied that I need to setup in .config
somewhere?

Charles

On Sat, Feb 26, 2011 at 1:55 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Charles" == Charles Krinke <charles.krinke@gmail.com> writes:
>
>  Charles> I have a question about dtc. In the powerpc, a dtc (device
>  Charles> tree compiler) is used to compile a .dts file into a .dtb file
>  Charles> which is used by the kernel (uImage) to boot.
>
>  Charles> I dont see us compiling the .dts and creating the .dtb in the
>  Charles> MPC8323ERDB.
>
>  Charles> Is there a setting I am missing in buildroot? How does the dtc
>  Charles> get invoked to compile the .dts into a .dtb to go along with
>  Charles> the uImage file?
>
> This is all handled in the kernel (arch/powerpc/boot/Makefile) - And dtc
> is included in the kernel sources these days, so buildroot doesn't do
> anything special for it.
>
> The .dtb can be handled in a number of ways (embedded in bootloader,
> next to bootloader or together with/in uImage). Are you asking for
> options to somehow automate some of these choices?
>
> --
> Bye, Peter Korsgaard
>



-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110226/5f979ab8/attachment.html>
