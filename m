From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 10 Apr 2015 11:33:39 +0200
Subject: [Buildroot] [RFC] Move host-pkgconf dependency to
	package/pkg-autotools.mk
Message-ID: <XnsA4787599FCF1BberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

is there a reason an autotools-package should not depend on host-pkgconf?

The phrase "host-pkgconf" appears in > 300 packages

$ for i in `find -iname *.mk | grep -v pkgconf`; do grep host-pkgconf $i; 
done | wc -l
313

If 

$(2)_DEPENDENCIES += host-pkgconf

is added to package/pkg-autotools.mk we could get rid of all those 
dependencies in the packages and avoid nasty build errors in the future.

Regards, Bernd
