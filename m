From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Sep 2015 20:09:30 +0200
Subject: [Buildroot] [PATCH 1/2] package/gdb (7.9): fix doc build when
 makeinfo is missing
In-Reply-To: <1441463443-9335-1-git-send-email-romain.naour@openwide.fr>
References: <1441463443-9335-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150905200930.7e018f2a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Sat,  5 Sep 2015 16:30:42 +0200, Romain Naour wrote:

> + gdb/index.html: ${GDB_DOC_FILES}
> +-	$(MAKEHTML) $(MAKEHTMLFLAGS) $(READLINE_TEXI_INCFLAG) -I ${GDBMI_DIR} -I $(srcdir) $(srcdir)/gdb.texinfo
> ++	$(MAKEHTML) $(MAKEHTMLFLAGS) $(READLINE_TEXI_INCFLAG) -I ${GDBMI_DIR} -I $(srcdir) $(srcdir)/gdb.texinfo | true

Can you try instead to just prepend a - at the beginning of the line?

	-$(MAKEHTML) ....

Or better yet, for a properly upstreamable solution, a --enable-doc
option to explicitly enable or disable the doc. Or something that
detects if makeinfo is available, and if it isn't, that doesn't try to
generate the documentation.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
