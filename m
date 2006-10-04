From: Thomas Lundquist <lists@zelow.no>
Date: Wed, 4 Oct 2006 18:37:42 +0200
Subject: [Buildroot] LZMA in Buldroot.
In-Reply-To: <20061004162028.GA18682@aon.at>
References: <20061003173002.GA19937@zelow.no> <20061004084732.GA15165@aon.at>
	<20061004144046.GA32537@zelow.no> <20061004162028.GA18682@aon.at>
Message-ID: <20061004163742.GA2306@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 04, 2006 at 06:20:28PM +0200, Bernhard Fischer wrote:
> > 
> >+$(EXT2_BASE).lzma: lzma-host $(EXT2_BASE)
> >+	@$(STAGING_DIR)/bin/lzma -vc $(EXT2_BASE) > $(EXT2_BASE).lzma
> >+
> 
> reminds me that we may want to lzma the other filesystems too, later on.

there are patches for lzma compressed squashfs around. I haven't found
any for 3.0 tho.

> >-#lzma-headers: $(TARGET_DIR)/bin/lzma

> >-#ifeq ($(strip $(BR2_PACKAGE_LZMA_TARGET_HEADERS)),y)
> >-#TARGETS+=lzma-headers
> >-#endif

> Should be added as an option rather than removed..
> lzma-headers: $(TARGET_DIR)/usr/bin/lzma
> 	-cp -dpf the_lzma.h $(TARGET_DIR)/usr/include/

as snipped out from the original lzma.mk, it's commented out which is
why I removed it.

do you still want it?


Thomas.
