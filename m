From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Aug 2016 23:34:08 +0200
Subject: [Buildroot] [PATCH 4/8] package/android-tools: drop
 musl-compatibility cdefs patching out
In-Reply-To: <bf528a01457458785591880406b964fcce771ca7.1471033837.git.yann.morin.1998@free.fr>
References: <cover.1471033837.git.yann.morin.1998@free.fr>
 <bf528a01457458785591880406b964fcce771ca7.1471033837.git.yann.morin.1998@free.fr>
Message-ID: <0cc766e7-d59b-3e2c-bf9e-abba7f6cb94b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12-08-16 22:49, Yann E. MORIN wrote:
> We now always have a sys/cdefs.h, so we no longer need to patch it out.
> 
> Simplify the patch by removing any hunk removing cdefs.h or the use of
> __BEGIN_DECLS/__END_DECLS. However, it must be included when macros it
> defines are being used.
> 
> Also, renumber patches to guarantee ordering.

 You actually changed the ordering...

0005-fix-big-endian-build.patch
0005-fix-static-link-zlib.patch

->

0005-fix-static-link-zlib.patch
0006-fix-big-endian-build.patch

so I guess the order doesn't matter.

 But anyway, after careful review of the patch-in-patch changes:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../0004-Fix-build-issue-with-musl.patch           | 181 +--------------------
>  ...build.patch => 0006-fix-big-endian-build.patch} |   0
>  .../0007-include-cdefs-h-when-needed.patch         |  41 +++++
>  3 files changed, 43 insertions(+), 179 deletions(-)
>  rename package/android-tools/{0005-fix-big-endian-build.patch => 0006-fix-big-endian-build.patch} (100%)
>  create mode 100644 package/android-tools/0007-include-cdefs-h-when-needed.patch
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
