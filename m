From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Mar 2014 11:27:32 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CAHXCMMJW3xN7cAOoMLXX6ZGxNNSEga3_osB1g-oE7eKJGb9JqA@mail.gmail.com>
References: <20140303073010.B46B51015B7@stock.ovh.net>
 <20140303090219.65a08cc7@skate>
 <CAHXCMMLUY6+eN6EzqVBk-=o0MO4QZktyRsmTHSFcRhX7B4Jk2Q@mail.gmail.com>
 <20140303110555.1166a171@skate>
 <CAHXCMMJW3xN7cAOoMLXX6ZGxNNSEga3_osB1g-oE7eKJGb9JqA@mail.gmail.com>
Message-ID: <20140303112732.53129c49@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Mon, 3 Mar 2014 11:19:12 +0100, Samuel Martin wrote:

> > Ok, cool. What approach have you chosen?
> 
> I added a variable-knob to the pkg-python infra named
> $(2)_FORCE_HOST_PYTHON (name can be debated later :P) which set the
> proper host python dependency, and call the proper python interpreter
> during build and install steps.
> 
> This variable only affects host packages.
> 
> If the some configure/build/install commands are overloaded in th *.mk
> file, the right python interpreter should be explicitly called.
> If the package define some tool variable (eg.: SCONS), the variable
> should explicitly called the right python interpreter.
> 
> That's roughly the headlines.

Seems like a good approach. I'm a bit worried about Python 3 stuff
which might fall back on using $(HOST_DIR)/usr/bin/python instead of
$(HOST_DIR)/usr/bin/python3, though, but I'm not sure there's much we
can do about it, except getting autobuilder testing, and user testing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
