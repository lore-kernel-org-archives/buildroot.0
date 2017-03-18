From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 15:56:50 +0100
Subject: [Buildroot] [PATCH] systemd: bump version to 233
In-Reply-To: <20170313132753.7178-1-Vincent.Riera@imgtec.com>
References: <20170313132753.7178-1-Vincent.Riera@imgtec.com>
Message-ID: <20170318155650.608756a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Mar 2017 13:27:53 +0000, Vicente Olivert Riera wrote:

> -config BR2_PACKAGE_SYSTEMD_KDBUS
> -	bool "enable kdbus support"
> -	help
> -	  Enable kdbus support for Systemd.

This removes a Config.in option, so there is a question:

 * If kdbus support is now unconditionally compiled into systemd, then
   I believe we don't need a Config.in.legacy option, because people
   who had it enabled would still have kdbus support.

 * If kdbus support has been dropped entirely from systemd, then
   perhaps a Config.in.legacy entry should be added to warn users.

CC'ing Arnout on this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
