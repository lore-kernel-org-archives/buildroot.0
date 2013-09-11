From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Sep 2013 13:06:07 +0200
Subject: [Buildroot] [PATCH 2/2] pkg-stats: fix proper identification of
	package infrastructure
In-Reply-To: <CAAXf6LXW33j4R5+r1mmJ8-MF-wAvWr54_dk+8z88O-GruEhmNw@mail.gmail.com>
 (Thomas De Schampheleire's message of "Wed, 11 Sep 2013 11:53:30
 +0200")
References: <1378890739-3788-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <1378890739-3788-2-git-send-email-jerzy.grzegorek@trzebnica.net>
 <CAAXf6LXW33j4R5+r1mmJ8-MF-wAvWr54_dk+8z88O-GruEhmNw@mail.gmail.com>
Message-ID: <87d2ofsjmo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 Thomas> Hi,
 Thomas> On Wed, Sep 11, 2013 at 11:12 AM, Jerzy Grzegorek
 Thomas> <jerzy.grzegorek@trzebnica.net> wrote:
 >> Typically each package invokes the macro which generates the Makefile code, in the way
 >> like this: e.g. $(eval $(generic-package)) or $(eval $(autotools-package)) ,
 >> but a few packages have to invoke this macro in other way:
 >> $(eval $(call generic-package)) e.g. dhcpcd.mk
 >> $(eval $(call autotools-package)) e.g. wireshark.mk .

 Thomas> I rather think that the 'call' is an accident. Arnout removed the need
 Thomas> for the extra $(call) in July 2012, with commit
 Thomas> e1502ebc0c92763896c53d405ee9c7c7a1a33e24, and both dhcpcd and
 Thomas> wireshark were added after that time. So I think this has been missed
 Thomas> during code review.

 Thomas> A quick search shows only three packages with a remaining $(eval
 Thomas> $(call)) construct: dhcpcd, wireshark, jquery-keyboard.
 Thomas> So I'd rather fix those packages...

Agreed, I've fixed those in git now.

-- 
Bye, Peter Korsgaard
