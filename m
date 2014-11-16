From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Nov 2014 12:22:10 +0100
Subject: [Buildroot] [PATCH 0/4] pkg-infra: differentiate remote and
 local tarball filenames (branch yem/download)
In-Reply-To: <cover.1416068004.git.yann.morin.1998@free.fr>
References: <cover.1416068004.git.yann.morin.1998@free.fr>
Message-ID: <20141116122210.6b3651e0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 15 Nov 2014 17:19:24 +0100, Yann E. MORIN wrote:

> This series introduces a new variable, FOO_UPSTREAM_SOURCE, so as to be
> able to differentiate remote and local tarball filenames.
> 
> This is needed when upstream tarballs are not named the way we expect them
> to be. For example, the GitHub API only provides a request like:
>     GET /repos/:owner/:repo/:archive_format/:ref
> 
> So far, we're not using this API, and directly use a non-stable scheme
> to retrieve the tarballs. That scheme has proven to break from time to
> time, so we'll soon need to switch to the API, which is guaranteed to be
> stable.
> 
> So, we need to be able to differentiate the filename remote knows the
> tarball by, and the local filename we want to save that tarball as.
> 
> Changes to the GitHub helper will come in a later series, because it is
> a bit more involved, and still needs some ironing out. Alternate forges
> may also get added in the future, which would require such a feature.

Not directly related, but somewhat related: I have always though that
our split between <foo>_SITE and <foo>_SOURCE was a bit stupid. Why
don't we simply give a full URL instead of splitting that between SITE
and SOURCE ?

The way we do things today also forces the things in <foo>_PATCH and
<foo>_EXTRA_DOWNLOADS to be under the exact same <foo>_SITE, which
prevents applying patches from other locations than the original
package site.

Shouldn't we simply get rid of <pkg>_SITE, and make <pkg>_SOURCE the
full URL to the tarball / git repo?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
