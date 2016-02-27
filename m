From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2016 22:47:44 +0100
Subject: [Buildroot] Loading modules with device tree after rootfs is
	mounted
In-Reply-To: <56D20B21.70306@mind.be> (Arnout Vandecappelle's message of "Sat, 
 27 Feb 2016 21:46:25 +0100")
References: <CANqk_c9oEnF32aeNnPzki0vr1E4-s-xxGyC5+dHAwAw6rHkLAg@mail.gmail.com>
 <56AE904B.2030906@mind.be> <87wppqsbfo.fsf@dell.be.48ers.dk>
 <56D191E9.3050604@mind.be> <87h9gurq7t.fsf@dell.be.48ers.dk>
 <56D20B21.70306@mind.be>
Message-ID: <8760x9su4f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> This was cut'n'paste from:
 >> 
 >> http://lists.busybox.net/pipermail/busybox/2014-September/081780.html
 >> 
 >> Replacing the 'sort -u' with cat would also work. I'm not sure exactly
 >> what the pros/cons of using sort -u is.

 >  It removes duplicates from the list.

Yes, that I get. My question is more about if duplicates can ever occur
/ how likely it is that duplicates are present / what is the problem
about duplicates?

I would think that duplicates are sufficiently rare that the
(potentially) extra modprobe calls vs extra overhead of sort vs cat is
probably down in the noise, but we can certainly keep the sort (it does
mean that we depend on another busybox applet though).

 >> As that message states, we also need to make sure that we have a
 >> modprobe understanding the aliases (so not the MODPROBE_SMALL busybox
 >> variant).

 >  I think in our system scripts we are allowed to rely on the things that
 > are enabled in our default busybox config. So that should be OK.

Yes, or we can force the options on, like we do for other things in
busybox.

-- 
Venlig hilsen,
Peter Korsgaard 
