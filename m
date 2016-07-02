From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Jul 2016 22:21:55 +0200
Subject: [Buildroot] [RFC 3/3] infra: remove auto derivation of host
	dependencies
In-Reply-To: <1467485315-28264-4-git-send-email-julien.floret@6wind.com>
References: <1467485315-28264-1-git-send-email-julien.floret@6wind.com>
 <1467485315-28264-4-git-send-email-julien.floret@6wind.com>
Message-ID: <21f74c41-faf8-233d-1965-03919afdb374@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02-07-16 20:48, Julien Floret wrote:
> This feature consists in automatically deducing dependencies of host
> variant of a package from the dependencies of the target variant.
> 
> However, it causes some issues, and many host packages need different
> dependencies than their target variants.
> 
> Now that host dependencies are explicitly set for all packages, we can
> remove it.
> 
> Signed-off-by: Julien Floret <julien.floret@6wind.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  package/pkg-autotools.mk |  9 ---------
>  package/pkg-cmake.mk     |  7 -------
>  package/pkg-generic.mk   |  4 ----
>  package/pkg-python.mk    | 15 ---------------
>  package/pkg-rebar.mk     | 14 --------------
>  package/pkg-virtual.mk   |  7 -------
>  6 files changed, 56 deletions(-)

 Wow, so removing this antifeature deletes about the same number of lines as
have to be added to explicitly specify the dependencies...

 Another thing that has to be done is to remove the empty dependencies
definitions that are added to avoid the automatic inheritance:

git grep 'DEPENDENCIES =$' -- \*.mk
-> 15 files, with an additional comment line, 30 more lines removed...

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
