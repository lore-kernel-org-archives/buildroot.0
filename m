From: Christopher Taylor <chtaylo3@gmail.com>
Date: Tue, 10 Jun 2008 17:36:30 -0400
Subject: [Buildroot] root login password
In-Reply-To: <87zlptuk7e.fsf@macbook.be.48ers.dk>
References: <2590773a0806101254u4444c68dxe04f4dd117fef179@mail.gmail.com>
	<87zlptuk7e.fsf@macbook.be.48ers.dk>
Message-ID: <2590773a0806101436gd56ddc0t4d5e5018f7df2690@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

yep, that was the problem .... no ttygserial in /etc/securetty

I didn't place that is my configuration script but had made the
changes locally in a previous toolchain.

I threw me for a loop because the defect report didn't match what the
problem was and so I was simply looking to deep into it ....

-Chris

On Tue, Jun 10, 2008 at 4:08 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Christopher" == Christopher Taylor <chtaylo3@gmail.com> writes:
>
>  Christopher> On some builds root needs to supply a password for
>  Christopher> logging in over telnet or through g_serial and on some
>  Christopher> builds it doesn't.  No matter what, it can always login
>  Christopher> without the password on the debug serial (ttyS3 for me).
>
> Strange. Is your /etc/{passwd,shadow} files the same? Do you have
> g_serial in /etc/securetty?
>
> --
> Bye, Peter Korsgaard
>
