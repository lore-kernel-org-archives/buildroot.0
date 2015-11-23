From: rdkehn at yahoo.com <rdkehn@yahoo.com>
Date: Mon, 23 Nov 2015 10:32:09 -0600
Subject: [Buildroot] [PATCH v5 0/2] package/unscd: new package
In-Reply-To: <5653244C.7060903@imgtec.com>
References: <1448287096-18606-1-git-send-email-rdkehn@yahoo.com>
 <5653244C.7060903@imgtec.com>
Message-ID: <20151123153052.GA6644@dkarchlinux64.currentcomm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

On Mon, Nov 23, 2015 at 02:35:56PM +0000, Vicente Olivert Riera wrote:
> Dear Doug Kehn, everyone,
> 
> just a small question. Perhaps I'm wrong, but..., isn't nscd deprecated
> in favor of sssd? If so, shouldn't we add the sssd package instead?

I believe [u]nscd is deprecated for RHEL/CENTOS. I'm not sure about
other distros. My Arch Linux distro installs glibc nscd by default.

I'm by no means an sssd expert; however, from a quick cursory look

http://serverfault.com/questions/534791/what-are-the-dependencies-of-sssd-nscd-to-function

it appears sssd may have dependencies that may not be desirable for
some systems.  This is of course debatable. 

I use unscd in my Buildroot system so I thought I would share what
is working for me since unscd was not an available package. I'm okay
with this patch not being accepted in favor of sssd.

Regards,
...doug

> 
> Regards,
> 
> Vincent.
> 
> On 23/11/15 13:58, Doug Kehn wrote:
> > systemd recipe/support is removed. systemd support is best left to someone
> > versed in systemd who desires to use unscd with systemd.
> > 
> > The BR2_GLIBC_NSCD suggestion is incorporated. However, I'm not sure what the
> > proper next steps are to properly install glibc nscd for both internal/external
> > toolchains. Is it sufficient, for now, to just define BR2_GLIBC_NSCD?
> > 
> > Doug Kehn (2):
> >   package/unscd: new package
> >   toolchain/toolchain-common.in: install nscd
> > 
> >  package/Config.in             |  1 +
> >  package/unscd/Config.in       | 11 ++++++++++
> >  package/unscd/S46unscd        | 24 ++++++++++++++++++++++
> >  package/unscd/unscd.hash      |  3 +++
> >  package/unscd/unscd.mk        | 47 +++++++++++++++++++++++++++++++++++++++++++
> >  toolchain/toolchain-common.in |  4 ++++
> >  6 files changed, 90 insertions(+)
> >  create mode 100644 package/unscd/Config.in
> >  create mode 100644 package/unscd/S46unscd
> >  create mode 100644 package/unscd/unscd.hash
> >  create mode 100644 package/unscd/unscd.mk
> > 
> > --
> > Changes v4 -> v5
> >   - Reincorporate $(APPLY_PATCHES) suggestion after update by Arnout.
> > Changes v3 -> v4
> >   - Incorporate feedback/suggestions by Yann and Maxime.
> > Changes v2 -> v3
> >   - Remove trailing '/' from UNSCD_SITE.
> >   - Whitespace cleanup.
> > Changes v1 -> v2
> >   - Incorporate feedback/suggestions by Yann (from nss-pam-ldapd patch).
> > 
