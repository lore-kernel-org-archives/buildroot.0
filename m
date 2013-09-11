From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 11 Sep 2013 13:24:29 +0200
Subject: [Buildroot] [PATCH 2/2] pkg-stats: fix proper identification of
 package infrastructure
In-Reply-To: <CAAXf6LXW33j4R5+r1mmJ8-MF-wAvWr54_dk+8z88O-GruEhmNw@mail.gmail.com>
References: <1378890739-3788-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <1378890739-3788-2-git-send-email-jerzy.grzegorek@trzebnica.net>
 <CAAXf6LXW33j4R5+r1mmJ8-MF-wAvWr54_dk+8z88O-GruEhmNw@mail.gmail.com>
Message-ID: <523052ED.5040109@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for the feedback.

> Hi,
>
> On Wed, Sep 11, 2013 at 11:12 AM, Jerzy Grzegorek
> <jerzy.grzegorek@trzebnica.net> wrote:
>> Typically each package invokes the macro which generates the Makefile code, in the way
>> like this: e.g. $(eval $(generic-package)) or $(eval $(autotools-package)) ,
>> but a few packages have to invoke this macro in other way:
>> $(eval $(call generic-package)) e.g. dhcpcd.mk
>> $(eval $(call autotools-package)) e.g. wireshark.mk .
> I rather think that the 'call' is an accident. Arnout removed the need
> for the extra $(call) in July 2012, with commit
> e1502ebc0c92763896c53d405ee9c7c7a1a33e24, and both dhcpcd and
> wireshark were added after that time. So I think this has been missed
> during code review.
>
> A quick search shows only three packages with a remaining $(eval
> $(call)) construct: dhcpcd, wireshark, jquery-keyboard.
> So I'd rather fix those packages...

Ah, I understand now.

Regards,
Jerzy
>
> Best regards,
> Thomas
>
