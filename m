From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2020 16:19:21 +0100
Subject: [Buildroot] [PATCH] package/linux-tools: filter debugging
 symbols for hyperv
In-Reply-To: <20200226085332.5484-1-p.debruijn@unilogic.nl> (Pascal de
 Bruijn's message of "Wed, 26 Feb 2020 09:53:32 +0100")
References: <20200226085332.5484-1-p.debruijn@unilogic.nl>
Message-ID: <87y2sp74w6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pascal" == Pascal de Bruijn <p.debruijn@unilogic.nl> writes:

 > Workaround for:
 > ld: hv_vss_daemon.o: unable to initialize decompress status for section .debug_info
 > ld: hv_vss_daemon.o: unable to initialize decompress status for section .debug_info
 > hv_vss_daemon.o: file not recognized: File format not recognized

 > Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
 > ---
 >  package/linux-tools/linux-tool-hv.mk.in | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/linux-tools/linux-tool-hv.mk.in b/package/linux-tools/linux-tool-hv.mk.in
 > index 6996c55271..e638fecfc6 100644
 > --- a/package/linux-tools/linux-tool-hv.mk.in
 > +++ b/package/linux-tools/linux-tool-hv.mk.in
 > @@ -16,7 +16,7 @@ HV_hv_kvp_daemon = hypervkvpd
 >  HV_hv_fcopy_daemon = hypervfcopyd
 >  HV_hv_vss_daemon = hypervvssd
 
 > -HV_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
 > +HV_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(filter-out -g%,$(TARGET_CFLAGS))"

Committed, thanks.

Lets hope there are no other important CFLAGS starting with -g.

-- 
Bye, Peter Korsgaard
