From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Tue, 04 Dec 2012 13:35:48 +0100
Subject: [Buildroot] xapp_init: bad substitution of mcookie path in startx
Message-ID: <50BDEE24.6010601@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

The generated "startx" has the host path for mcookie:



----------
    esac

     authdisplay=${display:-:0}

 
mcookie=`/nous/BASYSTEMES/Buildroot/output.imx6neon/host/usr/bin/mcookie`



     if test x"$mcookie" = x; then

--------------------------


... and because of that, the X server does not start on target.

It should be "/usr/bin/mcookie"



Regards
Thierry
