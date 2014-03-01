From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 14:54:42 +0100
Subject: [Buildroot] [PATCH] vlc: avoid that AUTORECONF renames
 configure's arguments
In-Reply-To: <1393529854-27070-1-git-send-email-arnout@mind.be>
References: <1393529854-27070-1-git-send-email-arnout@mind.be>
Message-ID: <20140301145442.7e99ba17@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Thu, 27 Feb 2014 20:37:34 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> VLC defines two autoconf functions which are also defined by our own
> pkg.m4 from pkgconf. Unfortunately, they are defined in a different way:
> VLC adds --enable- options, but pkg.m4 adds --with- options. To make
> sure we use VLC's definition, rename these two functions from
> PKG_WITH_MODULES to VLC_PKG_WITH_MODULES and from PKG_HAVE_WITH_MODULES
> to VLC_PKG_HAVE_WITH_MODULES.
> 
> Note that the second function (PKG_HAVE_WITH_MODULES) is in fact
> defined in exactly the same way by VLC and pkgconf, but this might no
> longer be the case when either pkgconf or VLC is updated. Therefore,
> that one is renamed as well.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> I propose to apply this to next but not to master - Simon's patch 02004773
> has been applied to master and fixes it as well. However, that means that
> 02004773 has to be reverted when next is merged into master.

Thanks, patch applied, after reverting 02004773. Please let me know if
the revert was correct, as there was a minor conflict with some udev
related changes.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
