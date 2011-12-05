From: Will Wagner <will_wagner@carallon.com>
Date: Mon, 05 Dec 2011 18:15:47 +0000
Subject: [Buildroot] Patches to uClibc when using ct-ng backend in buildroot
Message-ID: <4EDD0A53.4060008@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I am using ct-ng to build a toolchain within buildroot which I've got 
working fine.

However the uClibc library has different patches applied compared to an 
internal buildroot toolchain. In particular the patches I am interested 
in are:
toolchain/uClibc/uClibc-0.9.32-fix-daylight-saving-time-handling.patch
toolchain/uClibc/uClibc-0.9.32-linuxthreads-errno-fix.patch

I have hacked in changes to package\crosstool-ng\crosstool-ng.mk to make 
them be applied, however I don't think this is a sensible long term 
solution.

Presumably the daylight savings patch could get added to ct-ng for the 
next release as it has been accepted upstream. However the other one is 
rejected upstream and I believe ct-ng doesn't want to carry it. There 
are also a number of other patches in buildroot that are not in ct-ng.

Going forward what is the best thing to do here? If there is any easy 
solution people would be happy with I'll work on a patch.

Thanks
Will
-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
