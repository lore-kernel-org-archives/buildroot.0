From: Wu, Josh <Josh.wu@atmel.com>
Date: Wed, 24 Feb 2010 12:00:12 +0100
Subject: [Buildroot]  madplay build failure
In-Reply-To: <20100224095933.77a91600@surf>
References: <99b73aa81002232342sc7823d6oda84f4e766122832@mail.gmail.com>
	<20100224095933.77a91600@surf>
Message-ID: <C83D7CE8356557448A893798C8F9931D04DEFD1D@frimb01.corp.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi, Thomas

>I've reproduced your problem with the same .config. The problem is that
>we build alsa-lib without symbol versioning (the "@ALSA_0.9" thing at
>the end of symbol names), but madplay thinks that we compiled alsa-lib
>with symbol versioning. This is probably due to the fact that the
>alsa-lib installed on the host system (x86 or x86_64) is indeed
>compiled with symbol versioning. So it's a typical case of host
>information leaking into the target build.

>However, I don't yet know how to prevent this information leakage. In
>the mean time, two possible workarounds:

> * Uninstall alsa-lib from your host. But you'll loose sound and
>   probably all your desktop :-)

> * Try to compile alsa-lib for the target without the
>   --without-versioned option.

I try the second workaround, it works well. 
Thank you very much for the solution.

So is there any way to detect the host information leaking? I mean in that way we will know host has impact in Buildroot. To avoid that same configuration file but get different build result in different host.

Thanks.
Best Regards,
Josh Wu
