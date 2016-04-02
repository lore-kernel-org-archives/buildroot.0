From: Matthew Weber <matt@thewebers.ws>
Date: Fri, 1 Apr 2016 20:04:08 -0500
Subject: [Buildroot] [PATCH 0/4 v2] core/download: add support for git
 sub-modules (branch yem/git)
In-Reply-To: <cover.1459541702.git.yann.morin.1998@free.fr>
References: <cover.1459541702.git.yann.morin.1998@free.fr>
Message-ID: <CAFt09wPV8PQUTTykwNBuobnHvRgty7E+5YNmDEY1QRVWcUyVpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Fri, Apr 1, 2016 at 3:25 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Hello All!
>
> This little series adds support for packages coming from a git clone,
> with git sub-modules.
>
> The commit logs are pretty detailed, but roughly, it goes as thus;
>
>   - we can't get sub-modules in a bare clone, so we no longer use bare
>     clones, but use full clones (with a working copy);
>
>   - git-archive does not support submodules, so we generate archives
>     manually;
>
>   - we check out the working copy to the correct cset, then we retrieve
>     the submodules;
>
>   - we expose a new package variable to request sub-modules.

I took the refpolicy package (pending merge) and reworked the patch to
use the git submodule feature.  I had it download/extract a specific
tag and then I observed the submodule checkout.  Originally the
refpolicy package used two packages to achieve this same
functionality.  I appreciate the patches!

Tested-by: Matt Weber <matt@thewebers.ws>
Reviewed-by: Matt Weber <matt@thewebers.ws>
