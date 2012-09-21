From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Sep 2012 14:02:08 +0200
Subject: [Buildroot] [PATCH] unionfs: add missing dependency on
 host-pkg-config
In-Reply-To: <1348224356-20104-1-git-send-email-arnout@mind.be>
References: <1348224356-20104-1-git-send-email-arnout@mind.be>
Message-ID: <20120921140208.341710bd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Fri, 21 Sep 2012 12:45:56 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:

> How was this never caught by the autobuilders?  Do they happen to
> build host-pkg-config most of the time?  If so, maybe we should make
> the randpackageconfig select a smaller number of packages to increase
> the chance of finding this kind of issue...

We can configure the probability for each given package to be selected
in randpackageconfig, and my autobuilder script itself make this value
a random value between (IIRC) 2 and 35%. So depending on the build,
each package has between 2% and 35% of chances of being selected. And I
certainly see builds with very few packages selected. So I'm also
surprised it wasn't found until now.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
