From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 05 Mar 2016 19:17:57 +0100
Subject: [Buildroot] [PATCH/next 30/31] package/vsxu: new package
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
 <1456006176-21308-31-git-send-email-bernd.kuhls@t-online.de>
 <20160305161552.36cc6677@free-electrons.com>
Message-ID: <lfkrqcxc1s.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sat, 05 Mar 2016 16:15:52 +0100 schrieb Thomas Petazzoni:

>> +VSXU_LICENSE = GPLv3+, LGPLv2.1+
>> +VSXU_LICENSE_FILES = COPYING COPYING.LESSER
> 
> COPYING.LESSER is actually the text of LGPLv3, so are you sure it's
> under LGPLv2.1+ ?

yes, searching for "version 3 " found only artiste/src/artiste_main.cpp, 
the rest of the LGPL-licensed files contain

* it under the terms of the GNU Lesser General Public License as
* published by the Free Software Foundation; either version 2 of the
* License, or

Quoting https://github.com/vovoid/vsxu/blob/glfw3/COPYING
"All code (C and C++) is released under the GNU GPL 3.0 as included in
this document unless explicitly released as LGPL 3.0 (check source 
files)."

This is indeed misleading because I found only file referencing GPLv3+, 
the rest contains

* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or

so I changed to VSXU_LICENSE to

VSXU_LICENSE = GPLv3+ (artiste/src/artiste_main.cpp), GPLv2+, LGPLv2+

and hope its ok.

> Also, it would be good if you could specify which parts of the software
> are under GPLv3, which parts are under LGPLv3. Of course, it's this is
> reasonably possible.

This will be difficult ;)

$ grep -r "(LGPL)" * | wc -l
267
$ grep -r "(GPL)" * | wc -l
209

Regards, Bernd
