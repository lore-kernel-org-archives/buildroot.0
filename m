From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 25 Jun 2010 10:29:01 +0000 (UTC)
Subject: [Buildroot] [Bug 1399] xfont_font-adobe-100dpi does not build
In-Reply-To: <bug-1399-163@https.bugs.busybox.net/>
References: <bug-1399-163@https.bugs.busybox.net/>
Message-ID: <20100625102901.2D3C1818F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1399

Mitch Davis <mjd-busybox.net@afork.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mjd-busybox.net at afork.com

--- Comment #16 from Mitch Davis <mjd-busybox.net@afork.com>  ---
>   GEN    courB08-ISO8859-1.bdf
> /bin/sh: courB08.bdf: command not found
> make[1]: *** [courB08-ISO8859-1.bdf] Error 127
> make[1]: *** Waiting for unfinished jobs....
>   GEN    courB10-ISO8859-1.bdf
>   GEN    courB12-ISO8859-1.bdf
> /bin/sh: courB10.bdf: command not found
> /bin/sh: courB12.bdf: command not found
> make[1]: *** [courB10-ISO8859-1.bdf] Error 127
> make[1]: *** [courB12-ISO8859-1.bdf] Error 127

I know I'm coming late to the party here, but it seems to me from the make
listing that the problem isn't that bdftopcf can't be found, but rather that
the command is missing the name of the command altogether, therefore the shell
is treating the name of the .bdf file as the command to run.

Paul Jones, if the problem occurs again, can you add V=1 to the make line when
you kick off the compile?  That should show us the line being executed, rather
than just "GEN".

Alternatively, please look in output/build/xfont_font-adobe-100dpi-1.0.1 (or
similar, as I don't have it in front of me) for the Makefile.  In the Makefile,
what is the value of the BDFTOPCF variable?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
