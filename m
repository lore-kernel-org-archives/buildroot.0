From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 17 Jul 2017 17:34:41 +0000
Subject: [Buildroot] [Bug 10091] gcc7.1 does not build with graphite support
 due to old isl
In-Reply-To: <bug-10091-163@https.bugs.busybox.net/>
References: <bug-10091-163@https.bugs.busybox.net/>
Message-ID: <bug-10091-163-nPr8LcYbQT@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10091

--- Comment #4 from Ivan <ivan.nazarenko@gmail.com> ---
Build of gcc 7.1, with graphite support enabled, failed in the "checking isl >=
0.15" pass.

Disabling graphite allowed gcc build.

See https://gcc.gnu.org/install/prerequisites.html

While 6.x, 5.x and 4.9 still builds with isl 0.14, the gcc webpage specify isl
0.15 as the current minimum.

Verifying the ChangeLog-2016, 2015, etc files shows that in 2014 the dependency
of cloog was removed. This is true for the last gcc5.x, 6.x and 7.x.

But gcc4.x still depends on cloog.

So the options seems to be either:

- keep cloog, with corresponding old isl, and gcc4.x users have graphite, or
- removes cloog, new isl, and gcc7.1 users have graphite.

I am not aware if isl 0.15 would disrupt graphite in 5,x or 6.x. Improbable,
though, since 0.15 is from 2015 and the last gcc5.x from 2016.

I feel myself bit overwhelmed by builroot, and do not think I would be able to
experiment with anything beyond the trivial "make menuconfig". I do not event
know bash. But I would help where I can.





While I am completely bewildered by all this buildroot stuff (I am not even
familiar with bash), I though it would be nice to report failed builds. But do
not feel

-- 
You are receiving this mail because:
You are on the CC list for the bug.
