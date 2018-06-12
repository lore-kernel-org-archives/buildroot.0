From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jun 2018 11:06:13 +0200
Subject: [Buildroot] swapoff, but no swapon in initab
In-Reply-To: <272b0e3a-7f9b-f18d-a430-97553e260019@mind.be> (Arnout
 Vandecappelle's message of "Sun, 10 Jun 2018 23:46:59 +0200")
References: <509563228.1507483.1528305257656.JavaMail.zimbra@datacom.com.br>
 <8b5f67de-8fe7-ffd2-6c20-9662908947de@mind.be>
 <2139346916.1818743.1528457899819.JavaMail.zimbra@datacom.com.br>
 <272b0e3a-7f9b-f18d-a430-97553e260019@mind.be>
Message-ID: <87zi0074sa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> "All devices marked as ``swap'' in /etc/fstab are made available,
 >> except for those with the ``noauto'' option. Devices that are
 >> already being used as swap are silently skipped."

 >  So bottom line: it would make sense to add a swapon -a to the default inittabs
 > (both busybox and sysv).

Don't we then end up with an ugly error message / somewhat needlessly bloat
everyones busybox config for the (very common) situation where swap is
not used and disabled in the kernel?

-- 
Bye, Peter Korsgaard
