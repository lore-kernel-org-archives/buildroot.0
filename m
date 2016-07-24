From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 21:31:24 +0200
Subject: [Buildroot] [PATCH v9 2/2] docker-engine: new package
In-Reply-To: <CA+h8R2rcOfaox359QdSX64wqzE8-6DK6=37p8z4K+oT=_S3FzA@mail.gmail.com>
References: <1469220779-31430-1-git-send-email-christian@paral.in>
 <1469220779-31430-2-git-send-email-christian@paral.in>
 <20160724152921.0601232e@free-electrons.com>
 <CA+h8R2rcOfaox359QdSX64wqzE8-6DK6=37p8z4K+oT=_S3FzA@mail.gmail.com>
Message-ID: <20160724213124.2ab58872@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 12:13:30 -0700, Christian Stewart wrote:

> Init scripts were written by Andrew so I will let him take those revisions.

In this case, maybe you should just send a patch without any init
script, and let Andrew send a follow-up patch for the init script.

> > None of these lines are needed. All those packages are already selected
> > by docker-containerd.  
> 
> Removed, but I thought we had to propagate the "select" back up to the
> top level dependency. Maybe this is just for "depends."

You have to propagate the "depends on" of the options you are
"select"-ing.

> > If you use CGO, then docker needs to also depend on
> > BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS, see docker-containerd.  
> 
> Added, thanks.
> 
> > What is this CPATH ? Indeed there is usually nothing in
> > TARGET_DIR/usr/include.  
> 
> It's where the btrfs.h headers go, when btrfs is selected, fixes the
> cgo compilation errors when btrfs is enabled.

Seems weird, there are no headers on the target. Is it just used
temporarily during the build?

Headers normally go in STAGING_DIR, not TARGET_DIR.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
