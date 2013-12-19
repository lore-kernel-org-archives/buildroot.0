From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Dec 2013 18:16:16 +0100
Subject: [Buildroot] [PATCH 1/1] ktap: update to v0.4
In-Reply-To: <1387393023-16782-1-git-send-email-anders@chargestorm.se>
References: <1387393023-16782-1-git-send-email-anders@chargestorm.se>
Message-ID: <52B329E0.8040507@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/12/13 19:57, Anders Darander wrote:
> Add a check for BR2_PACKAGE_ELFUTILS; if this is enabled, then try to link against
> libelf from the elfutils package. This allows ktap to resolve symbols in userspace.
>
> The new FFI functionality in ktap is not exposed, as it currently only supports
> x86_64...
>
> Signed-off-by: Anders Darander<anders@chargestorm.se>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>   package/ktap/Config.in                             |  3 +++
>   ...p-0001-interpreter-vm.c-include-uaccess.h.patch | 27 ---------------------
>   package/ktap/ktap-0002-Set-PWD-in-Makefile.patch   | 28 ----------------------
>   package/ktap/ktap.mk                               | 10 ++++++--
>   4 files changed, 11 insertions(+), 57 deletions(-)
>   delete mode 100644 package/ktap/ktap-0001-interpreter-vm.c-include-uaccess.h.patch
>   delete mode 100644 package/ktap/ktap-0002-Set-PWD-in-Makefile.patch

  When patches can be removed, it's better to mention this explicitly in 
the commit message. But that shouldn't stop this patch to be applied.

  Regards,
  Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
