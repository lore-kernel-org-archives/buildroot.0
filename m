From: Andrew E. Mileski <andrewm@isoar.ca>
Date: Mon, 02 Oct 2006 17:18:03 -0400
Subject: [Buildroot] Wrong pathnames in libtool and pkgconfig files
Message-ID: <4521820B.8010008@isoar.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm repeatedly having problems with pathnames in *.la and *.pc files,
since packages are built for / but installed in $(STAGING_DIR).  This
breaks packages that rely on these files being accurate.

So far I've resorted to sed'in them, which mostly works:
    sed -i filename -e 's#/usr#$(STAGING_DIR)/usr#g'
but is sure to cause problems if not prevented from being repeated.

This effects all packages built using libtool and pkgconfig.

Is there a more correct way to handle this?

-- 
Andrew E. Mileski
