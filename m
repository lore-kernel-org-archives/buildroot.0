From: Richard Braun <rbraun@sceen.net>
Date: Fri, 4 Jan 2013 13:07:59 +0100
Subject: [Buildroot] [PATCH] packages: add tzdata
In-Reply-To: <20130104125447.04031e67@skate>
References: <1357300124-7011-1-git-send-email-rbraun@sceen.net>
 <20130104125447.04031e67@skate>
Message-ID: <20130104120759.GA10338@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 04, 2013 at 12:54:47PM +0100, Thomas Petazzoni wrote:
> Please split in two patches. One for zic, one for tzdata.

OK.

> depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_glibc

This would prevent other applications with support for the format from
using it (in other words, although I'm not aware of other such
applications, glibc might not be the only user). The time zone database
itself has no real dependency. Do you still think I should add these,
and change them when needed only ?

> How about making it possible to configure which time zone data gets
> installed? From what I remember, the entire size of the tzdata database
> was quite large. Could be something like:

Indeed.

> > +define TZDATA_EXTRACT_CMDS
> > +	gzip -d -c $(DL_DIR)/$(TZDATA_SOURCE) \
> > +		| $(TAR) --strip-components=0 -C $(@D) -xf -
> > +endef
> 
> A short comment above to explain that the need to override the extract
> step is the strip-components=0 would be useful.

OK.

> > +Subject: [PATCH] fix zic dependencies
> > +
> > +---
> 
> A better patch description is needed.

OK.

I'll resubmit soon. Thanks.

-- 
Richard Braun
