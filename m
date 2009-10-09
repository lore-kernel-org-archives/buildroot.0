From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2009 12:00:35 +0200
Subject: [Buildroot] [PATCH 13/14] enable config.cache per default
In-Reply-To: <871vlekjie.fsf@macbook.be.48ers.dk>
References: <cover.1254945750.git.rep.dot.nop@gmail.com>
	<a576ef52cd1f156525fd2d327f1e7da466257be2.1254945750.git.rep.dot.nop@gmail.com>
	<df7563b3e1a87daa6f42ade2c505fecc014aa2a2.1254945750.git.rep.dot.nop@gmail.com>
	<382fdbb8e5e36dd9348dfd57b9267862ef8d2ead.1254945750.git.rep.dot.nop@gmail.com>
	<53e08690da5a307328d4d5dc7d53865215ced09f.1254945750.git.rep.dot.nop@gmail.com>
	<b01a751a32bbd1ac0bb43898ed65a6c7afd9e0c7.1254945750.git.rep.dot.nop@gmail.com>
	<ec988dfe40afe8381a2263eeaae1bd2f8ffd9014.1254945750.git.rep.dot.nop@gmail.com>
	<f77d7f5dd82b8b3945e77fd9351619fa260cff98.1254945750.git.rep.dot.nop@gmail.com>
	<d97ecb658b37edf74a168fa361436b5be821395c.1254945750.git.rep.dot.nop@gmail.com>
	<730af4752b8da4a9b2a2b1583987899fa3eef334.1254945750.git.rep.dot.nop@gmail.com>
	<cover.1254945750.git.rep.dot.nop@gmail.com>
	<78b8984e033470578a90d58e533aa97c31af1071.1254945750.git.rep.dot.nop@gmail.com>
	<871vlekjie.fsf@macbook.be.48ers.dk>
Message-ID: <20091009120035.0382fa34@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 07 Oct 2009 22:59:37 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

>  Bernhard>   It speeds up configuration considerably.
>  Bernhard>   If a package breaks due to wrong cache-entries, then the
>  Bernhard> broken other package has to be fixed, not the innocent
>  Bernhard> bystander!
> 
>  Bernhard>   Put short: There is absolutely _no_ need to ever turn
>  Bernhard> the cache off unless you hack on autotools itself and goof.
> 
> In that case, why do we even have the config option?

Originally, because when the change was introduced, some packages were
failing due to incorrect dependencies. And the contributor didn't want
to break many packages at once and preferred to have a intermediate
step where this is an option.

I think we can now get rid of the option. Or introduce some kind of
?Buildroot Hacking? menu/submenu where we put this kind of very
advanced options that normal users shouldn't use, but that can be
helpful for debugging. And when doing support, we could also ask users
to enable the option that disables the cache to see if it fixes a
reported failure.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
