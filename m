From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 18 Sep 2013 20:13:57 +0200
Subject: [Buildroot] [PATCH 1/1] package: udev is now provided by
	systemd or eudev.
In-Reply-To: <20130918193907.789b09dd@skate>
References: <1378476068-25300-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20130917071737.4af20d60@skate> <20130917125352.GB13723@pc-eric>
 <20130917204539.7c788c2b@skate> <52394FAB.30109@mind.be>
 <20130918175838.32d9763a@skate> <5239CF75.2050807@mind.be>
 <20130918184118.3794c883@skate> <60DD971516BF4BC19E62266390C4237A@JohanW7>
 <20130918193907.789b09dd@skate>
Message-ID: <15BB1FF32FF041E7981E6B3ACEA99980@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi Thomas ,

Okay, my reply just crossed your answer...
Yes I was using the internal toolchain with uClibc 0.9.33.2

I will give it another try when systemd rework is finished.

Regards Johan

-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Thomas Petazzoni
Verzonden: woensdag 18 september 2013 19:39
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] [PATCH 1/1] package: udev is now provided by systemd or eudev.

Dear Sagaert Johan,

On Wed, 18 Sep 2013 19:34:20 +0200, Sagaert Johan wrote:

> Just out of curiosity I tried to build using systemd :
> 
> I think it will need a patch :
> src/macro.h:39:19: error: static declaration of 'execvpe' follows 
> non-static declaration

Which toolchain are you using? Our internal uClibc toolchain has a patch to add execvpe().

That said, I am not sure packages should make the assumption that
execvpe() is available, because it means that we won't support any external uClibc toolchain.

Also, Johan, systemd 44 is precisely going to be updated significantly by the patch set you are replying.

Best regards,

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux development, consulting, training and support.
http://free-electrons.com
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
