From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 May 2021 20:38:25 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/dhcp: add host-gawk to
 global dependencies and build environment
In-Reply-To: <20210520215224.2749900-1-geomatsi@gmail.com> (Sergey
 Matyukevich's message of "Fri, 21 May 2021 00:52:24 +0300")
References: <20210520215224.2749900-1-geomatsi@gmail.com>
Message-ID: <871r9x47oe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sergey" == Sergey Matyukevich <geomatsi@gmail.com> writes:

 > DHCP package may silently fail to install binaries to the target image.
 > The problem occurs when buildroot output/host and build server provide
 > different flavors of awk. For instance, mawk on build server and gawk
 > in buildroot output/host. In this case isc-dhcp configure script detects
 > gawk in output/host and generates Makefiles specifying gawk without
 > absolute path. During Buildroot installation phase, those Makefiles
 > are used to install dhcp binaries. They attempt to use gawk without
 > absolute path. However build host does not have gawk.

 > To resolve the issue add host-gawk to dependencies and specify absolute
 > path to host-gawk in dhcp configure script using DHCP_CONF_ENV.

 > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
