From: Tim Barr <tbarr@multitech.com>
Date: Wed, 26 Mar 2008 11:09:39 -0500
Subject: [Buildroot] build problems
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E60AD7C963@mtsexchange.dc.multitech.prv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FYI, when I modified the buildroot config to generate a uImage file, it
could not find the file so it could copy it into the binaries directory.
Looking at the log file, builroot was looking for the uImage file in the
"kernel" root directory instead of the "kernel"/arch/arm/boot directory.
At least I know where to find the uImage file so I can test it.

cp -dpf
/home/falingtrea/buildroot/project_build_arm/SuperModem-2.6.22.1/linux-2
.6.22.1/uImage
/home/falingtrea/buildroot/binaries/SuperModem-2.6.22.1/at91sam9260dfc-l
inux-2.6.22.1-20080326

Should be:

cp -dpf
/home/falingtrea/buildroot/project_build_arm/SuperModem-2.6.22.1/linux-2
.6.22.1/arch/arm/boot/uImage
/home/falingtrea/buildroot/binaries/SuperModem-2.6.22.1/at91sam9260dfc-l
inux-2.6.22.1-20080326


Timothy Barr
Hardware Development Engineer
for Multi-Tech Systems, Inc.
tbarr at multitech.com
