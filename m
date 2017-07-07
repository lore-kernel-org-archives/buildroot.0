From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Jul 2017 13:52:18 +0200
Subject: [Buildroot] [PATCH 1/7] linux-pam: introduce
 BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
In-Reply-To: <2133150840.3993463.1499425886009.JavaMail.zimbra@datacom.ind.br>
References: <20170707022242.20128-1-casantos@datacom.ind.br>
 <20170707022242.20128-2-casantos@datacom.ind.br>
 <20170707033626.ma6y3kcn7o6vadp6@tarshish>
 <20170707095035.0e268fe2@windsurf.lan>
 <2133150840.3993463.1499425886009.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20170707135218.402f53ca@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 7 Jul 2017 08:11:26 -0300 (BRT), Carlos Santos wrote:

> >> These are feature dependencies, not arch dependencies, so the config name is
> >> misleading. But regardless of that, we want to see this list in all dependent
> >> packages, IMO. This allows us to (more) easily see and grep for direct and
> >> indirect dependencies. It also makes dependencies comments easier to maintain
> >> as you noted.  
> 
> How would repeating the list in all dependent packages make dependencies
> comments *easier* to maintain? I didn't meant to say that.

It makes maintaining the comments easier to maintain, because they are
always next to the list of dependencies, in the same Config.in file.

With your patches, to know what the Config.in comment in
package/nodm/Config.in should be, you need to recursively look into
package/linux-pam/Config.in to find what
BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS actually means.

> > Correct: the <foo>_ARCH_SUPPORTS hidden options should really only be
> > used for architecture dependencies. So in the list above, that would be
> > just BR2_USE_MMU. All the other dependencies are *not* architecture
> > dependencies, and we want to repeat them explicitly, because each
> > package anyway needs to have a Config.in comment that tells the user
> > about such toolchain dependencies.  
> 
> What could be used instead of <foo>_ARCH_SUPPORTS in cases like this?

I don't think we want to change how things are done today. Since we
anyway wants to have this Config.in comment that details what the
dependencies are, I believe keeping the full list of dependencies is
the most reasonable solution.

Yes, it's not perfect, but we simply work within the limitations of
kconfig.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
