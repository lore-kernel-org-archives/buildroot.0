From: =?utf-8?B?U8O4cmVuc2VuLCBTdGVmYW4=?= <Stefan.Sorensen@spectralink.com>
Date: Wed, 5 Apr 2017 12:40:02 +0000
Subject: [Buildroot] [PATCH 2/4] cracklib: New package
In-Reply-To: <20170401231523.70524b90@free-electrons.com>
References: <20170209134558.3723-1-stefan.sorensen@spectralink.com>
 <20170209134558.3723-2-stefan.sorensen@spectralink.com>
 <20170401231523.70524b90@free-electrons.com>
Message-ID: <1491396001.3239.1.camel@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2017-04-01 at 23:15 +0200, Thomas Petazzoni wrote:
> +CRACKLIB_INSTALL_STAGING = YES
> > +CRACKLIB_DEPENDENCIES = host-cracklib
> > +ifeq ($(BR2_PACKAGE_CRACKLIB_FULL_DICT),y)
> > +CRACKLIB_EXTRA_DOWNLOADS = cracklib-words-$(CRACKLIB_VERSION).gz
> > +endif
> 
> Unfortunately, this full dict thing doesn't work, at install time, I
> see:
> 
> cracklib-format /home/thomas/dl/cracklib-words-2.9.6.gz | cracklib-
> packer
> /home/thomas/projets/buildroot/output/target/usr/share/cracklib/pw_di
> ct
> skipping line: 1
> 4 3
> 
> and the generated files on the target are really, really small:
> 
> -rw-r--r-- 1 thomas thomas 1024 avril??1 23:04
> output/target/usr/share/cracklib/pw_dict.hwm
> -rw-r--r-- 1 thomas thomas???50 avril??1 23:04
> output/target/usr/share/cracklib/pw_dict.pwd
> -rw-r--r-- 1 thomas thomas???16 avril??1 23:04
> output/target/usr/share/cracklib/pw_dict.pwi
> 
> Could you have a look into this, and submit an updated version that
> fixes this issue?

I am not able to reproduce this, though I just notices that it uses the
 cracklib tools from the PATH, not the ones built in host-cracklib, so
maybe that is what is causing the issue.

I will submit new patches with this and the other issues you mentioned
fixed.

Stefan
