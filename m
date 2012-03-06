From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Mar 2012 09:29:09 +0100
Subject: [Buildroot] [PATCH 2/2] Add test infrastructure
In-Reply-To: <201203060806.03919.arnout@mind.be>
References: <1330818307-22115-1-git-send-email-arnout@mind.be>
 <1330818307-22115-3-git-send-email-arnout@mind.be>
 <20120305145625.GE21255@game.jcrosoft.org>
 <201203060806.03919.arnout@mind.be>
Message-ID: <20120306092909.18f8c30c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 6 Mar 2012 08:06:03 +0100,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>  Currently, ThomasP and Peter are both independently running tests on
> the buildroot tree.  We would like to have more testing done.  I
> myself have a server available that can do continuous testing.
> However, a single buildbot isn't going to cut it, because it takes
> quite long to build a single configuration.  Therefore, I would like
> to put test infrastructure in the buildroot repository so others can
> easily set up their own buildbot.

I am repeating myself here, but anyway. Buildbot is nice if you always
rebuild the same configuration over and over again, to verify that
there are no regressions.

However, the tests that we do with Peter are *random* configuration
builds. And this doesn't really fit within the Buildbot model: you
can't compare the result of a build (success/failure) to another,
because each build uses a different configuration.

Buildbot works fine if you test the defconfigs that we have, or some
other well-known configurations, but I don't really see how it would
apply to randpackageconfig builds, and this is exactly what Peter and I
are doing.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
