From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Jan 2013 23:57:13 +0100
Subject: [Buildroot] [PATCH] Add support for plain URL in $(PKG)_PATCH
	variable
In-Reply-To: <20130130235013.468a5290@skate>
References: <20130118163104.441c2bfb@skate>
 <201301302023.59219.yann.morin.1998@free.fr> <20130130235013.468a5290@skate>
Message-ID: <201301302357.13921.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Wednesday 30 January 2013 Thomas Petazzoni wrote:
> Dear Yann E. MORIN,
> 
> On Wed, 30 Jan 2013 20:23:58 +0100, Yann E. MORIN wrote:
> > In case one uses a custom directory to store all downloaded files
> > (eg. I use "${HOME}/src" so I don't have to download them again and
> > again), this directory gets cluttered with many files that are
> > difficult to link to the package they apply to.
> > 
> > It gets even worse with this change.
> > 
> > What about saving the patches to a file named thus:
> >    $(PKG_NAME)-$(PKG_VERSION)-$(PKG_PATCH_FILENAME).patch
> 
> I am not sure because we don't do this for tarballs: we keep their
> original name. For example Python-3.3.0 even though the package is
> named python3, cJSONFiles.zip even though the package is named cjson,
> etc.
> 
> So either we decide to keep the original name for everything, or we
> decide to use our own name for everything.

So, given two packages, 'foo' and 'bar', what will happen if both have
a patch file named 'mktemp.patch' ?

 1- only one will be downloaded
 2- it will be applied onto both packages

Err... :-(

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
