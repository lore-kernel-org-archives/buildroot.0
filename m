From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 13:09:49 +0100
Subject: [Buildroot] [PATCH] lua-periphery: disable for MIPS
 architectures
In-Reply-To: <1426592859-46907-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1426592859-46907-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150317130949.56e4d0c3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 17 Mar 2015 11:47:39 +0000, Vicente Olivert Riera wrote:
> c_ispeed and c_ospeed are not available for MIPS:
> 
> src/serial.c:191:25: error: 'struct termios' has no member named 'c_ispeed'
>          termios_settings.c_ispeed = baudrate;
> 
> src/serial.c:192:25: error: 'struct termios' has no member named 'c_ospeed'
>          termios_settings.c_ospeed = baudrate;
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/ca7146661c8135568be90dd53b6ee569ebff270d/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

I think disabling on MIPS is not the right fix. The right fix is to use
the C library cfsetispeed() and cfsetospeed() instead of directly
accessing the termios structure members, which are not guaranteed to
exist.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
