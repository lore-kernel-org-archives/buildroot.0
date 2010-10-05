From: Martin Banky <Martin.Banky@gmail.com>
Date: Tue, 5 Oct 2010 14:05:54 -0700
Subject: [Buildroot] [PATCH 05/10] microcom: convert to gentargets
In-Reply-To: <878w2cs9oo.fsf@macbook.be.48ers.dk>
References: <1286266963-23413-1-git-send-email-Martin.Banky@gmail.com>
	<1286266963-23413-5-git-send-email-Martin.Banky@gmail.com>
	<20101005112147.2bc80d0e@surf>
	<AANLkTim76qFFMTStNN-D_ompE2Bcw+ZeT0aWgBE3bd=e@mail.gmail.com>
	<878w2cs9oo.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTinZJqbMMdmTRu-EY42FWFjTGkjf8szXqPn3=83c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,
     Yes, I'd be the one to complain ;-) I use it to troubleshoot serial
port communication issues on my embedded system. It's a fast and dirty way
to see if I have communication with the microprocessor. Basically it lets me
know if it's a hardware issue or if it's in my code. But other than that, I
don't have any other use for it. Also, buildroot is one of the few remaining
places to host it. Just my 2c's.

Martin

On Tue, Oct 5, 2010 at 12:48 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Martin" == Martin Banky <Martin.Banky@gmail.com> writes:
>
>  Martin> Thomas,
>
>  Martin>      I guess I should have explained this better. What I meant
>  Martin> about microcom being a flat archive, is that when you extract
>  Martin> it, it does not create a directory for itself. It just sticks
>  Martin> its files, without a directory being created, in the current
>  Martin> directory. $(TAR_STRIP_COMPONENTS)=1 is 'Automatically detect
>  Martin> tar --strip-path/components option', which, equates to either
>  Martin> --strip-path or --strip-components, depending on the version of
>  Martin> tar. Per the man page: --strip-components = 'strip NUMBER
>  Martin> leading components from file names on extraction', which means
>  Martin> that for microcom, which doesn't have a directory structure, it
>  Martin> strips all the file names off, so no files actually get
>  Martin> extracted. This in turn, means that the patch routine does not
>  Martin> work. Hence, the reason for manually patching microcom. If you
>  Martin> have a better solution, I'd appreciate it, if you would show
>  Martin> me, because I couldn't figure one out. I hope this makes more
>  Martin> sense.
>
> Maybe we should just get rid of the microcom package instead? It was
> integrated into busybox a few years ago, which is also why it was marked
> as deprecated.
>
> I'll remove it later this week unless someone complains.
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101005/1f8e186b/attachment-0001.html>
