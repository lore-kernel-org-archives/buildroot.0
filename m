From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Oct 2012 10:46:01 +0200
Subject: [Buildroot] [PATCH 00/13] Add support for a project directory
In-Reply-To: <20121014103518.4fb1089d@skate>
References: <20121013231344.17317.92930.stgit@localhost>
 <20121014103518.4fb1089d@skate>
Message-ID: <20121014104601.568a3d10@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 14 Oct 2012 10:35:18 +0200, Thomas Petazzoni wrote:

> So I'll have a look, but my initial impression is one of fairly high
> skepticism, to say the least.

Ok, I had a look, and I'm going to NAK this.

All what this stuff is adding can already be done with the current
Buildroot, by putting the configuration files in a board/something/foo
directory, and adjusting the Buildroot configuration. It just adds a
useless layer with a fuzzy concept of "project" that we had in the
past, and was a terrible idea.

Moreover, the introduction text states that "Many buildroot users
prefer to keep their project's customizations separate from buildroot
itself", but the patch set doesn't solve this problem at all:

 * Custom packages are not taken into account

 * Additional patches added to existing packages are not taken into
   account

 * Modification to the recipes of existing packages are not taken into
   account. And it is very common for a project that you need to
   slightly upgrade or adjust the recipe of a few existing packages.

So even with this additional complexity, the most annoying problems are
not solved. So I really do prefer to keep things as it is: people have
to use version control systems to keep their changes cleanly separated
from the base Buildroot version. A half-working solution is not going
to help our users to understand how to properly use Buildroot.

If we want to really separate the project specificities, then we need
to introduce a real concept of "layers" like OpenEmbedded has, which
allows to also override package recipes, add new custom packages, etc.
But I am not sure we want to go down this road.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
