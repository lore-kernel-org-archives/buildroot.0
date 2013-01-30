From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Thu, 31 Jan 2013 00:11:08 +0100
Subject: [Buildroot] [PATCH] Add support for plain URL in $(PKG)_PATCH
	variable
In-Reply-To: <201301302354.24029.yann.morin.1998@free.fr>
References: <201301302023.59219.yann.morin.1998@free.fr>
 <1359585462-1314-2-git-send-email-jezz@sysmic.org>
 <201301302354.24029.yann.morin.1998@free.fr>
Message-ID: <8398960.ALrh5xOxZ9@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 30 January 2013 23:54:23 Yann E. MORIN wrote:
> J?r?me, All,
> 
> On Wednesday 30 January 2013 J?r?me Pouiller wrote:
> > Until now, $(PKG)_PATCH allow only to download patches from same URL than
> > tarball. This patch allow to detect when plain URL are used in
> > $(PKG)_PATCH and correctly handle them.
> > 
> > Downloaded patches are named
> > $(PKG_NAME)-$(PKG_VERSION)-$(PKG_PATCH_FILENAME).patch
> Well, I meant: $(PKG_NAME)-$(PKG_VERSION)-$(PKG_PATCH_FILENAME)
> We should keep the original filename (in case it is compresed).
In this case, I think files ending with .diff will not work (and compressed 
patches are not supported without a HOOK).

[...]
> > +			$(call DOWNLOAD,$($(PKG)_SITE)/$(p))\
> 
> The naming should also be applied for the 'plain-file' case, too.
Sure.

[...]
-- 
J?r?me Pouiller
