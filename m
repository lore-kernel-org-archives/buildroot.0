From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Mar 2018 11:53:43 +0100
Subject: [Buildroot] [PATCH 1/2] efibootmgr: explicitly depend on
 host-pkgconf and popt
In-Reply-To: <20180323095741.16512-1-peter@korsgaard.com>
References: <20180323095741.16512-1-peter@korsgaard.com>
Message-ID: <20180323115343.45a24828@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Mar 2018 10:57:40 +0100, Peter Korsgaard wrote:
> The efibootmgr build system uses host-pkgconf and popt, so explicitly add
> them to _DEPENDENCIES instead of relying on them getting pulled in by
> efivar.

Minor nit: if it's the efibootmgr *build system* that uses popt, then
one would expect to see a dependency on host-popt, not popt. I guess
it's not the *build system* that depends on popt, but efibootmgr
itself, no ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
