From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Aug 2019 08:31:00 +0200
Subject: [Buildroot] Buildroot roseapplepi_defconfig no longer builds
In-Reply-To: <20190810104253.3b84a961@windsurf.home> (Thomas Petazzoni's
 message of "Sat, 10 Aug 2019 10:42:53 +0200")
References: <20190810104253.3b84a961@windsurf.home>
Message-ID: <8736i4mf6j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello Peter,
 > The roseapplepi_defconfig no longer builds:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/269139283

 > The build issue occurs when building the wonderful out of tree
 > display driver:

 > drivers/gpu/pvr/eurasia_km_linux/services4/srvkm/env/linux/osfunc.c: In function 'OSEventObjectCreateKM':
 > drivers/gpu/pvr/eurasia_km_linux/services4/srvkm/env/linux/osfunc.c:3051:13: error: 'strncpy' specified bound 50 equals destination size [-Werror=stringop-truncation]
 >              strncpy(psEventObject->szName, pszName, EVENTOBJNAME_MAXLENGTH);
 >              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 > I guess this is caused by our update to gcc 8.x as the default compiler.

Probably.

 > Could you have a look ?

I will take a look next week, thanks for the heads up.

-- 
Bye, Peter Korsgaard
