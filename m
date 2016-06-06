From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Jun 2016 23:34:53 +0200
Subject: [Buildroot] [PATCH] Binutils: ARC: Fix build failures if
	makeinfo is missing
In-Reply-To: <20160606215833.57396ae8@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 6 Jun 2016 21:58:33 +0200")
References: <1465211659-23861-1-git-send-email-vzakhar@synopsys.com>
 <87twh6hzxl.fsf@dell.be.48ers.dk>
 <20160606215833.57396ae8@free-electrons.com>
Message-ID: <87fusqgfwi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Mon, 06 Jun 2016 21:36:54 +0200, Peter Korsgaard wrote:

 >> > Signed-off-by: Zakharov Vlad <vzakhar@synopsys.com>  
 >> 
 >> Committed, thanks.

 > Why?

It was fixing autobuilder issues and seemed like a sensible fix that
could be upstreamed. Looking again, I do see that it patched Makefile.in
and not Makefile.am, so that's not too nice though.

 > This problem also exists for other versions of binutils, and also for
 > gdb. And we have a patch series from Romain Naour sitting in patchwork
 > for several weeks.

 > I don't know if Zlad's version is better or not than Romain's version.
 > But at least Romain's version was handling all binutils and gdb
 > versions, without patching directly Makefile.in files. So at first
 > sight, it looked a lot better than Zlad's version.

Ok, we can always revert if it isn't needed any more once Romain's
series is applied.

-- 
Venlig hilsen,
Peter Korsgaard 
