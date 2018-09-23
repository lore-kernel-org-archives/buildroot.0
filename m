From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 16:40:23 +0200
Subject: [Buildroot] [PATCH 1/1] ncmpc: depends on gcc >= 6
In-Reply-To: <20180923134355.25827-1-fontaine.fabrice@gmail.com>
References: <20180923134355.25827-1-fontaine.fabrice@gmail.com>
Message-ID: <20180923164023.6fb3a4ba@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Sep 2018 15:43:55 +0200, Fabrice Fontaine wrote:
> Following upstream feedback on unique_ptr issue and the suggested fix
> (https://github.com/MusicPlayerDaemon/ncmpc/pull/29), add a dependency
> on gcc >= 6 and remove patch
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

If I'm correct, unique_ptr was supported before gcc 6.x, right ?

So if that's the case, the issue here is not the unavailability of
unique_ptr before gcc 6, but rather a gcc bug that prevents the
automatic cast from Page* to unique_ptr<Page> from happening.

So the proper course of action would be:

 - Report a bug to gcc upstream about this
 - Create a BR2_TOOLCHAIN_GCC_HAS_BUG_xyz
 - Use that in ncmpc

Indeed, there is a big difference between "the feature does not exist
in gcc" and the "feature existed but was buggy".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
