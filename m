From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 24 Nov 2017 07:06:19 +0200
Subject: [Buildroot] [PATCH/next 1/2] package/dovecot: bump version to
 2.2.33.2
In-Reply-To: <20171123220055.3be02c93@windsurf.lan>
References: <20171114065151.24659-1-bernd.kuhls@t-online.de>
 <20171114072203.yznumdrkiad5xtwj@tarshish>
 <20171123220055.3be02c93@windsurf.lan>
Message-ID: <20171124050619.j4jefh4r472alju3@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Nov 23, 2017 at 10:00:55PM +0100, Thomas Petazzoni wrote:
> On Tue, 14 Nov 2017 09:22:03 +0200, Baruch Siach wrote:
> 
> > >  DOVECOT_VERSION_MAJOR = 2.2
> > > -DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).31
> > > +DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).33.2
> > >  DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
> > >  DOVECOT_INSTALL_STAGING = YES
> > >  DOVECOT_LICENSE = LGPL-2.1  
> > 
> > Unrelated to this patch, but since COPYING.MIT is one of the license files, 
> > why isn't the MIT license mentioned here?
> 
> Good catch. The COPYING file explains pretty well was going on here. It
> says:
> 
> """
> Everything in src/lib/, src/auth/, src/lib-sql/ and src/lib-ntlm/ is under
> MIT license (see COPYING.MIT) unless otherwise mentioned at the beginning
> of the file.
> 
> Everything else is LGPLv2.1 (see COPYING.LGPL) unless otherwise mentioned
> at the beginning of the file.
> 
> Current exceptions are:
> 
> src/lib/md5.c : Public Domain
> 
> src/lib/sha1.c and sha2.c:
> [... here the next of BSD-3c]
> 
> src/lib/UnicodeData.txt:
> [... something that looks very similar to
> https://spdx.org/licenses/Unicode-DFS-2015.html, but isn't exactly the
> same ...]
> 
> So perhaps:
> 
> DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, Unicode-DFS-2015
> 
> something like that ?

I added also BSD-3-Clause that COPYING mentioned.

It turns out that SPDX lists[1] 5 variants of BSD-3c. The BSD-3-Clause 
identifier refers to '"New" or "Revised" License', which is not exactly the 
same as the text in COPYING. But I think this is good enough for our purpose.

[1] https://spdx.org/licenses/

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
