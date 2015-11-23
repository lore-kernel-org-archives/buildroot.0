From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 14:05:28 +0100
Subject: [Buildroot] [v3 0/2] openssl: parallel build
In-Reply-To: <20151118135709.125f4afd@free-electrons.com>
References: <1442405185-4103-1-git-send-email-ryanbarnett3@gmail.com>
 <20151118135709.125f4afd@free-electrons.com>
Message-ID: <20151123130528.GA3857@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-11-18 13:57 +0100, Thomas Petazzoni spake thusly:
> On Wed, 16 Sep 2015 07:06:23 -0500, Ryan Barnett wrote:
> > I have adopted Thomas P's patches that we submitted but in May in order
> > enable parallel build of openssl. I have updated the patches to use the
> > latest patches available from gentoo and have tested builds only on i386,
> > ARM, and MIPS.
> > 
> > Original Patches:
> > 
> > http://patchwork.ozlabs.org/patch/473086/
> > http://patchwork.ozlabs.org/patch/473087/
> > 
> > Ryan Barnett (2):
> >   openssl: use git formatted patches
> >   openssl: enable parallel build and installation
> 
> I have the feeling that the parallel build patches for OpenSSL are not
> working properly. Look at the recent build failures we've got for the
> openssl and host-openssl builds:
> 
>   http://autobuild.buildroot.org/?reason=openssl-1.0.2d
>   http://autobuild.buildroot.org/?reason=host-openssl-1.0.2d
[--SNIP--]
> Do you have some ideas? Does Gentoo has some more patches? Should we
> revert back to non-parallel build for OpenSSL ?

I believe we should just revert the patch.

It's unfortunate that we can't buid OpenSSL in parallel, but we can't
seriously go and patch their broken buildsystem, not at least until they
are willing to review and apply those patches upstream first.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
