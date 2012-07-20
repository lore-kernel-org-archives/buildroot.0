From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 11:10:58 +0200
Subject: [Buildroot] [PATCH] avahi: only install
 default.script/S05avahi-setup.sh if not present in fs skeleton
In-Reply-To: <87r4s6u7wq.fsf@macbook.be.48ers.dk>
References: <1341980076-28347-1-git-send-email-danomimanchego123@gmail.com>
 <20120717234535.6ae0b109@skate>
 <CANxTyt4p2hR7StT27=SXN40KcYY4L-oBVfZ5V=dOYKLuY7GTfw@mail.gmail.com>
 <20120720100219.0317a30e@skate>
 <87r4s6u7wq.fsf@macbook.be.48ers.dk>
Message-ID: <20120720111058.7d61e9cf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Le Fri, 20 Jul 2012 10:57:25 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

>  Thomas> Well, I think the whole idea of testing whether a
>  Thomas> configuration file has already been copied or not to the
>  Thomas> target filesystem to avoid overwriting files from the
>  Thomas> skeleton is not nice (I think using the post-build script to
>  Thomas> overwrite configuration files is a much better idea), but I
>  Thomas> know Peter wants this to work.
> 
> I don't really feel that strongly about it.

Ok, but either we support it, and we support it completely, or we don't
support it and we remove all those conditional file installations (by
making them unconditional).

>  Thomas> The parts around avahi-autoipd are obviously here for a
>  Thomas> reason, but why does it need to test for ip= and nfsroot= in
>  Thomas> the kernel command line in Avahi case and not in Busybox
>  Thomas> case?
> 
>  Thomas> One possibility would be to simply put the Avahi variant of
>  Thomas> the script into the Busybox package. When Avahi is not
>  Thomas> installed, the avahi-autoipd tests would simply ensure that
>  Thomas> the script does not try to use Avahi.
> 
> That was my thought exactly. I had a quick look at it just before I
> got ill, but then forgot about it.

Ok, thanks for your input!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
