From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Feb 2014 10:35:20 +0100
Subject: [Buildroot] [PATCH] libsigsegv: disable for ARC
In-Reply-To: <1392110352-29340-1-git-send-email-anton.kolesov@synopsys.com>
 (Anton Kolesov's message of "Tue, 11 Feb 2014 13:19:12 +0400")
References: <1392110352-29340-1-git-send-email-anton.kolesov@synopsys.com>
Message-ID: <878utivvon.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Anton" == Anton Kolesov <anton.kolesov@synopsys.com> writes:

 > The ARC uClibc port doesn't provide ucontext_i.sym file required to enable
 > context manipulation routines that libsigsegv needs.

 > Signed-off-by: Anton Kolesov <anton.kolesov@synopsys.com>
 > ---
 >  package/libsigsegv/Config.in | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/libsigsegv/Config.in b/package/libsigsegv/Config.in
 > index 563ca27..4abb2a4 100644
 > --- a/package/libsigsegv/Config.in
 > +++ b/package/libsigsegv/Config.in
 > @@ -1,6 +1,7 @@
 >  config BR2_PACKAGE_LIBSIGSEGV
 >  	bool "libsigsegv"
 >  	depends on !BR2_xtensa
 > +	depends on !BR2_arc

Committed with a comment explaining why and a link to the autobuilder
failure added, thanks.

-- 
Bye, Peter Korsgaard
