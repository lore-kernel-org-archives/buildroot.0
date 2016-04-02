From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Apr 2016 23:22:12 +0200
Subject: [Buildroot] [PATCH] arch/x86: remove support for i386
In-Reply-To: <1459453188-23705-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1459453188-23705-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <57003804.5000105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/31/16 21:39, Thomas Petazzoni wrote:
> The Linux kernel doesn't even support i386 anymore, there is no NPTL
> support for i386 and uClibc-ng only supports NPTL on x86, so there is
> essentially no usable thread implementation. Most likely glibc and
> musl also don't support i386 either. So it's time to remove the
> support for this architecture variant.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  However, I think there is also a line in qemu.mk that should be removed 
(describing the mapping from BR arches to qemu arches).


  Also, perhaps add a legacy entry? Even though BR2_x86_i386 is a member of a 
choice, that fact is not visible in the .config so it can be added as a normal 
bool option to the Config.in.legacy.

  Regards,
  Arnout

> ---
>   .defconfig                             | 1 -
>   arch/Config.in.x86                     | 5 -----
>   package/openssl/openssl.mk             | 5 -----
>   package/uclibc/Config.in               | 3 +--
>   toolchain/toolchain-common.in          | 3 ---
>   toolchain/toolchain-external/Config.in | 3 +--
>   6 files changed, 2 insertions(+), 18 deletions(-)
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
