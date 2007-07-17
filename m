From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 17 Jul 2007 03:04:30 +0200
Subject: [Buildroot] Purpose of 'package/customize'.
In-Reply-To: <469C0837.4040608@realitydiluted.com>
References: <469C0837.4040608@realitydiluted.com>
Message-ID: <1184634270.18357.43.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2007-07-16 klockan 19:07 -0500 skrev Steven J. Hill:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> I am syncing up my multiple production buildroot environments and noticed
> that this 'customize' package was added.....why? It seems stupid considering
> that we have a 'target_skeleton' directory present in a number of BSPs in
> the 'target/devices' subdirectories. Please give a defense as to why it was
> checked in. Thanks.
> 

You should ask Eric, because he checked it in.
It has been available for a long, long time...

I only removed the error message which was generated
by copying from a non existing directory.

The main purpose for such a directory, IMHO
is to allow you to easily separate things which should be
in the mainstream buildroot and things which 
you prefer to have locally.

You are right that the contents of the customize directory
seems to replicate the target_skeleton function.
In fact it doesn't since there is nothing in package/customize/source.
This is just a placeholder and the typical user would just drag and drop
his/her own Config.in and customize.mk overwriting the current contents.

For example, a typical application in a Semiconductor company
would be to use this for testing a new MCU.
You would write test programs which exercised 
peripherals to find out how well they are working.
There is really noone interested in this S/W outside
the company, and thus it does not make sense to propagate
that to the mainstream buildroot.

Another use for this is if you are experimenting with
packages which are not yet ready to submit to mainstream.
It is easier to drag and drop the complete contents
of a directory to another directory than to edit
the package/Config.in every time.

We had a discussion 6 months ago about this,
and I got a lot of positive feedback from other users.
(Bernhard didn't like it though, because he could see it
beeing misused)
Personally I do not use it (at least for now), but I can see
that such a place holder is desirable for others.


> - -Steve
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.2.2 (GNU/Linux)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
> 
> iD8DBQFGnAg3gyK5H2Ic36cRAhsNAJ98aWaM1Juu/N2UAbMm83poZsgHCQCgh6Nf
> jhpycjFrwuzL4aUlsIo3SeM=
> =7GoU
> -----END PGP SIGNATURE-----
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
