From: Dan Christensen <opello@opello.org>
Date: Wed, 25 Nov 2009 02:36:04 -0600
Subject: [Buildroot] [PATCH] Introduce support for using either
	e2fsimage of genext2fs
In-Reply-To: <87y6lyfjx9.fsf@macbook.be.48ers.dk>
References: <6a52edd60910211816g12860f63xc2f70e1ee473a335@mail.gmail.com>
	<6a52edd60911021808w8d65e45t93c83682c133dfbc@mail.gmail.com>
	<87y6lyfjx9.fsf@macbook.be.48ers.dk>
Message-ID: <6a52edd60911250036wa4edd7dj757ef8f816c9de28@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Nov 22, 2009 at 1:17 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
> I would prefer to have a single tool for ext2 instead of having to
> maintain both genext2fs and e2fsimage, but I'm afraid e2fsimage isn't a
> good option. According to it's website it hasn't seen a release since
> 2004, and it isn't in Debian (genext2fs is), and until now we haven't
> had any issues with genext2fs.

That's perfectly understandable, I just wasn't sure how to resolve the
problem and that was the avenue I took.

> The ext2 read issue you're seing in u-boot is because u-boot is
> buggy. A patch has recently been posted which fixes it:
>
> http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/71890
>
> Also see the thread leading up to that patch:
>
> http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/71863/focus=71867
>
> FYI, it was afaik broken last year when revision 1 support was added:
>
> http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/44630/focus=44727
>
> Could you check if a genext2fs-generated image works for you after you
> apply that patch to u-boot?

It did indeed fix the problems I was seeing, thank you very much for
pointing it out to me.  I also replied to the patch saying I'd tested
it.

Thanks again!
Dan
