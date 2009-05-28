From: Barney Barumba <barney.b@iname.com>
Date: Fri, 29 May 2009 07:25:18 +1000
Subject: [Buildroot] Illegal instruction with buildroot busybox for ARM
 DNS323
Message-ID: <20090528212518.BC4F68735C@cal1-1.us4.outblaze.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

> Quick quess - Did you configure BR for hardware floating point and
> didn't enable floating point emulation in the kernel?

Yes, I think the floating point was the problem. I had BR configured for
hardware floating point and the kernel configured for NWFPE. Investigating
this a bit more, this article (1) seems to suggest that this configuration
should work, so I'm not sure why I still got the exception.

There's another article here (2) that seems to suggest that using the EABI
improves the situation somewhat, but I'm not really sure how that affects
things.

Anyway, configuring BR for software floating point has fixed the problem
and, if I understand it correctly, should be faster anyway for this CPU.

Thanks for the pointer - much appreciated.

Barney

(1) http://linux-7110.sourceforge.net/howtos/netbook_new/x1114.htm
(2) http://wiki.debian.org/ArmEabiPort#ARMfloatingpoints


-- 
Be Yourself @ mail.com!
Choose From 200+ Email Addresses
Get a Free Account at www.mail.com
