From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Jul 2017 17:27:16 +0200
Subject: [Buildroot] [PATCH] manual: patches are not applied for
 SITE_METHOD = local
In-Reply-To: <20170708201507.20746-1-arnout@mind.be>
References: <20170708201507.20746-1-arnout@mind.be>
Message-ID: <20170709172716.1d521e19@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 8 Jul 2017 22:15:07 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> We had several remarks on the mailing list of users that were surprised
> that patches were not applied for packages whose SITE_METHOD is local.
> So document this.
> 
> Note that for OVERRIDE_SRCDIR itself it is already documented:
> 
>   When Buildroot finds that for a given package, an
>   <pkg>_OVERRIDE_SRCDIR has been defined, it will no longer attempt to
>   download, extract and patch the package. Instead, it will directly use
>   the source code available in in the specified directory.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied, thanks!

> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index 12cf1605d6..63ea51bf89 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -315,7 +315,10 @@ information is (assuming the package name is +libfoo+) :
>    ** +local+ for a local source code directory. One should use this
>       when +LIBFOO_SITE+ specifies a local directory path containing
>       the package source code. Buildroot copies the contents of the
> -     source directory into the package's build directory.
> +     source directory into the package's build directory. Note that
> +     for +local+ packages, no patches are applied. If you need to
> +     still patch the source code, use +LIBFOO_POST_RSYNC_HOOKS+, see
> +     xref:hooks-rsync[].

The reason why "local" packages don't see their patches applied is
because we assume that if the source code is available locally, you'd
better have the patches applied to it directly. But OK, we can still
point people to the rsynch hooks if they really think they need some
patching.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
