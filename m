From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Sep 2017 11:27:17 +0200
Subject: [Buildroot] [PATCH] aiccu: remove package
In-Reply-To: <20170910102134.1448-1-alexander.i.mukhin@gmail.com> (Alexander
 Mukhin's message of "Sun, 10 Sep 2017 13:21:34 +0300")
References: <20170909153834.GA2850@scaer>
 <20170910102134.1448-1-alexander.i.mukhin@gmail.com>
Message-ID: <87y3pl7fgq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Mukhin <alexander.i.mukhin@gmail.com> writes:

 > As the SixXS project has ceased its operation on 2017-06-06,
 > the aiccu utility has been removed.


 > Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
 > ---
 >  Config.in.legacy                                   | 10 +++
 >  DEVELOPERS                                         |  1 -
 >  package/Config.in                                  |  1 -
 >  package/aiccu/0001-gnutls.patch                    | 73 ----------------------
 >  .../0002-makefile-reorder-linked-libraries.patch   | 15 -----
 >  package/aiccu/0003-if-ether-header.patch           | 23 -------
 >  package/aiccu/0005-res-ninit.patch                 | 33 ----------
 >  package/aiccu/Config.in                            | 25 --------
 >  package/aiccu/aiccu.hash                           |  2 -
 >  package/aiccu/aiccu.mk                             | 40 ------------
 >  10 files changed, 10 insertions(+), 213 deletions(-)
 >  delete mode 100644 package/aiccu/0001-gnutls.patch
 >  delete mode 100644 package/aiccu/0002-makefile-reorder-linked-libraries.patch
 >  delete mode 100644 package/aiccu/0003-if-ether-header.patch
 >  delete mode 100644 package/aiccu/0005-res-ninit.patch
 >  delete mode 100644 package/aiccu/Config.in
 >  delete mode 100644 package/aiccu/aiccu.hash
 >  delete mode 100644 package/aiccu/aiccu.mk

 > diff --git a/Config.in.legacy b/Config.in.legacy
 > index 44303a42b..d4befa864 100644
 > --- a/Config.in.legacy
 > +++ b/Config.in.legacy
 > @@ -145,6 +145,16 @@ endif
 >  ###############################################################################
 >  comment "Legacy options removed in 2017.11"
 
 > +config BR2_PACKAGE_AICCU
 > +	bool "aiccu utility removed"
 > +	select BR2_LEGACY
 > +	help
 > +	  As the SixXS project has ceased its operation on 2017-06-06,
 > +	  the AICCU utility has no use anymore and has been removed.
 > +
 > +	  https://www.sixxs.net/sunset/
 > +
 > +

Committed after dropping the extra empty line, thanks.

-- 
Bye, Peter Korsgaard
