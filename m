From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 6 Apr 2010 18:19:31 +0000 (UTC)
Subject: [Buildroot] External toolchain built by buildroot no longer
	supported.
References: <hpfh61$drp$1@dough.gmane.org>
	<87y6h0r5e9.fsf@macbook.be.48ers.dk> <hpfj6c$mpa$1@dough.gmane.org>
	<201004061842.53138.yann.morin.1998@anciens.enib.fr>
Message-ID: <hpftvj$3b3$2@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-04-06, Yann E. MORIN <yann.morin.1998@anciens.enib.fr> wrote:

>>> Grant> use of of external toolchains built by buildroot is no longer
>>> Grant> possible.
>
> We've discussed the issue on IRC yesterday evening, and I'm looking
> if I can make a quick fix (something in between a proper fix and a
> nice hack), but I'm not close to that yet.

I was going try changing the --prefix that buildroot uses to configure
toolchain stuff to be consistent with the --sysroot value but...

>> AFAICT, the recent commit relies on the assumption that both --prefix
>> and --sysroot values are correct and that the "prefix" is a child of
>> "sysroot".
>
> No, the other way around: prefix is a parent of sysroot
> (directory-wise).

For some reason I always have that backwared in my head.

>> That's not the case for buildroot toolchains.  They have a prefix of
>> "/usr" and a sysroot pointing to the output/staging directory.  I'm
>
> Yes, that's because buildroot plays trick with those values. The code
> dates back June 2007, and the exact reason for doing so is not yet
> known.
>
> I'm trying to bring buildroot toolchains more in sync with a
> /standard/ way of handling paths, but I have to check regressions.
>
> Anyway, I think that 'old' toolchains build prior the change I'm
> doing will not work.

No worries.  I'll either use crosstool-NG or we can fix the way
buildroot configures toolchains.

>> guessing that setting the buildroot toolchain's --prefix value to
>> output/staging/usr should fix the problem,
>
> More complex than that, unfortunately... :-( I tried, and it does not
> work so far (a few other things to change as well, eg. binutils).

Let me know if there's anything I can do to help.

-- 
Grant Edwards               grant.b.edwards        Yow! ONE LIFE TO LIVE for
                                  at               ALL MY CHILDREN in ANOTHER
                              gmail.com            WORLD all THE DAYS OF
                                                   OUR LIVES.
