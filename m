From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 21 Jul 2007 12:12:39 +0200
Subject: [Buildroot] Changes to buildroot for projects.
References: <46A16F40.6050303@realitydiluted.com>
Message-ID: <004a01c7cb7f$ae479380$0202a8c0@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Ulf,
> 
> I wanted to tell you how great the changes to add BSP PROJECT_DIR and the
> like have been working out. I did two product releases today and it was really
> great to be able to build both and share compiled packages between the two.
> Very well done.
> 

Yes, but it is going to need some additional work.

All packages which can be configured in different ways,
needs to be built in PROJECT_BUILD_DIR if you want
to configure them differently.
As long as you have the same configuration, BUILD_DIR is still OK.

Also, I would like to be able to easily save the current configuration
of the different ".config" files easily in a new board directory.

$ make project

or similar should create

project/config/$(PROJECT)

and store the current config for Linux, busybox, uclibc 
and the main .config file in that directory.


> - -Steve
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.2.2 (GNU/Linux)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
> 
> iD8DBQFGoW9AgyK5H2Ic36cRAl0KAJ9tjXS9J/MJBEW39iEmOYCubiHe8ACfdfeH
> woJsw654tfxEX1n3yRVRj9k=
> =6Sxa
> -----END PGP SIGNATURE-----
>



Best Regards
Ulf Samuelsson
