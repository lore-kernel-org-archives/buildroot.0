From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2016 10:21:19 +0100
Subject: [Buildroot] [PATCH v4] linux-headers: allow use of headers from
	kernel "package" selected
In-Reply-To: <20160109172908.GA3444@free.fr> (Yann E. MORIN's message of "Sat, 
 9 Jan 2016 18:29:08 +0100")
References: <1425230275-127768-1-git-send-email-kaszak@gmail.com>
 <20160109172908.GA3444@free.fr>
Message-ID: <87y4bn6y5s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Karoly, All,
 > Reviving this old one that is still pending in Patchwork...

 > On 2015-03-01 18:17 +0100, Karoly Kasza spake thusly:
 >> This change makes it possible to use exactly the same sources for both
 >> headers during toolchain building and for kernel building itself, even
 >> if custom kernel is selected.
 >> 
 >> That way users can be sure that ABI mismatch won't happen between toolchain
 >> and kernel.

 > So, I'll try to summarise what we have for now:

 >   - select kernel headers version and select kernel version (separately)

 >   - select kernel headers version, also used as kernel version.

 > What you want to add with this patch is:

 >   - select kernel version, also used as kernel headers version.

 > In fact, I think that the second case we already have (headers version
 > implies kernel version) is a bit weird. Surely, I would have expected
 > something reversed, like "kernel version implies headers version", which
 > this patch is trying to provide.

I think part of the reason we have it this way is purely historical
(E.G. we had support for building a toolchain a lot earlier than we had
a generic way of building a Linux kernel, and for a long time we would
always build an internal toolchain, but building a kernel is optional),
but also because the kernel headers option comes before the Linux
option, so you would need to go and enable the Linux kernel and then go
back and change the kernel headers option.

The question is also what do about the kernel headers option if you go
and disable building a Linux kernel?

Perhaps we can find good solutions to these questions, but all in all,
I'm not sure it is worth it. What we have today is functionally
equivalent, even though it is perhaps a bit backwards for certain use
cases.

-- 
Bye, Peter Korsgaard
