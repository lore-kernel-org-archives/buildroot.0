From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Thu, 31 Jan 2013 00:04:27 +0100
Subject: [Buildroot] [PATCH] Add support for plain URL in $(PKG)_PATCH
	variable
In-Reply-To: <201301302357.13921.yann.morin.1998@free.fr>
References: <20130118163104.441c2bfb@skate> <20130130235013.468a5290@skate>
 <201301302357.13921.yann.morin.1998@free.fr>
Message-ID: <1843724.RQrS0CTZ4r@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 30 January 2013 23:57:13 Yann E. MORIN wrote:
> On Wednesday 30 January 2013 Thomas Petazzoni wrote:
[...]
> > > What about saving the patches to a file named thus:
> > >    $(PKG_NAME)-$(PKG_VERSION)-$(PKG_PATCH_FILENAME).patch
> > 
> > I am not sure because we don't do this for tarballs: we keep their
> > original name. For example Python-3.3.0 even though the package is
> > named python3, cJSONFiles.zip even though the package is named cjson,
> > etc.
> > 
> > So either we decide to keep the original name for everything, or we
> > decide to use our own name for everything.
> 
> So, given two packages, 'foo' and 'bar', what will happen if both have
> a patch file named 'mktemp.patch' ?
> 
>  1- only one will be downloaded
>  2- it will be applied onto both packages
And what about
  $(PKG_NAME)-$(PKG_VERSION)/$(PKG_PATCH_FILENAME).patch
?

-- 
J?r?me Pouiller
