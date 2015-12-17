From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 09:30:05 +0100
Subject: [Buildroot] [PATCH 1/4] libcairomm: new package
In-Reply-To: <CALe+oY_R1++xZWeZbv9E1LuWoUi76DxEOOeE2zPgs151krSS0w@mail.gmail.com>
References: <1449178605-8568-1-git-send-email-james.knight@rockwellcollins.com>
 <20151216224558.0855b564@free-electrons.com>
 <CALe+oY_R1++xZWeZbv9E1LuWoUi76DxEOOeE2zPgs151krSS0w@mail.gmail.com>
Message-ID: <20151217093005.01a726e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James,

On Wed, 16 Dec 2015 20:36:26 -0500, James Knight wrote:

> > I was a bit surprised by the missing dependency on libsigc.
> 
> My apologies. I am surprised I messed that as well. No excuse; I'll have to
> rework how I check things but I submit stuff upstream.

No problem. It's anyway the sort of things that the autobuilders would
have caught. If I didn't had to rename the packages, I probably
wouldn't have even build tested them, leaving that work for the
autobuilders.

> >      - rename package from libcairomm to cairomm in order to match
> >        upstream name.
> 
> Was this changed to match existing Buildroot's packages naming style or
> something else? I was trying to make sure I selected the right name for
> these packages; a bit frustrated that I messed up on this as well. I guess
> I started with trying to match gtkmm's package to gtk's packages seen in
> Buildroot (ie GTK 2 is libgtk2 and not gtk2), then followed suit with the
> package dependencies I was adding. I guess my main question is why the GTK
> packages are named libgtk2/libgtk3 over gtk2/gtk3?

In general, we try to use the upstream name, which in this case was
cairomm, atkmm, etc. Also another reason was that the cairo package was
named cairo, not libcairo, not it was strange to have "cairo" and
"libcairomm", it made more sense to have "cairo" and "cairomm".

Regarding gtk, yes we deviated from this rule. This has its origin many
many years ago. Back in the time, the gtk (version 1) package was named
libgtk, so we followed that for libgtk2 and then libgtk3.

Yes, it is not super consistent, but renaming all that stuff would be
quite a lot of churn for no real benefit.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
