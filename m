From: Will Moore <will.moore@beraninstruments.com>
Date: Wed, 5 May 2010 15:00:42 +0100
Subject: [Buildroot] uclibc .9.31 & usleep
In-Reply-To: <87bpcubgz5.fsf@macbook.be.48ers.dk>
References: <000c01caec58$eb209a20$6f01a8c0@apexlaptop>
	<87bpcubgz5.fsf@macbook.be.48ers.dk>
Message-ID: <A4B0064AF3644F12B61D620B9C74CDE7@AP366>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> >>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:
> 
>  Sagaert> Hi
>  Sagaert> i tried to build a rootfs with the new uclibc 0.9.31
> 
>  Sagaert> building gdb 6.7.1 failed complaining about usleep
>  Sagaert>  see also this link :
> 
>  Sagaert> http://old.nabble.com/Problems-with-i686_defconfig-
> td28240927.html
> 
>  Sagaert> Should i set something special in the new uclibc config ?
> 
> Yes, ensure you're using the uclibc 0.9.31 defconfig
> (BR2_UCLIBC_CONFIG). It's the default for new configs, but if you are
> reusing an old config it might be wrong.

I had a similar problem when I reused my buildroot 2010.02 .config for
2010.05 rc1 and just hit return to all prompts to set missing options:
building gdbserver for the target failed with undefined reference to usleep.
When I started a new buildroot .config and used menuconfig to re-enter my
settings it built OK.

> 
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
