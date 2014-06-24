From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 24 Jun 2014 16:19:43 +0200
Subject: [Buildroot] [PATCH v2 1/1] atftp: new package
In-Reply-To: <1403533158-3547-1-git-send-email-ryan.barnett@rockwellcollins.com>
 (Ryan Barnett's message of "Mon, 23 Jun 2014 09:19:18 -0500")
References: <1403533158-3547-1-git-send-email-ryan.barnett@rockwellcollins.com>
Message-ID: <87lhsmxudc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <ryan.barnett@rockwellcollins.com> writes:

 > Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
 > CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 > ---

 > Changes v1 -> v2:
 >  - Added dependancies to IPv6 and threads (suggested by Thomas P.)
 >  - Added more config options along with else cases for pcr and readline
 >    (suggested by Thomas P.)
 >  - Fixed pure static builds (suggested by Thomas P.)
 >      Patch submitted upstream at https://sourceforge.net/p/atftp/bugs/3/
 > ---
 > diff --git a/package/atftp/Config.in b/package/atftp/Config.in
 > new file mode 100644
 > index 0000000..23acf6f
 > --- /dev/null
 > +++ b/package/atftp/Config.in
 > @@ -0,0 +1,15 @@
 > +config BR2_PACKAGE_ATFTP
 > +	bool "atftp"
 > +	depends on BR2_INET_IPV6
 > +	depends on BR2_TOOLCHAIN_HAS_THREADS
 > +	help
 > +	  atftp is a client/server implementation of the TFTP
 > +	  protocol that implements RFCs 1350, 2090, 2347, 2348,
 > +	  and 2349. The server is multi-threaded and the client
 > +	  presents a friendly interface using libreadline.

This is naturally only true if readline is enabled, so I added a comment
describing that.

 > +
 > +	  http://sourceforge.net/projects/atftp/
 > +
 > +comment "atftp needs a toolchain w/ threads, IPv6"
 > +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
 > +

You have an extra trailing line here.

Committed with these minor fixes, thanks.

-- 
Bye, Peter Korsgaard
