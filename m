From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Apr 2016 18:16:44 +0200
Subject: [Buildroot] [PATCH 0/3 v2] xorg: fix installation paths (branch
 yem/xorg)
In-Reply-To: <20160421220137.4a88ed00@free-electrons.com>
References: <cover.1457719643.git.yann.morin.1998@free.fr>
 <20160421220137.4a88ed00@free-electrons.com>
Message-ID: <20160424161644.GB2583@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-04-21 22:01 +0200, Thomas Petazzoni spake thusly:
> On Fri, 11 Mar 2016 19:10:58 +0100, Yann E. MORIN wrote:
> > This series is an attempt to fix the installation paths of many
> > Xorg-related packages.
> > 
> > The new pkconf bumped in d7f6d320 introduced a change in behaviour: all
> > path variables returned by pkgconf are now prefixed with the sysroot
> > directory.
> > 
> > This has an impact on a lot of Xorg packages (and maybe others as well),
> > since they use such paths verbatim to install files in either of:
> >     $(STAGING_DIR)/$(SYSROOT_DIR)/some/path
> >     $(TARGET_DIR)/$(SYSROOT_DIR)/some/path
> 
> One important thing that this cover letter doesn't explain is why we
> don't fix pkg-config instead?

(trying to reconnect the dots...)

Right. But in turns out that pkg-config has been fixed, yet there still
are errors, because the Xorg packages define an "sdk_dir" (or so)
variable, and use that to prefix a lot of directories, of which the
runtime directories.

So, it's not about a pkg-config issue, but mainly because all of the
Xorg packages are bran-damaged and try (and fail) to circumvent
pkg-config functionality by setting variables that are not common
pkg-config variables.

I did not correctly update the cover letter from the previous iteration,
sorry... I can rewrite it and respin the series, but the patches will
not change.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
