From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Sep 2013 19:39:07 +0200
Subject: [Buildroot] [PATCH 1/1] package: udev is now provided by
 systemd or eudev.
In-Reply-To: <60DD971516BF4BC19E62266390C4237A@JohanW7>
References: <1378476068-25300-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20130917071737.4af20d60@skate> <20130917125352.GB13723@pc-eric>
 <20130917204539.7c788c2b@skate> <52394FAB.30109@mind.be>
 <20130918175838.32d9763a@skate> <5239CF75.2050807@mind.be>
 <20130918184118.3794c883@skate>
 <60DD971516BF4BC19E62266390C4237A@JohanW7>
Message-ID: <20130918193907.789b09dd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Wed, 18 Sep 2013 19:34:20 +0200, Sagaert Johan wrote:

> Just out of curiosity I tried to build using systemd :
> 
> I think it will need a patch :
> src/macro.h:39:19: error: static declaration of 'execvpe' follows non-static declaration

Which toolchain are you using? Our internal uClibc toolchain has a
patch to add execvpe().

That said, I am not sure packages should make the assumption that
execvpe() is available, because it means that we won't support any
external uClibc toolchain.

Also, Johan, systemd 44 is precisely going to be updated significantly
by the patch set you are replying.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
