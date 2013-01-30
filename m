From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Jan 2013 00:10:14 +0100
Subject: [Buildroot] [PATCH] Add support for plain URL in $(PKG)_PATCH
	variable
In-Reply-To: <1843724.RQrS0CTZ4r@sagittae>
References: <20130118163104.441c2bfb@skate>
 <201301302357.13921.yann.morin.1998@free.fr> <1843724.RQrS0CTZ4r@sagittae>
Message-ID: <201301310010.14309.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On Thursday 31 January 2013 J?r?me Pouiller wrote:
> On Wednesday 30 January 2013 23:57:13 Yann E. MORIN wrote:
> > So, given two packages, 'foo' and 'bar', what will happen if both have
> > a patch file named 'mktemp.patch' ?
> > 
> >  1- only one will be downloaded
> >  2- it will be applied onto both packages
> And what about
>   $(PKG_NAME)-$(PKG_VERSION)/$(PKG_PATCH_FILENAME).patch

No, we have to keep the patch filename as-is, or apply-patches.sh will
not know it has to uncompress it. So, do not append '.patch' .

Besides, we do not want to create sub-dirs in the DL dir (which can be
a custom dir, as it is in my case).

So, my proposal still stands: ;-)
    $(PKG_NAME)-$(PKG_VERSION)-$(PKG_PATCH_FILENAME)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
