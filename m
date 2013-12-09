From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Dec 2013 18:57:31 +0100
Subject: [Buildroot] [PATCH] sawman: Link using gcc instead of ld
In-Reply-To: <52A5F475.6030303@imgtec.com>
References: <1386347428-4142-1-git-send-email-Vincent.Riera@imgtec.com>
 <20131206190836.637fc9f7@skate> <52A5ADCD.5050307@imgtec.com>
 <52A5B06E.60204@imgtec.com> <52A5F475.6030303@imgtec.com>
Message-ID: <20131209185731.6ba10101@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Mon, 9 Dec 2013 16:48:53 +0000, Markos Chandras wrote:

> > Adding:
> >
> > LD = $(CC) -nostdlib
> >
> > to Makefile.am and also:
> >
> > SAWMAN_AUTORECONF = YES
> >
> > to sawman.mk fixes the problem.
> >
> > What do you think about this solution?
> 
> Yes this is preferred. You should patch configure.ac or Makefile.am (if 
> they are available) and run autoreconf as suggested.

I definitely agree that patching the Makefile.am and using
<pkg>_AUTORECONF is the preferred way.

However, I find it weird that we need to add LD = $(CC) -nostdlib in
the Makefile.am. There are plenty of other autotools-based packages
that generate libraries, including private libraries, and they work
just fine. Isn't there a better fix that can hopefully be upstreamed?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
