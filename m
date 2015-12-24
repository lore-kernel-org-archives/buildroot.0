From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 14:59:24 +0100
Subject: [Buildroot] [PATCH v3 01/13] package/dhcp: fix SysV init
 scripts option passing
In-Reply-To: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
References: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
Message-ID: <20151224145924.62fe990b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Sun, 25 Oct 2015 02:59:27 +0200, Beno?t Th?baudeau wrote:
> From: Beno?t Th?baudeau <benoit@wsystem.com>
> 
> The SysV init scripts have configuration variables like INTERFACES whose
> contents have to be passed to the daemon. These variables are
> initialized as empty strings, but some of them are not allowed to be
> empty and there was no means of filling them apart from creating a root
> FS overlay to overwrite these scripts.
> 
> This commit adds support for files under /etc/default/ to set these
> configuration variables. Such light files can now be added to the root
> FS skeleton or overlays without having to duplicate most of the SysV
> init scripts.
> 
> Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
> 
> ---
> Changes v2 -> v3: none.

I've applied, after adjusting the commit title and explanation, since
the change is now only needed for S80dhcp-relay, as S80dhcp-server had
already been modified to read /etc/default/dhcpd by a previous commit.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
