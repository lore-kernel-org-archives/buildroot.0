From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Tue, 12 Nov 2013 21:14:29 +0000
Subject: [Buildroot] [PATCH v2 2/5] gcc: add microblaze internal
 toolchain
In-Reply-To: <20131112220752.6fea927d@skate>
References: <1384277505-11503-1-git-send-email-spenser@gillilanding.com>
 <1384277505-11503-3-git-send-email-spenser@gillilanding.com>
 <20131112220752.6fea927d@skate>
Message-ID: <E6BF041E97966E4DB955F0DF883AD2D685F17471@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> >
> >  define HOST_GCC_EXTRACT_CMDS
> > -	$(BZCAT) $(DL_DIR)/$(GCC_SOURCE) | \
> > +	$(call suitable-extractor,$(GCC_SOURCE),$(BZCAT))
> > +$(DL_DIR)/$(GCC_SOURCE) | \
> 
> The suitable-extractor macro doesn't take a second argument, so the ,$(BZCAT)
> here is useless.
> 
> >  		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) \
> >  		--exclude='libjava/*' \
> >  		--exclude='libgo/*' \
> 
> Another issue is that this series is going to conflict quite badly with the
> series posted by Mischa to add specific binutils/gcc/gdb/uClibc versions for
> ARC.
> 
> It would probably be good if you could sync up on these two series.
> 

I wasn't aware of this suitable-extractor macro. If it supports .tar.gz, it should work fine for me (and I will update my patch accordingly, or better yet: leave it out of my patch completely). I will need to update my patch anyway with full commit ID's, and maybe I take a look at implementing this github helper too.

Mischa
