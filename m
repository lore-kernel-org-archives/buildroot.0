From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 Oct 2015 22:35:43 +0200
Subject: [Buildroot] [PATCH 2/2 v2] package/nodejs: add version 4.1.2
In-Reply-To: <20151019223038.6346f115@free-electrons.com>
References: <cover.1445277033.git.yann.morin.1998@free.fr>
 <91f96e06dbe44ab711b1bb688892c31886026b59.1445277033.git.yann.morin.1998@free.fr>
 <20151019223038.6346f115@free-electrons.com>
Message-ID: <20151019203543.GD3651@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-10-19 22:30 +0200, Thomas Petazzoni spake thusly:
> On Mon, 19 Oct 2015 19:51:01 +0200, Yann E. MORIN wrote:
> > diff --git a/package/nodejs/4.1.2/0001-Remove-dependency-on-Python-bz2-module.patch b/package/nodejs/4.1.2/0001-Remove-dependency-on-Python-bz2-module.patch
> > new file mode 100644
> > index 0000000..dee8042
> > --- /dev/null
> > +++ b/package/nodejs/4.1.2/0001-Remove-dependency-on-Python-bz2-module.patch
> > @@ -0,0 +1,33 @@
> > +From 3d4817c152d6f3afddcc699949c4d1664da91e2b Mon Sep 17 00:00:00 2001
> > +From: Martin Bark <martin@barkynet.com>
> > +Date: Tue, 30 Jun 2015 09:43:11 +0100
> > +Subject: [PATCH 1/4] Remove dependency on Python bz2 module
> > +
> > +The Python bz2 module is only needed in certain cases, so only import
> > +it when needed. In the normal nodejs build, this allows to remove the
> > +dependency on this module.
> 
> Read this...

Damn...

> > +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > +[Martin: adapt to 0.12.5]
> > +Signed-off-by: Martin Bark <martin@barkynet.com>
> > +[yann.morin.1998 at free.fr: adapt to 4.1.2]
> > +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > +---
> > + deps/v8/tools/js2c.py | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/deps/v8/tools/js2c.py b/deps/v8/tools/js2c.py
> > +index 77485f6..371caf5 100755
> > +--- a/deps/v8/tools/js2c.py
> > ++++ b/deps/v8/tools/js2c.py
> > +@@ -34,7 +34,6 @@
> > + import os, re, sys, string
> > + import optparse
> > + import jsmin
> > +-import bz2
> > + import textwrap
> > + 
> > + 
> 
> ... and compare it to the patch. You're no longer importing bz2
> anywhere. Look at the same patch for 0.10 and 0.12, it is importing the
> bz2 module, just conditionally.

ACK, I'll fix that commit log.

> We should maybe also upstream our nodejs patches... But that's a
> separate work.

I can take a shot at that...

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
