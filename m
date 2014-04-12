From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Apr 2014 18:42:22 +0200
Subject: [Buildroot] [PATCH 1/1] xbmc: Depend on host-gettext
In-Reply-To: <1397319021-20282-1-git-send-email-bernd.kuhls@t-online.de>
References: <1397319021-20282-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140412184222.6406c780@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 12 Apr 2014 18:10:21 +0200, Bernd Kuhls wrote:
> Fixes autoreconf error:
> 
> autoreconf -vif lib/cpluff
> autoreconf: Entering directory `lib/cpluff'
> autoreconf: running: autopoint --force
> Can't exec "autopoint": Datei oder Verzeichnis nicht gefunden at /home/br2/buildroot/output/host/usr/share/autoconf/Autom4te/FileUtils.pm line 345.
> autoreconf: failed to run autopoint: No such file or directory
> autoreconf: autopoint is needed because this package uses Gettext
> make[1]: *** [lib/cpluff/configure] Error 1

Why is XBMC autoreconf'ed ? It does not have XBMC_AUTORECONF = YES, so
it should normally not be autoreconfed.

If it needs to be be autoreconf'ed, then XBMC_AUTORECONF = YES should
be used, which passes AUTOPOINT = /bin/true to autoreconf to avoid the
problem you're having.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
