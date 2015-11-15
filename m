From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 15 Nov 2015 17:44:24 +0100
Subject: [Buildroot] [PATCH 1/6] package/axfsutils: fix Makefile
In-Reply-To: <1142395b4466f1e5ccbe593ddce1c6e792b6795a.1447449754.git.yann.morin.1998@free.fr>
References: <cover.1447449754.git.yann.morin.1998@free.fr>
 <1142395b4466f1e5ccbe593ddce1c6e792b6795a.1447449754.git.yann.morin.1998@free.fr>
Message-ID: <5648B668.8000903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13-11-15 22:48, Yann E. MORIN wrote:
> mkfs.axfs uses zlib, but does not have an rpath to our host dir.
> 
> That's because:
>   - we're not passing our host CFLAGS or LDFLAGS
>   - it is forcibly setting CFLAGS in the Makefile, overriding anything
>     specified by the user
>   - it is not using LDFLAGS at all
> 
> Add two patches so that CFLAGS and LDFLAGS from the environment are
> used if present.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 (verified with ldd)

 Probably difficult to upstream this.

 Regards,
 Arnout


> ---
>  package/axfsutils/0001-fix-cflags.patch  | 19 +++++++++++++++++++
>  package/axfsutils/0002-use-ldflags.patch | 20 ++++++++++++++++++++
>  package/axfsutils/axfsutils.mk           |  2 +-
>  3 files changed, 40 insertions(+), 1 deletion(-)
>  create mode 100644 package/axfsutils/0001-fix-cflags.patch
>  create mode 100644 package/axfsutils/0002-use-ldflags.patch
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
