From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Aug 2016 23:59:32 +0200
Subject: [Buildroot] [PATCH 0/8] musl: add compatibility cdefs.h header
 (branch yem/cdefs)
In-Reply-To: <cover.1471033837.git.yann.morin.1998@free.fr>
References: <cover.1471033837.git.yann.morin.1998@free.fr>
Message-ID: <064c4381-b4b1-f875-70fd-b356c7029b1a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12-08-16 22:49, Yann E. MORIN wrote:
> Hello All!
> 
> This series is an ateempt at quiescing, once and for all, all the build
> failures under musl, due to missing non-standard header cdefs.h.
[snip]
> Fixing all those bodies of code is nigh impossible, so instead we
> provide a strictly-minimal sys/cdefs.h, that defines only the three
> strictly-required macros:
> 
>   - __P() to declare function prototypes;
>   - __BEGIN_DECLS and __END_DECLS to enclose C declarations.
> 
> When (if!) more are needed, they can be added later.
> 
> The basic idea was suggested by Thomas P. on IRC. Thanks! :-)
> 
> This then allows us to drop quite a few patches that were removing use
> of cdefs.h. However, including sys/cdefs.h has been added to two
> packages that were relying on other glibc headers to include it.
>

 I had some minor comments on the first patch, all others have my Reviewed-by.
However, you missed two patches:

package/atftp/0002-argz.h-fix-musl-compile-add-missing-defines.patch

-> This one shows that __THROW and __attribute_pure__ may be needed as well.

package/attr/0002-avoid-glibc-specific-decls-defines.patch

-> Although it's probably better to keep it as is, otherwise an include cdefs.h
would have to be added.


 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
