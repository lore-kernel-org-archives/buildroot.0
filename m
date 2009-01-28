From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Wed, 28 Jan 2009 09:47:58 +0100
Subject: [Buildroot] 2009.02-rc2 released
In-Reply-To: <87skn9iv5w.fsf@macbook.be.48ers.dk>
References: <87skn9iv5w.fsf@macbook.be.48ers.dk>
Message-ID: <49801BBE.8060603@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
> Hi,
> 
> Another week, another release candidate. I have released
> buildroot-2009.02-rc2:
> 
> http://buildroot.uclibc.org/downloads/buildroot-2009.02-rc2.tar.gz
> 
> or
> 
> http://buildroot.uclibc.org/downloads/buildroot-2009.02-rc2.tar.bz2
> 

Great!

> Please give it a spin and report back issues to the mailing list or
> the bug tracker.

I've tested my custom Axis etrax LX100 based board (cris arch-v10 CPU) and
buildroot 2009.02-rc2 builds toolchain and kernel wo problem.
I have minor fixes for 2.6.28.1 kernel and 4.3.2 gcc regarding cris
architecture (please apply):

 - 999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch
   remove warnings when compiling gcc-4.3.2
 - linux-2.6.28.1-cris-eth-driver-netpoll.patch
   make cris eth driver compile on 2.6.28.1 kernel
 - linux-2.6.28.1-cris-klist-warnings.patch
   avoid klist warnings at bootup related to alignment of the klist struct (from be 2.6.28 stable)

> 
> I think we're pretty well on track to do a final release in 2 weeks.
> 

Keep up the great work!

Thanks,
Hinko

-- 
Hinko Ko?evar, OSS developer
?ETRTA POT, d.o.o.
Planina 3, 4000 Kranj, SI EU
tel     ++386 (0) 4 280 66 03
e-mail  hinko.kocevar at cetrtapot.si
http    www.cetrtapot.si

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: 999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch
Url: http://lists.busybox.net/pipermail/buildroot/attachments/20090128/3c53abf1/attachment.diff 
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: linux-2.6.28.1-cris-klist-warnings.patch
Url: http://lists.busybox.net/pipermail/buildroot/attachments/20090128/3c53abf1/attachment-0001.diff 
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: linux-2.6.28.1-cris-eth-driver-netpoll.patch
Url: http://lists.busybox.net/pipermail/buildroot/attachments/20090128/3c53abf1/attachment-0002.diff 
