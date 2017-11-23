From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 22:00:55 +0100
Subject: [Buildroot] [PATCH/next 1/2] package/dovecot: bump version to
 2.2.33.2
In-Reply-To: <20171114072203.yznumdrkiad5xtwj@tarshish>
References: <20171114065151.24659-1-bernd.kuhls@t-online.de>
 <20171114072203.yznumdrkiad5xtwj@tarshish>
Message-ID: <20171123220055.3be02c93@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Nov 2017 09:22:03 +0200, Baruch Siach wrote:

> >  DOVECOT_VERSION_MAJOR = 2.2
> > -DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).31
> > +DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).33.2
> >  DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
> >  DOVECOT_INSTALL_STAGING = YES
> >  DOVECOT_LICENSE = LGPL-2.1  
> 
> Unrelated to this patch, but since COPYING.MIT is one of the license files, 
> why isn't the MIT license mentioned here?

Good catch. The COPYING file explains pretty well was going on here. It
says:

"""
Everything in src/lib/, src/auth/, src/lib-sql/ and src/lib-ntlm/ is under
MIT license (see COPYING.MIT) unless otherwise mentioned at the beginning
of the file.

Everything else is LGPLv2.1 (see COPYING.LGPL) unless otherwise mentioned
at the beginning of the file.

Current exceptions are:

src/lib/md5.c : Public Domain

src/lib/sha1.c and sha2.c:
[... here the next of BSD-3c]

src/lib/UnicodeData.txt:
[... something that looks very similar to
https://spdx.org/licenses/Unicode-DFS-2015.html, but isn't exactly the
same ...]

So perhaps:

DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, Unicode-DFS-2015

something like that ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
