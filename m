From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 26 Jun 2013 17:26:30 +0200
Subject: [Buildroot] [PATCH] libunwind:  new pacakge
In-Reply-To: <20130625235022.75b13738@skate>
References: <F9C551623D2CBB4C9488801D14F864C639A6F946@ex-mb1.corp.adtran.com>
 <20130625235022.75b13738@skate>
Message-ID: <1372260390.2822.5.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

as we are also using libunwind with buildroot, perhaps I can add some of
our experiences with it...

Plain libunwind-1.1 won't compile on uClibc x86 as it uses setcontext().
This function is not available in uClibc (at least not in the released
versions). I have worked around this by commenting out some code in
libunwind (see attached patch), but this is probably not a good
solution.

I've also had a build failure at some point in the tests because there
is code that includes execinfo.h unconditionally.

I've attached the patches that we are using with libunwind. Perhaps they
can be useful for you.


Regards,
Sven


-------------- next part --------------
A non-text attachment was scrubbed...
Name: libunwind-001-disable-code-that-doesn-t-compile-with-uCLibc.patch
Type: text/x-patch
Size: 921 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130626/1a6ad7d3/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: libunwind-002-tests-don-t-include-execinfo.h-unconditionally.patch
Type: text/x-patch
Size: 1192 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130626/1a6ad7d3/attachment-0001.bin>
