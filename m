From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Dec 2016 22:47:44 +0100
Subject: [Buildroot] [PATCH 1/1] systemd: don't build systemd-firstboot
 by default
In-Reply-To: <1477502284-6023-1-git-send-email-fhunleth@troodon-software.com>
References: <1477502284-6023-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20161208224744.2968e095@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Oct 2016 13:18:04 -0400, Frank Hunleth wrote:
> systemd-firstboot is never invoked since systemd's first boot detection
> logic checks whether /etc/machine-id exists. Since the file is created
> automatically by systemd.mk, systemd will never detect first boot and
> therefore the systemd-firstboot.service unit file will never get run.
> 
> Additionally, if /etc/machine-id is removed to allow systemd-firstboot
> to run, it interactively prompts for the system locale. This makes it
> seem unlikely that an embedded system would want to use it.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/systemd/Config.in | 1 -
>  1 file changed, 1 deletion(-)

Since none of the people interested in systemd have replied to your
patch, and your commit log looked sensible, I applied it to master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
