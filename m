From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Apr 2019 22:51:22 +0200
Subject: [Buildroot] [PATCH] package/dbus-python: fix build failure due
 to wrong auto-detected extra libs
In-Reply-To: <20190404185228.112789-1-giulio.benetti@micronovasrl.com>
References: <20190404185228.112789-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190404225122.04f97af3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  4 Apr 2019 20:52:28 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> Using Python 3, during configuration, if PYTHON_EXTRA_LIBS is not
> defined, ./configure will launch a python script to retrieve LIBS and
> SYSLIBS variables, but this is done using host-python resulting in
> obtaining libraries that are not present in target. So while trying to
> link configuration test it fails complaining it can't find a
> library(i.e. libintl).
> 
> Set PYTHON_EXTRA_LIBS the same as PYTHON_LIBS to be sure host libs are
> not used at all.
> 
> Fixes:
> http://autobuild.buildroot.net/results/4078ee9e8aa304f044dc92e9345c28341349d468/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

So it started failing with the introduction of gettext-tiny ? Do we
understand why it makes a difference for dbus-python ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
