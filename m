From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 19:28:47 +0100
Subject: [Buildroot] [PATCH 1/7 v3] package/busybox: Add facility for
 DHCP hooks
In-Reply-To: <1402982507.184367.599670173206.1.gpush@pablo>
References: <1402982507.183937.570365596242.0.gpush@pablo>
 <1402982507.184367.599670173206.1.gpush@pablo>
Message-ID: <20150102192847.11e3e771@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Kerr,

On Tue, 17 Jun 2014 13:21:47 +0800, Jeremy Kerr wrote:
> The (u)dhcpc hook installed by the busybox package configures the
> network and exits. If we want to do anything further with a DHCP lease,
> we'd have to replace the script entirely.
> 
> This change introduces a .d directory for hooks (based on the script
> filename), which are executed after the interface configuration. This
> allows packages to drop a script file in the .d directory to perform
> actions on DHCP events.
> 
> We'll use this in a later change to notify petitboot of DHCP boot
> information.
> 
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

Thanks, applied after reworking on top of the latest Buildroot.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
