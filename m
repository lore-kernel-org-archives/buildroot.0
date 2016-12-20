From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Dec 2016 19:31:55 +0100
Subject: [Buildroot] [PATCH] linux-headers: kill 3.14.x and 4.{5, 6,
	7}.x series
In-Reply-To: <20161220144826.3034-1-gustavo@zacarias.com.ar> (Gustavo
 Zacarias's message of "Tue, 20 Dec 2016 11:48:26 -0300")
References: <20161220144826.3034-1-gustavo@zacarias.com.ar>
Message-ID: <87inqe78pw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > These aren't supported upstream any more so remove the options and add
 > them to legacy.
 > Also switch the older deprecations that used 3.14.x to 3.12.x

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  Config.in.legacy                     | 52 +++++++++++++++++++++++++++++++-----
 >  package/linux-headers/Config.in.host | 21 ---------------
 >  2 files changed, 46 insertions(+), 27 deletions(-)

 > diff --git a/Config.in.legacy b/Config.in.legacy
 > index 2922fb4..2e11725 100644
 > --- a/Config.in.legacy
 > +++ b/Config.in.legacy
 > @@ -145,6 +145,46 @@ endif
 >  ###############################################################################
 >  comment "Legacy options removed in 2017.02"
 
 > +config BR2_KERNEL_HEADERS_4_7
 > +	bool "kernel headers version 4.7.x are no longer supported"
 > +	select BR2_KERNEL_HEADERS_4_4
 > +	select BR2_LEGACY
 > +	help
 > +	  Version 4.7.x of the Linux kernel headers are no longer
 > +	  maintained upstream and are now removed. As an alternative,
 > +	  version 4.4.x of the headers have been automatically
 > +	  selected in your configuration.
 > +
 > +config BR2_KERNEL_HEADERS_4_6
 > +	bool "kernel headers version 4.6.x are no longer supported"
 > +	select BR2_KERNEL_HEADERS_4_4
 > +	select BR2_LEGACY
 > +	help
 > +	  Version 4.6.x of the Linux kernel headers are no longer
 > +	  maintained upstream and are now removed. As an alternative,
 > +	  version 4.4.x of the headers have been automatically
 > +	  selected in your configuration.
 > +
 > +config BR2_KERNEL_HEADERS_4_5
 > +	bool "kernel headers version 4.5.x are no longer supported"
 > +	select BR2_KERNEL_HEADERS_4_4
 > +	select BR2_LEGACY
 > +	help
 > +	  Version 4.5.x of the Linux kernel headers are no longer
 > +	   maintained upstream and are now removed. As an alternative,
 > +	   version 4.4.x of the headers have been automatically
 > +	   selected in your configuration.
 > +
 > +config BR2_KERNEL_HEADERS_3_14
 > +        bool "kernel headers version 3.14.x are no longer supported"

spaces instead of tabs. Committed wit that fixed, thanks.

-- 
Bye, Peter Korsgaard
