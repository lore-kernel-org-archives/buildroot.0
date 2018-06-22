From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Jun 2018 12:22:51 +0200
Subject: [Buildroot] [PATCH] imx-usb-loader: fix build with older gcc
In-Reply-To: <ad92c4bc-c60a-6312-c484-0f7c447efa0a@mind.be> (Arnout
 Vandecappelle's message of "Thu, 21 Jun 2018 23:56:52 +0200")
References: <53fcb79e408e468aaa45b7adc6ba0f92aba03702.1529419481.git.baruch@tkos.co.il>
 <87tvpyo5xc.fsf@dell.be.48ers.dk>
 <ad92c4bc-c60a-6312-c484-0f7c447efa0a@mind.be>
Message-ID: <877emrktms.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> > ++#define BE16(x) (x<<8 | x>>8)
 >> 
 >> I take it this is never called on anything where the double evaluation
 >> causes any side effects?

 >  Even so, x without parenthesis around it is extremely dangerous...

 >  Since this is inside __GNUC__, we could just use an expression statement like
 > in the kernel:

 > #define BE16(x) \
 > ({ \
 > 	typeof(x) __x = (x); \
 > 	(__x<<8 | __x>>8); \
 > })

Correct. Baruch, will you send an update (here and upstream)?

-- 
Bye, Peter Korsgaard
