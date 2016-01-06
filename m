From: rdkehn at yahoo.com <rdkehn@yahoo.com>
Date: Wed, 6 Jan 2016 08:26:29 -0600
Subject: [Buildroot] ifupdown-0.8.2 / dhcp-4.1-ESV-R12 incompatibility
Message-ID: <20160106142628.GA3891@dkarchlinux64.currentcomm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I'm using SYSVINIT and get the following at startup from S40network:

--8<---
Starting network...
Internet Systems Consortium DHCP Client 4.1-ESV-R12
Copyright 2004-2015 Internet Systems Consortium.
All rights reserved.
For info, please visit https://www.isc.org/software/dhcp/
Usage: dhclient [-4|-6] [-SNTP1dvrx] [-nw] [-p <port>]
                [-s server-addr] [-cf config-file] [-lf lease-file]
                [-pf pid-file] [--no-pid] [-e VAR=val]
                [-sf script-file] [interface]

If you did not get this software from ftp.isc.org, please
get the latest from ftp.isc.org and install that before
requesting help.

If you did get this software from ftp.isc.org and have not
yet read the README, please read it before requesting help.
If you intend to request help from the dhcp-bugs at isc.org
mailing list, please read the section on the README about
submitting bug reports and requests for help.

Please do not under any circumstances send requests for
help directly to the authors of this software - please
send them to the appropriate mailing list as described in
the README file.

exiting.
Failed to bring up eth0.
--8<---

Looking into it, ifupdown-0.8.2 calls dhclient with -I and -df
options; these options are not supported by dhclient. The previous
version of ifupdown, 0.7.49, worked with dhcp-4.1-ESV-R12. Has
anyone else noticed this?

It appears that dhcp-4.3.3 supports the -I and -df options used by
ifupdown-0.8.2. Cross-compiling dhcp-4.3.3 will be more complicated
since there is now a bind tar-ball embedded into the dhcp source. Is
anyone else attempting to add dhcp-4.3.3 to Buildroot?

Thanks and Regards,
...doug
