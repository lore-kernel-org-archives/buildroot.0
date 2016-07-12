From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Jul 2016 16:28:39 +0200
Subject: [Buildroot] [PATCH] core: do not remove dl/ directory on
 distclean
In-Reply-To: <1468187749-3955-1-git-send-email-yann.morin.1998@free.fr>
References: <1468187749-3955-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160712162839.1a34656c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Jul 2016 23:55:49 +0200, Yann E. MORIN wrote:
> Currently, if the dl/ directory is the default location, it is removed
> on distclean.
> 
> However, the dl/ directory is a precious location: it contains all the
> tarballs downloaded so far, and some can be relatively huge, taking some
> previous time to re-download, especially on slowish links.
> 
> Don't remove it on distclean. If the user really needs to regain some
> space, leave it to him to clean this directory up manually.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Like Baruch and Peter, I don't really see the need to change this
behavior. Buildroot has beeing removing the default dl/ location during
distclean for many years, without anybody complaining. It matches the
GNU definition of "distclean" and changing this would break existing
behavior with no good benefit.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
