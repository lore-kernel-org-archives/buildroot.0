From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Aug 2016 00:00:37 +0200
Subject: [Buildroot] [PATCH] package/hidapi: depends on NPTL threads
In-Reply-To: <1470517283-4301-1-git-send-email-romain.naour@gmail.com>
References: <1470517283-4301-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160807000037.66f7eca9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 Aug 2016 23:01:23 +0200, Romain Naour wrote:
> hidapi use NPTL threads functions like pthread_barrier_wait() and
> pthread_barrier_destroy(). So the dependency on threads support
> doesn't come from libusb package but by hidapi itself.
> 
> Fixes:
> [microblaze]
> http://autobuild.buildroot.net/results/f7e/f7e778562aa1a65ba46f3b2f705d13ace8870805
> [m68k]
> http://autobuild.buildroot.net/results/2ec/2ecd240ccb15de76017942a8960faac6b3f973b4
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/hidapi/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
