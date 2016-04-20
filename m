From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 20 Apr 2016 07:31:43 +0300
Subject: [Buildroot] [PATCH 1/3] c-icap: avoid host library search path
In-Reply-To: <20160419211457.11d9bf2a@free-electrons.com>
References: <f4a2d607557dd8a5b7fdc322f0ae8ef083890076.1461089746.git.baruch@tkos.co.il>
 <20160419211457.11d9bf2a@free-electrons.com>
Message-ID: <20160420043143.GH2476@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Apr 19, 2016 at 09:14:57PM +0200, Thomas Petazzoni wrote:
> On Tue, 19 Apr 2016 21:15:44 +0300, Baruch Siach wrote:
> 
> > +C_ICAP_MAKE_OPTS = exec_prefix=$(STAGING_DIR)/usr
> 
> This is not correct. Setting exec_prefix to $(STAGING_DIR)/usr is
> wrong.

Quoting configure:

# Installation directory options.
# These are left unexpanded so users can "make install exec_prefix=/foo"
# and all the variables that are supposed to be based on exec_prefix
# by default will actually change.

> Instead, can you try to remove:
> 
>    -rpath @libdir@
> 
> from the various Makefile.am ?

I can do that, but I'm not sure upstream would like it.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
