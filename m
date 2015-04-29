From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Apr 2015 09:29:34 +0200
Subject: [Buildroot] [PATCH] freerdp: fix build with uclibc snapshot and
 uclibc-ng
In-Reply-To: <XnsA48AE66F8143FberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <6282ca49ebfb65c9399eeedcac6a3d69038d2690.1430250053.git.baruch@tkos.co.il>
 <XnsA48AE66F8143FberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20150429092934.31ea503b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 28 Apr 2015 22:39:10 +0200, Bernd Kuhls wrote:

> what about adding eventfd_read() and eventfd_write() to 
> package/uclibc/0.9.33.2/? This function is needed by upcoming Kodi 15.0 
> Isengard as well and will be part[1] of my next RFC-patch series when beta1 
> of the next Kodi version will be released.

Once again, the issue with this approach is that it simply does work
for external uClibc toolchains. Such toolchains will not have all the
feature patches that Buildroot has, so packages will fail to build with
such external uClibc toolchains.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
