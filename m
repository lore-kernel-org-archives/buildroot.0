From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2015 12:21:50 +0200
Subject: [Buildroot] [PATCH 1/1] host-localdef fails under gcc5
In-Reply-To: <1441057847-18193-1-git-send-email-stephen.agate@talktalk.net>
 (Stephen Agate's message of "Mon, 31 Aug 2015 22:50:47 +0100")
References: <1441057847-18193-1-git-send-email-stephen.agate@talktalk.net>
Message-ID: <87y4fjue69.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephen" == Stephen Agate <stephen.agate@talktalk.net> writes:

 > Building host-localdef fails under gcc5.1 reporting multiple definitions and undefined references:
 > argp-help.o: In function `argp_fmtstream_write':
 > argp-help.c:(.text+0x1dc0): multiple definition of `argp_fmtstream_write'
 > argp-fmtstream.o:argp-fmtstream.c:(.text+0x750): first defined here
 > argp-help.o: In function `argp_fmtstream_puts':
 > argp-help.c:(.text+0x1e10): multiple definition of `argp_fmtstream_puts'
 > argp-fmtstream.o:argp-fmtstream.c:(.text+0x810): first defined here
 > argp-help.o: In function `argp_fmtstream_putc':
 > argp-help.c:(.text+0x1e80): multiple definition of `argp_fmtstream_putc'
 > argp-fmtstream.o:argp-fmtstream.c:(.text+0x7b0): first defined here
 > argp-help.o: In function `argp_fmtstream_set_lmargin':
 > argp-help.c:(.text+0x1ed0): multiple definition of `argp_fmtstream_set_lmargin'
 > argp-fmtstream.o:argp-fmtstream.c:(.text+0x590): first defined here
 > argp-help.o: In function `argp_fmtstream_set_rmargin':
 > argp-help.c:(.text+0x1f00): multiple definition of `argp_fmtstream_set_rmargin'
 > argp-fmtstream.o:argp-fmtstream.c:(.text+0x5c0): first defined here
 > argp-help.o: In function `argp_fmtstream_set_wmargin':
 > argp-help.c:(.text+0x1f30): multiple definition of `argp_fmtstream_set_wmargin'
 > argp-fmtstream.o:argp-fmtstream.c:(.text+0x5f0): first defined here
 > argp-help.o: In function `argp_fmtstream_point':
 > argp-help.c:(.text+0x1f60): multiple definition of `argp_fmtstream_point'
 > argp-fmtstream.o:argp-fmtstream.c:(.text+0x620): first defined here
 > charmap.o: In function `cmlr_open.constprop.2':
 > charmap.c:(.text+0x230a): undefined reference to `charmap_hash'
 > charmap.o: In function `charmap_read':
 > charmap.c:(.text+0x2397): undefined reference to `charmap_hash'
 > locfile.o: In function `locfile_read':
 > locfile.c:(.text+0x2e4): undefined reference to `locfile_hash'
 > locfile.c:(.text+0x8f4): undefined reference to `locfile_hash'
 > locfile.c:(.text+0x9b3): undefined reference to `locfile_hash'
 > locfile.c:(.text+0xa36): undefined reference to `locfile_hash'
 > collect2: error: ld returned 1 exit status
 > Makefile:58: recipe for target 'localedef' failed

 > Ref: http://permalink.gmane.org/gmane.comp.embedded.ptxdist.devel/12950

 > Signed-off-by: Stephen Agate <stephen.agate@talktalk.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
