From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Mar 2012 20:40:03 +0100
Subject: [Buildroot] [pull request] Pull request for branch
 for-2012.05/ccache-fixes
In-Reply-To: <cover.1331148403.git.thomas.petazzoni@free-electrons.com>
References: <cover.1331148403.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20120307204003.3a02b08b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed,  7 Mar 2012 20:26:48 +0100,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

>       ccache: set COMPILERCHECK to 'none'

Some numbers about this.

Without the patch, a build of Qt with an empty cache takes the
following time:

real    8m17.607s
user    31m30.830s
sys     1m8.990s

Without the patch, a build of Qt with a cache full takes the following
time:

real    8m12.630s
user    31m17.340s
sys     1m8.520s

So basically, no improvement.

With the patch, a build of Qt with a cache full takes the following
time:

real    4m37.559s
user    5m13.390s
sys     0m31.840s

Here, there is clearly a nice impact of ccache.

I have decided to take a simpler approach than the one explored by
Arnout. Arnout approach was, IMO, too complicated, and only applicable
to external toolchains.

My approach is simpler, but indeed requires attention from the
developer on whether the cache should be invalidated or not. However, I
am not sure it is possible to provide a solution that is both safe (in
terms of cache contents validity) *and* efficient (in terms of cache
usage). Also, the approach taken by my patch is basically the same as
what was happening with previous versions of ccache, so this is not a
new behaviour.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
