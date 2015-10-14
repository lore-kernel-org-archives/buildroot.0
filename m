From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 11:38:45 +0200
Subject: [Buildroot] [PATCH v2 1/8] package/dhcp: fix SysV init scripts
 option passing
In-Reply-To: <561E1DAC.6000605@wsystem.com>
References: <1444728929-46246-1-git-send-email-benoit@wsystem.com>
 <CAGduivzbpaMUfyJYWtSXnZ1SH494jVVLv7nYx3T8f62gsh6Spg@mail.gmail.com>
 <561E1DAC.6000605@wsystem.com>
Message-ID: <20151014113845.3dbf6c61@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Beno?t,

On Wed, 14 Oct 2015 11:17:32 +0200, Beno?t Th?baudeau wrote:

> I don't have any experience with systemd. I see the basics from the online
> documentation.
> 
> In order to switch an existing SysV + BusyBox defconfig to systemd, is there
> anything else to tweak than setting the init system to systemd in the
> configuration?
> 
> Looking at the files, most of this series seems to already be fine with systemd.
> The SysV init scripts have not been kept consistent when systemd was added. But
> there are a few things to do for systemd though.
> 
> For 1/8, would it be OK to change "EnvironmentFile=/etc/default/dhcpd.conf" to
> "EnvironmentFile=/etc/default/dhcpd" for systemd in order to share the filename
> with SysV? If I look into the /etc/default/ folder on my Ubuntu 15.04 (which
> uses systemd), none of the files present has a .conf extension. The purpose of
> these files is to set some environment variables, so they're more scripts than
> configuration files.
> 
> When a change would affect both SysV and systemd, should there be a single patch
> common to both, or one patch per init system?

Separate patches. And note that despite Maxime's question on systemd,
you are definitely not forced to add systemd support to the dhcp
package. It is fine if you do only SysV support, and someone else
interested in systemd does the systemd part.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
