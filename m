From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Jun 2017 16:15:31 +0200
Subject: [Buildroot] [PATCH 0/4 v2] tools: add a directory to contain
 usefull user-facing tools
In-Reply-To: <cover.1497794488.git.yann.morin.1998@free.fr>
References: <cover.1497794488.git.yann.morin.1998@free.fr>
Message-ID: <20170618161531.762b0929@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Jun 2017 16:01:40 +0200, Yann E. MORIN wrote:

> Currently, we provide a few user-facing utilities, like get-developers,
> in support/scripts/ . But this directory also contains internal scripts
> that a user should not be directly concerned with. Besides, it is
> two-level deep in the hierarchy, which is not really nice.
> 
> So, we introduce tools/ as a top-level directory, with the goal to store
> and expose all user-facing utilities, while keeping our internal scripts
> in support/scripts/ .
> 
> The first patch in the series introduces a new utility, brmake, a
> wrapper around make that stores all the output to a log file and
> displays only the >>> lines.
> 
> The second and subsequent patches each move a few user-facing utilities
> out of support/scripts/ and into tools/ .

I am wondering if there is a very clear cut boundary between
user-facing tools and non-user facing tools.

For example, graph-build-time or graph-depends are internally used by
the Buildroot Makefile, but may also be used directly. The size-stats
tool is also used internally by the Buildroot Makefile, but
size-stats-compare is meant to be used directly.

What about support/scripts/genimage.sh ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
