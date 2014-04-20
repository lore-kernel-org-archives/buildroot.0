From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 11:57:41 +0200
Subject: [Buildroot] [PATCH] syslinux: install helper programs to the
 host
In-Reply-To: <1394996670-8037-1-git-send-email-fhunleth@troodon-software.com>
References: <1394996670-8037-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20140420115741.1cb6a1b2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

On Sun, 16 Mar 2014 15:04:30 -0400, Frank Hunleth wrote:
> Even though syslinux is built for the target, it does create helper
> programs intended to be run on the host such as syslinux and extlinux.
> This change installs these helper programs to the host so that they may be
> called by post image creation scripts.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  boot/syslinux/syslinux.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

I've applied your patch, and removed the code that implements the
host-syslinux variant (which BTW was originally added by Arnout in
9baaa5b4a39145f4cc64c6bba1a6aa8cec48f00a).

Frank, syslinux upstream is now at version 6.x. Since you're using
syslinux, could you take care of updating the package in Buildroot to
match the latest upstream version?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
