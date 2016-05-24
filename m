From: Geoff Levand <geoff@infradead.org>
Date: Tue, 24 May 2016 14:35:40 -0700
Subject: [Buildroot] [PATCH v2 6/6] package/go: Set file timestamp
In-Reply-To: <20160524211354.20788c35@free-electrons.com>
References: <cover.1463696454.git.geoff@infradead.org>
 <ec83a5927025fc759d5bfc26ee01aabde3658a7c.1463696454.git.geoff@infradead.org>
 <20160524211354.20788c35@free-electrons.com>
Message-ID: <1464125740.5014.53.camel@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 2016-05-24 at 21:13 +0200, Thomas Petazzoni wrote:
> On Thu, 19 May 2016 22:25:02 +0000, Geoff Levand wrote:
> > Set all file timestamps to prevent the go compiler from rebuilding any
> > built in packages when programs are built.
>
> That's weird, why is it needed? 

If the times are not set, when a go program is built go may
rebuild some of the installed packages.  This is the same
kind of time based dependecy checking make does.

Without this change I can observe installed packages being
rebuilt when flannel is built on my machine.

> Why are timestamps wrong in the first
> place?

I guess go is built in parallel, and so the artifacts have
different times.  Gentoo does a similar timestamp operation
in the pkg_postinst of its ebuild:

 https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-lang/go/go-9999.ebuild?logsort=cvs&revision=1.30&view=markup

-Geoff
