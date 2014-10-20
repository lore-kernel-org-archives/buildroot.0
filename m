From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 20 Oct 2014 12:58:59 +0200
Subject: [Buildroot] [PATCH 1/2] mx53loco: update support
In-Reply-To: <20141020103131.438fb440@e6520eb.localdomain> ("Eric
 =?utf-8?Q?B=C3=A9nard=22's?=
 message of "Mon, 20 Oct 2014 10:31:31 +0200")
References: <1413790693-8281-1-git-send-email-eric@eukrea.com>
 <8738ajcgnf.fsf@dell.be.48ers.dk>
 <20141020103131.438fb440@e6520eb.localdomain>
Message-ID: <87iojfatxo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric B?nard <eric@eukrea.com> writes:

Hi,

 >> fslc? Do you mean Freescale?
 >> 
 > fscl means "Freescale Community" : 

fslc ;)

 > http://freescale.github.io/
 > https://community.freescale.com/welcome
 > so the suffix -fslc is added to u-boot & linux git trees :
 > https://github.com/Freescale/u-boot-fslc
 > https://github.com/Freescale/linux-fslc

Ok, thanks.


 >> I prefer to keep the section comments, but OK.
 >> 
 > make savedefconfig automagically removed the comments.
 > I you prefer I can manually reintroduce them.

I think it is nicer for consistency, but I can add them as well when
committing.


 >> >  BR2_LINUX_KERNEL=y
 >> >  BR2_LINUX_KERNEL_CUSTOM_GIT=y
 >> >  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
 >> > -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_2.6.35_11.09.01"
 >> > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="imx_2.6.35_maintain"
 >> 
 >> _VERSION has to uniquely specify a revision, so it must be a tag or a
 >> sha1 - And not a branch.
 >> 
 > then the help is misleading as it says (for
 > BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION and for
 > BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION) :
 > "Revision to use in the typical format used by Git/Mercurial
 > E.G. a sha id, a tag, _branch_ , .. "

Ahh yes, I'll fix that. The problem about using a branch is that the
downloading infrastructure thinks the branch name uniquely identifies
the code, so it will only download it once even if more commits are
pushed to the branch later.

-- 
Bye, Peter Korsgaard
