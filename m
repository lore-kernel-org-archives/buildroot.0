From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jan 2012 16:36:30 +0100
Subject: [Buildroot] Buildroot Developer Day, Friday 3rd February,
 Brussels
In-Reply-To: <4F22C372.20908@visionsystems.de>
References: <20120124000812.6d043023@skate>
 <CAAXf6LW6aCs-G_FD=pXNGsBrV3133donzNxsuNV_7O=9JMCs4Q@mail.gmail.com>
 <201201271133.20517.arnout@mind.be> <20120127125805.580febd8@skate>
 <87sjj1jhhw.fsf@macbook.be.48ers.dk>
 <20120127162722.7c227e2f@skate> <4F22C372.20908@visionsystems.de>
Message-ID: <20120127163630.5d604b7d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 27 Jan 2012 16:32:02 +0100,
Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :

> That's where such tools as gerrit and build server come in play,
> cause they perform automatic integration build and let you know if
> patch is broken or breaks something.

Unfortunately, it doesn't work this way with Buildroot. There is no
such thing as "the build works" or "the build doesn't work" as in a
regular software. Depending on what the patch modifies, a different set
of configuration options needs to be set in order to test that the patch
actually works. With regular software, you can easily test build a few
configuration options (debug vs. release mode, support of this or
support of that), but Buildroot has millions of different possibles
combinations, which your build server cannot test within a reasonable
time. So only an human being can decide "Hmm, for this patch, I will
try out this config and this config and this config, because those
configs are the one that will make actual use of the patch".

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
