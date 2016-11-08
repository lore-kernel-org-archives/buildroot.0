From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Nov 2016 09:45:39 +0100
Subject: [Buildroot] Autobuilder issue
Message-ID: <20161108094539.6f9b4534@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

Since yesterday, your autobuilder is behaving strangely, reporting lots
of "core-dependencies" error due to javac being missing:

  http://autobuild.buildroot.net/?reason=core-dependencies

javac is *NOT* a mandatory dependency in the autobuilder slaves.
Indeed, the autobuild-run script detects if javac is available or not,
and if it's not available, it rejects configurations that have
BR2_NEEDS_HOST_JAVAC=y:

    if "BR2_NEEDS_HOST_JAVAC=y\n" in configlines and not sysinfo.has("javac"):
        return False

So the problem your autobuilder instance is reporting should not occur,
i.e it should not be possible to start the build of a configuration
that has BR2_NEEDS_HOST_JAVAC=y if javac is not installed. My
autobuilder instance does *not* have javac installed, and does not
report those core-dependencies failures.

Did you change anything in your autobuilder instance recently?
Installed/removed some packages? Modified the autobuild-run script?

Could you have a look at what's going on?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
