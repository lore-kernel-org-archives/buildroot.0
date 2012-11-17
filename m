From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 22:43:04 +0100
Subject: [Buildroot] [PATCH] host-lua: fix bug #5354
In-Reply-To: <50A7F1D1.9060405@zacarias.com.ar> (Gustavo Zacarias's message of
 "Sat, 17 Nov 2012 17:21:37 -0300")
References: <1353146744-13529-1-git-send-email-francois.perrad@gadz.org>
 <87boewt3hv.fsf@dell.be.48ers.dk> <871ufst34m.fsf@dell.be.48ers.dk>
 <50A7F1D1.9060405@zacarias.com.ar>
Message-ID: <873907sy6v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 >> Ahh, I see it now - It's because we're passing -nostdlib -lgcc when
 >> creating the shared library. Why are we doing that in the first place?
 >> 
 >> Gustavo, it seems to date back to 46913a2d4. Do you have any idea why it
 >> was done like that?

 Gustavo> https://bugs.busybox.net/show_bug.cgi?id=803 has rvpaasen's
 Gustavo> work, i just reworked it IIRC.  OpenWRT doesn't try to link to
 Gustavo> libgcc or ditch the standard startup and libraries, it's worth
 Gustavo> a try to kill that bit.

Ok, done.

-- 
Bye, Peter Korsgaard
