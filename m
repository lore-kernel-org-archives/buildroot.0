From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Apr 2015 14:09:42 +0200
Subject: [Buildroot] [RFC] Move host-pkgconf dependency to
 package/pkg-autotools.mk
In-Reply-To: <XnsA47882F7852FCberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <XnsA4787599FCF1BberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <XnsA47882F7852FCberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20150410140942.2c3fb3b6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 10 Apr 2015 12:52:29 +0200, Bernd Kuhls wrote:

> and we have ~30 generic packages also depending on host-pkgconf. What about 
> adding the host-pkgconf dependency to package/pkg-generic.mk instead?

This part is clearly a no-go for me: we also have ~300 hundred generic
packages, and only 10% of them need host-pkgconf. So adding
host-pkgconf as a mandatory dependency that is in fact useless for 90%
of the packages is clearly not acceptable.

We should really aim at *reducing* the dependencies and the build time,
not bringing useless dependencies into the build of packages that don't
need them.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
