From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Thu, 24 Feb 2011 13:59:42 +0100
Subject: [Buildroot] Unable to login to buildroot
In-Reply-To: <AANLkTimvTBzuBY5gpdGmcWDVdMAntznMRPTB6stdK=6F@mail.gmail.com>
References: <201102241048.48537.dargaud@lpsc.in2p3.fr>
	<AANLkTimvTBzuBY5gpdGmcWDVdMAntznMRPTB6stdK=6F@mail.gmail.com>
Message-ID: <201102241359.42509.dargaud@lpsc.in2p3.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 24 February 2011 12:30:51 Daniel Nystr?m wrote:
> 2011/2/24 Guillaume Dargaud <dargaud@lpsc.in2p3.fr>:
> > # Put a getty on the serial port
> > ttyUL0::respawn:/sbin/getty -L ttyUL0 115200 vt100 # GENERIC_SERIAL
> 
> Try replace this line with:
> ::respawn:-/bin/sh
> 
> And see if that works?

Boot stops after:
Freeing unused kernel memory: 108k init

I have a feeling the mounts at the begining of inittab don't work... As seen 
from the NFS server, there's nothing in /proc, /tmp. /dev/pts, /sys...

-- 
Guillaume Dargaud
http://www.gdargaud.net/
