From: Alexander Kriegisch <Alexander@Kriegisch.name>
Date: Fri, 13 Apr 2007 23:16:18 +0200
Subject: [Buildroot] Kconfig - how to implement hierarchical (un-)select
 trees?
In-Reply-To: <461FC6D8.9050803@Kriegisch.name>
References: <461FC6D8.9050803@Kriegisch.name>
Message-ID: <461FF322.9090007@Kriegisch.name>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I wrote earlier tonight:
>   - If package n is unselected, I want everything below it (sub-package,
>     shared libs, kernel modules) unselected, too. this is the most
>     important point.

I think I got this one working now. What disturbed my efforts were
double definitions of config variables in other Config.in includes at
unexpected places. (Did I mention the whole thing was a mess?) Sorry for
asking at all.

>   - Some kernel modules (or shared libs, respectively) in the same
>     hierarchy may be interdependent. I want to auto-(un)select dependent
>     modules. I got part of this working with "select", but unselecting
>     works strangely. I cannot describe it any better. Somebody knowing
>     the kconfig language and its tricks and tweaks may know what I mean.

Still problematic.

>   - It is necessary to auto-(un)select several shared libs if related
>     kernel modules are (un)selected.

Haven't got there yet.

>   - Sub-package n1 from the example above automatically selects a number
>     of kernel modules and shared libs. They don't get unselected cleanly
>     if I define additional interdependencies between elements on the
>     same hierarchy level.

More precisely, they do not get unselected at all, interdependency or
not. I cannot use "requires" (=depends [on]), though, because they might
be needed by other modules as well. Not sure how to resolves this, but
at least now I can unselect all libs or all kernel modules and start
over selecting packages which in turn select modules/libs they need.

>   - Muli-level hierarchies as such seem to be problematic anyway.

Resolved.
