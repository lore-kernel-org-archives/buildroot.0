From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Jul 2011 15:36:38 +0200
Subject: [Buildroot] [pull request] Pull request for branch
 for-2011.08/debugging-improvements
In-Reply-To: <87sjqchsbe.fsf@macbook.be.48ers.dk>
References: <cover.1310421076.git.thomas.petazzoni@free-electrons.com>
 <87sjqchsbe.fsf@macbook.be.48ers.dk>
Message-ID: <20110714153638.2143a699@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 12 Jul 2011 09:27:33 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Next to the size impact (which I agree is not a big problem) there's
> also potentially a build time impact. Did you test this?

Here is the result of a fairly big build for ARM (X.org, Gtk2, WebKit,
Midori), on a fairly big machine (quad-core, 12 GB of RAM), build was
done with BR2_JLEVEL=16, and the build does not include a toolchain (I
used an existing internal toolchain).

Without debugging symbols
=========================

 * Real time:	 		51 minutes
 * User time:			200 minutes
 * System time:	 		14 minutes
 * Size of output directory:	3.4 GB
 * Size of staging directory:	445 MB
 * Size of target directory:	102 MB

With debugging symbols
======================

 * Real time:			58 minutes
 * User time:			232 minutes
 * System time:			16 minutes
 * Size of output directory:	9.0 GB
 * Size of staging directory:	2.0 GB
 * Size of target directory:    102 MB

So, I'd say we should drop my patch 2/4.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
