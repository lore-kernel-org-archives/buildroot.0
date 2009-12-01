From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Dec 2009 14:42:00 +0100
Subject: [Buildroot] Where did "project name" go?
In-Reply-To: <op.u384zil4yqa4qb@jap>
References: <op.u383h9jpyqa4qb@jap> <87zl63gkl3.fsf@macbook.be.48ers.dk>
	<op.u384zil4yqa4qb@jap>
Message-ID: <20091201144200.7ef450f0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 1 Dec 2009 10:07:56 +0100,
Joachim Pihl <jpihl@nevion.com> a ?crit :

> That is the part I was referring to. It does make building the same
> system for multiple targets easy (from a user perspective), though,
> and that is now lost. I guess I'm just not the average user.

The solution for this, as mentionned by Peter, is to build out-of-tree
using O=/path/to/output/directory.

Then you can easily switch between several projects without problem.
They share the same Buildroot source code, but they have different
configurations and different output directories.

The old "project" stuff was just duplicating this feature. We had to
make a choice between both, and the choice of O= was the one that
allowed to make simplifications in Buildroot that make it much easier
to use for less advanced users.

Don't hesitate to ask if you have any question or find any limitation
with the O= scheme.

Sincerly,

Thomas.
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
