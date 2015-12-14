From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Dec 2015 14:03:30 +0100
Subject: [Buildroot] [PATCH] python-pyxml: add a patch to fix syntax
 errors
In-Reply-To: <1450094225-4625-1-git-send-email-yegorslists@googlemail.com>
References: <1450094225-4625-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20151214140330.2904ec0b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor, Clayton,

On Mon, 14 Dec 2015 12:57:05 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Patch renames variable 'as' to 'pas' to avoid reserved keyword usage.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

I was surprised that issue was not fixed upstream, so I looked a bit.
It has been reported upstream in June this year:

  https://mail.python.org/pipermail/xml-sig/2015-June/012271.html

But the answer at
https://mail.python.org/pipermail/xml-sig/2015-June/012272.html was
pretty clear:

   PyXML is bitrotten and obsolete. You'll find the functionality it
   previously provided is now included in the Python standard library;

And later in the thread:

   PyXML has been largely obsolete since around Python 2.1 (circa 2001).
   The last PyXML release was in 2004, and the project page very
   specifically advertises it as unmaintained, out of date, do not use.
   Specifically, the "as" keyword has been reserved since Python 2.5
   (roughly 10 years ago), which is only one of many things which could
   cause such an old package to no longer function.

So, the big question is: Clayton, why did you submit the pyxml package
for addition in Buildroot ? It is not used as a dependency in any other
package as far as I can see, and it is an obsolete and deprecated XML
library, since more than 10 years.

Can we get rid of it from Buildroot ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
