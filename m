From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Mon, 1 Dec 2008 14:25:58 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
In-Reply-To: <20081201141958.5eb0cfe9@surf>
References: <20081201130602.AB0FD3C78E@busybox.net>
	<20081201140854.287670ff@surf> <20081201141201.507161b7@hcegtvedt>
	<20081201141958.5eb0cfe9@surf>
Message-ID: <20081201142558.7b214b59@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 1 Dec 2008 14:19:58 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Le Mon, 1 Dec 2008 14:12:01 +0100,
> Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> a ?crit :
> 
> > Okay, then we'll enable them only if we have an external toolchain.
> 
> Yes, probably. But then, if you encountered some breakage with them
> and an internal toolchain, maybe the same breakage occurs with an
> external toolchain ?
> 

They probably will if the external toolchain is for cross compiling.
What architecture was your external toolchain for? Was it configured
very similar to the host toolchain?

> (I tested my patch by building Qtopia with an external toolchain, and
> it worked. But maybe I didn't build exactly the same thing as you
> did).
> 

The problem I triggered was that stdio.h in uClibc is not equal to
stdio.h in glibc on my build machine, so the host compiler got utterly
confused.

I think I'll leave it until we have some proper data on who uses what
kinds of toolchains. Could it be that your external toolchain just
needs a massage?

-- 
Best regards,
Hans-Christian Egtvedt
