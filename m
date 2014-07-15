From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 22:35:52 +0200
Subject: [Buildroot] [PATCH] u-boot: Allow to specify a list of patches
In-Reply-To: <20140715201336.GE3351@free.fr>
References: <1405448794-10517-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20140715205341.77237719@free-electrons.com>
 <CAAEAJfB7bjvsdGCOc+5Rzt39ERfvfC=sSYKtKUtGwDLXiBDLdA@mail.gmail.com>
 <20140715201336.GE3351@free.fr>
Message-ID: <20140715223552.04987eb6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 15 Jul 2014 22:13:36 +0200, Yann E. MORIN wrote:

> The more I think about it, the more I find our policy to require
> PKG-prefixed patches to be really cumbersome, since the patches already
> are in a subdir named PKG/

Actually, me too. It prevents the output of "git format-patch" from
being directly used as patches.

> Of course, we're enforcing this naming scheme in BR2_GLOBAL_PATCH_DIR to
> be in sync with what we do for our bundled patches.
> 
> But still, if patches were just named NNNN-title.patch, that would be as
> efficient at sorting the patches. The PKG- prefix is not really
> required, and indeed can cause some troubles with some use-cases, such
> as yours.
> 
> Thomas, was there a specific reason we wanted the patches to be
> PKG-prefixed? If not, would it make sense to just accept patches without
> a PKG-prefix?

I honestly don't remember what was the reasoning behind that. Arnout
maybe?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
