From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Nov 2011 20:55:01 +0100
Subject: [Buildroot] [PATCH 5 of 5 v2] python: allow reduced installation
In-Reply-To: <3fb04c960d0e58ea5bb1.1321557994@devws108>
References: <patchbomb.1321557989@devws108>
 <3fb04c960d0e58ea5bb1.1321557994@devws108>
Message-ID: <20111117205501.62cd8518@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 17 Nov 2011 20:42:04 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> A default python installation takes more than 13M of disk space on
> target. The python library takes about 4,5M, and the other 9M is
> occupied by various modules in /usr/lib/python2.7. A usable
> installation doesn't need such a large module directory. A minimal
> configuration with only those modules needed to start an interactive
> session requires only about 450K, plus the python library itself.
> 
> This patch adds an option to reduce the number of installed python
> modules to the bare minimum. Additional modules to install can be
> specified in the config file as a string.

While I agree that the feature is nice, I am not a fan of the
implementation. Currently, we already have a way of enabling/disabling
certain Python modules with one Kconfig option for each module that can
be enabled/disabled. The list of modules that can be enabled/disabled
this way has been built taking into account two factors :

 * We want to be able to configure out modules that have external
   dependencies (on other libraries)

 * We want to be able to configure certain modules that take a huge
   amount of space (I'm thinking of all the japanese/korean handling)
   and may not be useful in most situations

So we already have a way of configuring which modules are
built/installed with one Kconfig option per-module.

Now, you're adding a new option "I want a minimal version of Python"
with an additional option "but I also want those additional modules". I
think that taken together with the existing per-module Kconfig options,
it makes the Python configuration very strange. I am not sure what to
propose exactly (having one Kconfig option for each and every module
would be horrible), but I don't like really much this proposal.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
