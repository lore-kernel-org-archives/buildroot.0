From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 23:33:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/libseccomp: needs headers >=
 3.12
In-Reply-To: <20150331171143.GQ12479@tarshish>
References: <1427819637-2471-1-git-send-email-bernd.kuhls@t-online.de>
 <20150331165723.GP12479@tarshish>
 <XnsA46EC1420D725berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20150331171143.GQ12479@tarshish>
Message-ID: <20150331233339.437d96f8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 31 Mar 2015 20:11:43 +0300, Baruch Siach wrote:

> Now I see. It is kernel commit 909e3ee41 that adds both EM_ARM and EM_AARCH64 
> to a generic header. In this case maybe patching the code is preferable. 
> Something like:
> 
> #ifndef EM_ARM
> #define EM_ARM 40
> #endif
> 
> #ifndef EM_AARCH64
> #define EM_AARCH64 183
> #endif
> 
> Something like that should be acceptable upstream.

Agreed, this would allow to remove the dependency of libseccomp on >=
3.12. Though I personally don't mind that much, since libseccomp does
not have any reverse dependencies, except systemd (for which it is an
optional dependency), and systemd itself already depends on having a
fairly recent set of kernel headers.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
