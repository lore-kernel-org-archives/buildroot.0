From: Carlos Santos <casantos@datacom.com.br>
Date: Tue, 12 Jun 2018 08:52:25 -0300 (BRT)
Subject: [Buildroot] swapoff, but no swapon in initab
In-Reply-To: <87zi0074sa.fsf@dell.be.48ers.dk>
References: <509563228.1507483.1528305257656.JavaMail.zimbra@datacom.com.br>
 <8b5f67de-8fe7-ffd2-6c20-9662908947de@mind.be>
 <2139346916.1818743.1528457899819.JavaMail.zimbra@datacom.com.br>
 <272b0e3a-7f9b-f18d-a430-97553e260019@mind.be>
 <87zi0074sa.fsf@dell.be.48ers.dk>
Message-ID: <909872342.136921.1528804345151.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Peter Korsgaard" <peter@korsgaard.com>
> To: "Arnout Vandecappelle" <arnout@mind.be>
> Cc: "DATACOM" <casantos@datacom.com.br>, "buildroot" <buildroot@buildroot.org>
> Sent: Tuesday, June 12, 2018 6:06:13 AM
> Subject: Re: swapoff, but no swapon in initab

>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
> Hi,
> 
> >> "All devices marked as ``swap'' in /etc/fstab are made available,
> >> except for those with the ``noauto'' option. Devices that are
> >> already being used as swap are silently skipped."
> 
> >  So bottom line: it would make sense to add a swapon -a to the default inittabs
> > (both busybox and sysv).
> 
> Don't we then end up with an ugly error message / somewhat needlessly bloat
> everyones busybox config for the (very common) situation where swap is
> not used and disabled in the kernel?

A "swapon -a" does nothing if a swap entry is not found in /etc/fstab,
so there is no error message. Conversely, a "swapoff -a" does nothing
if a mounted swap is not found but I did not test if it issues some
error message due to a failing system call when swap is disabled in
the kernel. I will run some tests and submit an additional patch, if
necessary.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
