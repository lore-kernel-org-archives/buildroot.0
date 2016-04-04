From: =?utf-8?Q?Mateusz_S=C5=82upny?= <mateusz.slupny@vestiacom.com>
Date: Mon, 4 Apr 2016 15:55:44 +0200
Subject: [Buildroot] Project configuration management
Message-ID: <24791852-D548-43A1-8E3D-C39D69F479BB@vestiacom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

We are using buildroot for building a series of projects. What I feel is missing in buildroot is a way to store different configurations in scope of a single project. For example, we would like to prepare three types of builds, let's name them "Release", that is the basic build, "Develop", that is a Release build + dropbear + some other utilities, and "Extra", that contains all configuration options from Develop + some additional tools (gdb, valgrind, etc.). To achieve that, we have to maintain total of (number of projects) x (number of build types) different configuration files that are almost identical.

Can this goal be achieved without using multiple defconfig files that share approx 90% of their contents? What would you advise to avoid that?

First solution that comes to my mind is to allow nesting defconfig files with some include/source statement, but AFAICS that's not supported.

Please note that we are aware of "layered customizations" concept, and we're using it to some degree, but it doesn't solve all the issues, e.g. setting toolchain, selecting packages, and setting multiple paths to layers itself has to be done in defconfig files anyway.

Thanks and best regards,
-- 
Mateusz Slupny, lead developer, Vestiacom
E-mail: mateusz.slupny at vestiacom.com
