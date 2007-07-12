From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 12 Jul 2007 18:38:55 +0200
Subject: [Buildroot] Install to /lib usr /usr/lib ?
In-Reply-To: <f0528b5b0707120848w682852a7i24137288712a53ae@mail.gmail.com>
References: <f0528b5b0707120848w682852a7i24137288712a53ae@mail.gmail.com>
Message-ID: <1184258335.5175.44.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2007-07-12 klockan 17:48 +0200 skrev Julien Letessier:
> Dear buildroot maintainers,
> 
> For the relative newcomer I am, there seems to be a lot of
> inconsistency in buildroot for package installation directories.
> 
> From what I undrestand, the policy is to install packages:
> * under $(STAGING_DIR)/{bin,lib,include} and $(STAGING_DIR)/{bin,lib}
> for the toolchain (e.g. uclibc)
> * under $(STAGING_DIR)/usr/{bin,lib,include} and
> $(STAGING_DIR)/usr/{bin,lib} for other packages (e.g. gtk)
> 

As I interpret things,
Only host tools should be installed in $(STAGING_DIR)

Target tools gets installed somewhere in $(TARGET_DIR) which
now is defined to be project_build_ARCH/$(PROJECT)/root


> Is this correct?
> 
> If so, we have a problem.
> Half the of the package/*/*.mk use one option, half use the other.
> As I "svn uped" today, the fontconfig package I had a hard time
> patching broke, because expat decided AGAIN to install directly under
> /lib.
> 
> Please, please establish a clear policy on this, so we can start
> submiting patches

I think that /usr/bin/X11 might be the right directory to
use, at least for your X11R7 stuff.

I would check where the package is located on my normal linux host
and select the same install dir for the buildroot target.

Best Regards
Ulf Samuelsson
