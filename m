From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Sep 2020 14:58:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/dhcp: specify host-gawk path
 for dhcp build environment
In-Reply-To: <20200623073918.3415-1-geomatsi@gmail.com>
References: <20200623073918.3415-1-geomatsi@gmail.com>
Message-ID: <20200912145843.05493b9c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sergey,

On Tue, 23 Jun 2020 10:39:18 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> DHCP package silently fails to install its binaries if gawk tool
> is not installed on build server. This is still the case even
> if host-gawk package is already available: dhcp Makefiles detect
> its presence but still attempt to use gawk from host system.
> 
> Add host-gawk to the list of dependencies for dhcp and explicitely
> specify host-gawk location.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Thanks for the patch. However, could you be more specific about what's
missing on the target?

Indeed, I just did two builds of the DHCP package, will all sub-options
enabled, one inside a Docker container that only has the "mawk"
implementation of awk, and another on my machine, which as "gawk"
installed as awk.

And in both cases, the set of files installed to target/ was exactly
identical.

Could you provide more details ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
