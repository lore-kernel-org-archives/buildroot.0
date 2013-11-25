From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 25 Nov 2013 11:04:00 +0100
Subject: [Buildroot] [PATCH v2 2/2] libglib2: the system PCRE needs to
	have UTF and UCP enabled
In-Reply-To: <1385373282.2810.8.camel@sven> (Sven Neumann's message of "Mon,
 25 Nov 2013 10:54:42 +0100")
References: <1385157507.14731.31.camel@bender>
 <87eh68nk15.fsf@dell.be.48ers.dk> <1385365774.2810.1.camel@sven>
 <87y54clu1y.fsf@dell.be.48ers.dk> <1385373282.2810.8.camel@sven>
Message-ID: <87pppolrvz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <neumann@teufel.de> writes:

Hi,

 >> Hmm, ok - That wasn't completely clear to me. So even though it's
 >> just a warning, this is something critical?

 > Any functionality that use GRegex won't work if the system PCRE is not
 > compiled with UTF-8 and UCP support. There might be glib-based
 > applications that won't be affected by this, but there is a good chance
 > that people will run into unexpected problems because of this.

Ok, thanks for the details.


 >> When was this introduced? By the 2.36.1 -> 2.36.3 bump or is 2013.08
 >> also affected?

 > As far as I can see this was introduced with commit fe192908a4e:

 >  commit fe192908a4e3195b6f724310fe83fadaf18b66e7
 >  Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 >  Date:   Sat Mar 9 08:21:30 2013 +0000

 >     libglib2: use system pcre when available

Ok, so 2013.08 is also affected. We afaik didn't have any bug reports
related to this, but I have added the 2 patches for 2013.11 - Thanks.

-- 
Bye, Peter Korsgaard
