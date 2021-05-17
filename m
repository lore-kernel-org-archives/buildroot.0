From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Mon, 17 May 2021 13:58:46 +0300
Subject: [Buildroot] BUG: Buildroot build environment is messing up with
 host Python scripts
Message-ID: <YKJMZtZU0kyfknpZ@smile.fi.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

I have a very long time ago established a script that makes adaptive proxy for
Git and SSH. This script is written in Python and has the following shebang:

	#!/usr/bin/env python3

When Buildroot tries to download sources from a Git repository, the above
mentioned script is being called to determine if proxy is needed and what its
configuration. Unfortunately it seems that Buildroot build environment somehow
messed up with host (!) one and necessary modules for that script to work can't
be found. Note, the same script is working nicely with host tools (Git, SSH),
hence there is no issues on the host side.

Changing shebang to be

	#!/usr/bin/python3

works around the problem, but the root cause is somewhere in the Buildroot.
We must not require to change everything user have on the host (!) side to
build the Buildroot. It's kinds show stopper to me. Any suggestion how to fix
this  quite annoying bug?

Buildroot source code tag: 2021.02.1

-- 
With Best Regards,
Andy Shevchenko
