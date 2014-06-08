From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 10:19:53 +0200
Subject: [Buildroot] [RFCv1 2/4] pkg-generic: add step_pkg_size global
 instrumentation hook
In-Reply-To: <20140608025629.GB4074@tarshish>
References: <1402177567-8021-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1402177567-8021-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140608025629.GB4074@tarshish>
Message-ID: <20140608101953.3531fda7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 8 Jun 2014 05:56:29 +0300, Baruch Siach wrote:

> On Sat, Jun 07, 2014 at 11:46:05PM +0200, Thomas Petazzoni wrote:
> > This patch adds a global instrumentation hook that collects the list
> > of files installed in $(TARGET_DIR) by each package, and stores this
> > list into a file called $(BUILD_DIR)/<pkgname>.filelist. It can later
> > be used to determine the size contribution of each package to the
> > target root filesystem.
> 
> How does this play with parallel build? Is install-target guaranteed to run 
> sequentially for each package?

It obviously clearly doesn't work with top-level parallel build. The
mechanism assumes that between the beginning of an install-target step
and its end, nothing else runs and installs stuff in $(TARGET_DIR).
Which is true for sequential builds, but false for top-level parallel
builds.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
