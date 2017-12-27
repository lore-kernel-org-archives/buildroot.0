From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Dec 2017 23:20:25 +0100
Subject: [Buildroot] [PATCH] configs: introduce a minimalist defconfig
In-Reply-To: <20171224161123.5397-1-yann.morin.1998@free.fr>
References: <20171224161123.5397-1-yann.morin.1998@free.fr>
Message-ID: <20171227232025.29354b46@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Dec 2017 17:11:23 +0100, Yann E. MORIN wrote:
> It is very often interesting to start from a minimalist configuration
> with no package and no filesystem.
> 
> Re-use the existing minimalist configuration and promote it to a full
> defconfig.
> 
> This thus contains options that default to 'y', like the paranoid
> wrapper and busybox-show-others, as the defconfig is used by test-pkg
> too.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>

I'm not too sure of the value of this. Our defconfigs are meant to
allow generating a working Linux system for a specific HW platform.
This minimalist_defconfig would heavily deviate from this principle,
and could confuse newcomers who want to build a "minimal" system.

I'd say this minimalist configuration is more of an internal thing, for
advanced Buildroot developers, and we should keep it "hidden" where it
is today.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
