From: Darcy Watkins <DWatkins@tranzeo.com>
Date: Mon, 8 Mar 2010 06:49:15 -0800
Subject: [Buildroot] Patch to allow iproute2 without IPv6 requirement
In-Reply-To: <87aaul15l3.fsf@macbook.be.48ers.dk>
References: <D61182AC8012EA4EBC531B3AF23BE10992A96A@tranzeo-mail2.12stewart.tranzeo.com><1267220120.28886.99.camel@localhost.localdomain><1267473268.25711.10.camel@localhost.localdomain>
	<87aaul15l3.fsf@macbook.be.48ers.dk>
Message-ID: <D61182AC8012EA4EBC531B3AF23BE10992AA56@tranzeo-mail2.12stewart.tranzeo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

After some second thought, the "IPV6_OPT" variable I used in the patch
part to iproute2.mk should probably have an appropriate prefix prepended
to it to avoid potential for future namespace conflicts in case
something similar happens for another package.

For example use "IPROUTE2_IPV6_OPT" or something similar instead of
"IPV6_OPT".

I've also just submitted the patch to iproute2 code itself upstream.

Regards,

Darcy


-----Original Message-----
From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter
Korsgaard
Sent: Saturday, March 06, 2010 1:52 PM
To: Darcy Watkins
Cc: buildroot at busybox.net
Subject: Re: Patch to allow iproute2 without IPv6 requirement

>>>>> "Darcy" == Darcy L Watkins <dwatkins@tranzeo.com> writes:

 Darcy> Hello,
 Darcy> I noticed that when I upgraded from 2009.02 to 2010.02 I lost
iproute2
 Darcy> in my config that doesn't use IPv6.  The patch below applies to
2010.02
 Darcy> and should allow the iproute2 to build without IPv6.  It builds
OK (and
 Darcy> doesn't appear to misbehave) on my powerpc 405 platform and I am
also
 Darcy> building it to try out later today on an ARM11 platform.

 Darcy> Anyone else who wants to test drive it is welcome to do so.

Thanks, looks sane. Please submit it to iproute upstream so we don't
need to maintain this in the future.

-- 
Bye, Peter Korsgaard
