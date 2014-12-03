From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Wed, 3 Dec 2014 15:10:27 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-12-02
In-Reply-To: <20141203073017.2AC17100ADA@stock.ovh.net>
References: <20141203073017.2AC17100ADA@stock.ovh.net>
Message-ID: <20141203151027.696ae024@nserafini-N550JK>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wed, 3 Dec 2014 08:30:16 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Build statistics for 2014-12-02
> bfin | exiv2-0.24 |NOK|http://autobuild.buildroot.net/results/09d9b525eeee458247e10a7948070c00bbabb964/

I have reproduced this error that is created by the inclusion of
"link.h" in src/version.cpp line 119.

Perhaps there is a problem in the toolchain too because the error comes
from another included file in "link.h" but for the package it seems that
without this inclusion the build work fine on the bfin arch and on ARM
arch with linaro 2014.09.

I have opened an issue on exiv2 project and I'm waiting for a response.
http://dev.exiv2.org/issues/1007


Regards,
Nicolas

-- 
Nicolas Serafini
R&D Embedded Software Engineer

www.sensefly.com
Route de Gen?ve 38
1033 Cheseaux-Lausanne
Switzerland
