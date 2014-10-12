From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Oct 2014 20:20:46 +0200
Subject: [Buildroot] [PATCH 6/8] package/tvheadend: Enable bundled build
References: <1413137610-21887-1-git-send-email-bernd.kuhls@t-online.de>
 <1413137610-21887-6-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <XnsA3C4CEF943036berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd Kuhls <bernd.kuhls@t-online.de> wrote in 
news:1413137610-21887-6-git-send-email-bernd.kuhls at t-online.de:

> Having host-python alone as dependency is not enough, we need to add
> --enable-bundle to enable this functionality.

Hi,

the alternative is to remove host-python as a dependency and built  
/usr/bin/tvheadend without its bundled webinterface, this will reduce build 
time.

/usr/share/tvheadend, this is where the unbundled webinterface files are 
stored, takes ~8 MB on the target, the bundled binary is ~3 MB bigger due to 
the use of the Python gzip module when bundling the web files.

I leave this up for discussion ;)

Regards, Bernd
