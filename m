From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 19:28:51 +0100
Subject: [Buildroot] [PATCH/next 30/31] package/vsxu: new package
In-Reply-To: <lfkrqcxc1s.ln2@ID-313208.user.individual.net>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
 <1456006176-21308-31-git-send-email-bernd.kuhls@t-online.de>
 <20160305161552.36cc6677@free-electrons.com>
 <lfkrqcxc1s.ln2@ID-313208.user.individual.net>
Message-ID: <20160305192851.4dbeab22@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 05 Mar 2016 19:17:57 +0100, Bernd Kuhls wrote:

> > COPYING.LESSER is actually the text of LGPLv3, so are you sure it's
> > under LGPLv2.1+ ?
> 
> yes, searching for "version 3 " found only artiste/src/artiste_main.cpp, 
> the rest of the LGPL-licensed files contain
> 
> * it under the terms of the GNU Lesser General Public License as
> * published by the Free Software Foundation; either version 2 of the
> * License, or
> 
> Quoting https://github.com/vovoid/vsxu/blob/glfw3/COPYING
> "All code (C and C++) is released under the GNU GPL 3.0 as included in
> this document unless explicitly released as LGPL 3.0 (check source 
> files)."
> 
> This is indeed misleading because I found only file referencing GPLv3+, 
> the rest contains

> 
> * it under the terms of the GNU General Public License as published by
> * the Free Software Foundation; either version 2 of the License, or

It is indeed very misleading.

> so I changed to VSXU_LICENSE to
> 
> VSXU_LICENSE = GPLv3+ (artiste/src/artiste_main.cpp), GPLv2+, LGPLv2+
> 
> and hope its ok.

In addition to this, could you:

 1/ Add a comment in the .mk file that indicates that things are a bit
    misleading (i.e that COPYING/COPYING.LESSER contain the v3 of the
    license text, but the source code points to the v2, except one
    file). Basically summarize what you said in this e-mail.

 2/ Report the problem upstream by filling a Github issue.

> > Also, it would be good if you could specify which parts of the software
> > are under GPLv3, which parts are under LGPLv3. Of course, it's this is
> > reasonably possible.
> 
> This will be difficult ;)
> 
> $ grep -r "(LGPL)" * | wc -l
> 267
> $ grep -r "(GPL)" * | wc -l
> 209

Yeah, ok, so don't do it :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
