From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Sep 2013 20:47:54 +0200
Subject: [Buildroot] [PATCHv2 1/4] core: introduce the BR2_EXTERNAL
 variable
In-Reply-To: <5237F243.2040503@mind.be>
References: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1379185433-8770-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <52377889.3010402@mind.be> <20130917062645.37b34ee6@skate>
 <5237F243.2040503@mind.be>
Message-ID: <20130917204754.1579d573@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 17 Sep 2013 08:10:11 +0200, Arnout Vandecappelle wrote:

> > I mean, if an user changes the value of BR2_EXTERNAL in menuconfig, he
> > has to exit / re-run menuconfig to anyway see the updated set of
> > configuration options after the BR2_EXTERNAL value change. Does it
> > really makes sense to set in menuconfig a configuration option that by
> > itself changes the available configuration options, but which requires
> > exiting/re-runnning menuconfig?
> 
>   The primary way of setting BR2_EXTERNAL would still be through the 
> environment - in fact, the code above forces you to set it through the 
> environment the first time, otherwise the option won't be visible.
> 
> 
> >>    It doesn't really work, though, because currently the .config is
> >> not read in when doing 'make menuconfig', so that
> >> BR2_EXTERNAL_FROM_ENV will always be "". But I'm sure we'll be able
> >> to find something that works with a little more effort.
> >
> > Hum, the .config is not read when doing 'make menuconfig'? Then how can
> > 'make menuconfig' show the current state of enabled options?
> 
>   I mena that it isn't read by the Makefile.

Ok, so what do you suggest exactly? Because you proposed an
implementation, but concluded with 'it doesn't work'. So I'm a little
bit confused here :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
