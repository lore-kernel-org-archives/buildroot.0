From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 22:47:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/scons: remove python from SCONS
In-Reply-To: <20190331121810.28608-1-fontaine.fabrice@gmail.com>
References: <20190331121810.28608-1-fontaine.fabrice@gmail.com>
Message-ID: <20190401224716.50287285@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 31 Mar 2019 14:18:10 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Remove $(HOST_DIR)/bin/python from SCONS variable to allow each scons
> package to select their python interpreter. Indeed, most of the scons
> packages (alljoyn, benejson, gpsd) only supports python2
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b45f9fb69615b80758adeff4571e170c3bd9356b
>  - http://autobuild.buildroot.org/results/13144a7ebd64ef7889312053f06a14047eea232d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/alljoyn-base/alljoyn-base.mk         |  4 ++--
>  package/alljoyn-tcl-base/alljoyn-tcl-base.mk |  4 ++--
>  package/alljoyn-tcl/alljoyn-tcl.mk           |  4 ++--
>  package/alljoyn/alljoyn.mk                   |  4 ++--
>  package/benejson/benejson.mk                 |  4 ++--
>  package/gpsd/gpsd.mk                         | 10 +++++-----
>  package/mongodb/mongodb.mk                   |  4 ++--
>  package/scons/scons.mk                       |  2 +-
>  8 files changed, 18 insertions(+), 18 deletions(-)

I don't know if it is the best/right solution, but it does the job for
now, so let's use this for the moment. We can always revisit the SCons
integration later if needed.

Applied to mater, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
