From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 08:13:33 +0100
Subject: [Buildroot] [PATCH 1/2] package/openssl: Enable parallel build
In-Reply-To: <20150308023136.GS12857@vapier>
References: <1416146446-27060-1-git-send-email-bernd.kuhls@t-online.de>
 <20141118225525.6e8b4e02@free-electrons.com>
 <20150308023136.GS12857@vapier>
Message-ID: <20150308081333.2396758d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mike Frysinger,

On Sat, 7 Mar 2015 21:31:36 -0500, Mike Frysinger wrote:

> i've tried before and only got some of it in.  i could try again since upstream 
> openssl has changed a bit.

Would be good.

> > I discussed this with Yann, and I believe Peter will agree that it's a
> > feature patch that we shouldn't take in Buildroot. The solutions are
> > either to take this patch upstream, or in Buildroot build in parallel
> > and then fallback to serial build if the parallel build has failed.
> > Something along the lines of:
> > 
> > 	$(MAKE) -C $(@D) || $(MAKE1) -C $(@D)
> 
> unfortunately, that is not safe.  it might end up with incomplete static 
> archives.  at least, that was some of the errors we saw in the past that 
> made me investigate making openssl parallel safe.

Ah, ok. So I guess so far our only luck is to get something done by the
upstream OpenSSL folks. Can you let us know the outcome of this effort?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
