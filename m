From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Oct 2014 10:36:11 +0200
Subject: [Buildroot] [PATCH v2] set simple network setup via the system
 configuration submenu
In-Reply-To: <1413814486-10716-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1413814486-10716-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <20141021103611.7e43d2b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?my Rosen,

On Mon, 20 Oct 2014 16:14:46 +0200, J?r?my Rosen wrote:
> This patch allows the setup of simple /etc/network/interfaces via the
> configuration menus instead of using an overlay
> 
> * supports manual ipv4 configuration
> * supports dhcp configuration
> 
> Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
> 
> ---
> 
> This patch is here to avoid having to do an overlay for the most common
> cases (ipv4 with fixed IP or DHCP)
> 
> It can be made more complex (second network if, support ipv6) depending on
> what people want/need, but I want to keep it simple. The point is to avoid
> having to tweak overlays to change stuff that everybody needs to change for
> prototyping
> 
> When networkd is enabled, this option will be deactivated. Networkd support
> is tricky to get right on first approximation. It can be added later if it
> is deemed usefull

I certainly don't like to push back stuff, but I'm wondering if this
isn't too much complexity compared to just having people use an overlay
containing their own /etc/network/interfaces. We will never be able to
handle all the possible cases, with multiple network interfaces, hook
scripts called before/after bringing up/down interfaces, etc.

What is the opinion of other Buildroot developers?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
