From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jun 2011 23:21:48 +0200
Subject: [Buildroot] [RFC] Override source directories
In-Reply-To: <1307601526.2967.58.camel@esp-patben-lin.espdx1.local>
References: <cover.1305755245.git.thomas.petazzoni@free-electrons.com>
	<1307601526.2967.58.camel@esp-patben-lin.espdx1.local>
Message-ID: <20110610232148.5383e3c3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Patryk,

Le Thu, 09 Jun 2011 08:38:46 +0200,
Patryk Benderz <Patryk.Benderz@esp.pl> a ?crit :

> > Feedback, comments and ideas welcome.
> Any chance you could implement <pkg>-remove target, parallel to
> <pkg>-rebuild target? Because this is what I really miss in
> Buildroot. I often find some packages useless, and I have to build
> from scratch to remove them. I suppose others would also appreciate
> "remove package" function.

This is also on the TODO-list, and some experiments have been made to
implement this, but it is a very different work than the one I'm
currently proposing through this patch set. As Buildroot is designed
today, it does not know which package installed which files in
TARGET_DIR and STAGING_DIR, which makes it impossible for Buildroot to
remove a particular package. The package infrastructure needs to be
extended to maintain the list of the files installed by each package
(this is relatively simple). But then, when removing a package, you
need to ensure that all reverse-dependencies of this package are also
removed, or at least recompiled. This is not completely trivial to
implement.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
