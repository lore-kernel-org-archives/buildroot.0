From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 18 Sep 2013 19:34:20 +0200
Subject: [Buildroot] [PATCH 1/1] package: udev is now provided by
	systemd or eudev.
In-Reply-To: <20130918184118.3794c883@skate>
References: <1378476068-25300-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20130917071737.4af20d60@skate> <20130917125352.GB13723@pc-eric>
 <20130917204539.7c788c2b@skate> <52394FAB.30109@mind.be>
 <20130918175838.32d9763a@skate> <5239CF75.2050807@mind.be>
 <20130918184118.3794c883@skate>
Message-ID: <60DD971516BF4BC19E62266390C4237A@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

Just out of curiosity I tried to build using systemd :

I think it will need a patch :
src/macro.h:39:19: error: static declaration of 'execvpe' follows non-static declaration


>>> systemd 44 Building
PATH="/home/buildroot12git/output/host/bin:/home/buildroot12git/output/host/usr/bin:/home/buildroot12git/output/host/usr/sbin/:/usr/
local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/buildroot12git/output/host/usr/bin"
PERLLIB="/home/buildroot12git/output/host/usr/lib/perl"  /usr/bin/make -j5 LIBS=-lrt LDFLAGS+=-ldl -C
/home/buildroot12git/output/build/systemd-44/
make[1]: Entering directory `/home/buildroot12git/output/build/systemd-44'
/usr/bin/make  all-recursive
make[2]: Entering directory `/home/buildroot12git/output/build/systemd-44'
Making all in po
make[3]: Entering directory `/home/buildroot12git/output/build/systemd-44/po'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/buildroot12git/output/build/systemd-44/po'
make[3]: Entering directory `/home/buildroot12git/output/build/systemd-44'
  CC     src/libsystemd_login_la-cgroup-util.lo
  CC     src/libsystemd_core_la-unit.lo
  CC     src/libsystemd_core_la-job.lo
  CC     src/libsystemd_core_la-manager.lo
  CC     src/libsystemd_core_la-path-lookup.lo
In file included from src/util.h:38:0,
                 from src/def.h:25,
                 from src/cgroup-util.h:30,
                 from src/cgroup-util.c:32:
src/macro.h:39:19: error: static declaration of 'execvpe' follows non-static declaration
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/unistd.h:553:12: note: previous
declaration of 'execvpe' was here
make[3]: *** [src/libsystemd_login_la-cgroup-util.lo] Error 1
make[3]: *** Waiting for unfinished jobs....

Regards, Johan

-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Thomas Petazzoni
Verzonden: woensdag 18 september 2013 18:41
Aan: Arnout Vandecappelle
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] [PATCH 1/1] package: udev is now provided by systemd or eudev.

Dear Arnout Vandecappelle,

On Wed, 18 Sep 2013 18:06:13 +0200, Arnout Vandecappelle wrote:

> > I already suggested that the selection of eudev vs. systemd should 
> > not be in Target Packages, and Eric already made a proposal to solve 
> > this. In fact, we don't need any new configuration option:
> > when the systemd init system is selected, then systemd is used.
> > When another init systemd is used, but the selected /dev management 
> > method is udev, then we use eudev.
> >
> > There's no need for more options. The only thing that Eric proposed 
> > is to re-order the Init System selection vs. the /dev management 
> > selection to make things a bit more logical.
> 
>   For systemd, journal compression and journal gateway still have to 
> be selectable. IMHO it is not nice for the user to have to navigate to 
> a completely unrelated place in order to enable those. So my 
> suggestion is to include the Config.in that has these extra options 
> immediately below the systemd selection in the system menu.

Hum, right. Probably makes sense, yes.

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux development, consulting, training and support.
http://free-electrons.com
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
