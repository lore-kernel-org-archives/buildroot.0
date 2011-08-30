From: Michael S. Zick <minimod@morethan.org>
Date: Tue, 30 Aug 2011 17:17:41 -0500
Subject: [Buildroot] Linux kernel hangs after boot without any error!
In-Reply-To: <878vqaoa2j.fsf@macbook.be.48ers.dk>
References: <CADfuMF78u9we4HXSKZfnWYu4xwMX3vrKoVtbx+-c1L563KDOvw@mail.gmail.com>
 <DEB91A26-9E37-4C94-99DF-72B324C6A23B@gmx.net>
 <878vqaoa2j.fsf@macbook.be.48ers.dk>
Message-ID: <201108301717.43333.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue August 30 2011, Peter Korsgaard wrote:
> >>>>> "Heiko" == Heiko Helmle <helman@gmx.net> writes:
> 
> Hi,
> 
>  Heiko> Just a thought - would it hurt much to start a getty on tty1 by
>  Heiko> default? at least on x86?
> 
> We used to do that, but it has the disadvantage that the console gets
> spewed with lots of errors about getty failing when you don't have a
> tty1 (E.G. for the fairly common case of no framebuffer console support
> in the kernel).
>

Perhaps a conditional message that shows only in the "no framebuffer"
case that clues the user about requiring an arch specific /dev/tty* ?
Or maybe even shows the link to the FAQ entry.

Mike 
> We currently don't do anything architecture specific for the rootfs
> skeleton, and I would prefer to keep it like that for simplicity
> reasons.
> 
