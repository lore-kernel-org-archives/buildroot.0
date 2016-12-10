From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Dec 2016 14:31:19 +0100
Subject: [Buildroot] [PATCH] usbip: add a new package
In-Reply-To: <1481272671-6491-1-git-send-email-tal.shorer@gmail.com>
References: <1481272671-6491-1-git-send-email-tal.shorer@gmail.com>
Message-ID: <20161210143119.778e63b1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  9 Dec 2016 10:37:51 +0200, Tal Shorer wrote:
> Add usbip tools (usbip, usbipd) from the running linux source
> 
> Signed-off-by: Tal Shorer <tal.shorer@gmail.com>

Thanks for your contribution. However, since usbip tools is provided as
part of the Linux kernel source code, it should be supported by the
package/linux-tools/ package, which already handles similar tools (perf
and others).

However, it is true that the linux-tools infrastructure currently only
handles tools that just need to be built/installed, and not tools that
use autoconf/automake. So most likely, we want to extend
package/linux-tools/linux-tools.mk? Or should we, because usbip is
different, have a separate package?

Cc'ing Yann E. Morin, who did the work on the linux-tools package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
