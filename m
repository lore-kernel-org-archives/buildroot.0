From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Mar 2012 16:57:31 +0100
Subject: [Buildroot] [PATCH 1/3] intltool: no business defining PERLLIB
In-Reply-To: <d393625cf8a0f0af32c086413b19b091@zacarias.com.ar>
References: <1331517531-2291-1-git-send-email-gustavo@zacarias.com.ar>
 <1331517531-2291-2-git-send-email-gustavo@zacarias.com.ar>
 <20120319163011.27d669d2@skate>
 <d393625cf8a0f0af32c086413b19b091@zacarias.com.ar>
Message-ID: <20120319165731.4d3374cd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 19 Mar 2012 12:52:04 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> Reverted? It was never applied.

Sorry, my bad, I thought it had been applied and was the reason of the
failure. I will investigate what is causing this new breakage.

> We've already discussed this on IRC and i stand on my position about 
> it.
> A cold host-microperl build takes roughly 2 minutes on my quite mundane 
> desktop with it's slow hard drive.
> So please someone else(s) fix it as they see fit, i'm not submitting 
> anything else perl-related.
> Future-proof doesn't seem to be the rule which is what i aimed at so 
> i'll just quit doing anything perl-related which was mostly as a favour 
> since i don't use it even though i code in perl for other purposes.

Gustavo, your work on Perl is really appreciated, but I think it's also
fair to have a discussion on the pros and cons of various changes.

I am completely in favor of a solution where host-microperl gets built
when microperl for the target is selected since as you say, it is the
only solution to reliably build XS Perl modules for the target.

However, I wanted us to *investigate* the potential solutions to build
host-microperl *only* when microperl for the target is selected, and
not when we need a simple random utility such as intltool running on
the host.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
