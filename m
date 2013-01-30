From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jan 2013 23:50:13 +0100
Subject: [Buildroot] [PATCH] Add support for plain URL in $(PKG)_PATCH
 variable
In-Reply-To: <201301302023.59219.yann.morin.1998@free.fr>
References: <20130118163104.441c2bfb@skate>
 <1358525515-7295-1-git-send-email-jezz@sysmic.org>
 <201301302023.59219.yann.morin.1998@free.fr>
Message-ID: <20130130235013.468a5290@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 30 Jan 2013 20:23:58 +0100, Yann E. MORIN wrote:
> In case one uses a custom directory to store all downloaded files
> (eg. I use "${HOME}/src" so I don't have to download them again and
> again), this directory gets cluttered with many files that are
> difficult to link to the package they apply to.
> 
> It gets even worse with this change.
> 
> What about saving the patches to a file named thus:
>    $(PKG_NAME)-$(PKG_VERSION)-$(PKG_PATCH_FILENAME).patch

I am not sure because we don't do this for tarballs: we keep their
original name. For example Python-3.3.0 even though the package is
named python3, cJSONFiles.zip even though the package is named cjson,
etc.

So either we decide to keep the original name for everything, or we
decide to use our own name for everything.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
