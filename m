From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 11:45:16 +0200
Subject: [Buildroot] [PATCH] support/downlaod: fix the Hg backend for
 tags
In-Reply-To: <1439933704-7451-1-git-send-email-yann.morin.1998@free.fr>
References: <1439933704-7451-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150829114516.24a5b19e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 18 Aug 2015 23:35:04 +0200, Yann E. MORIN wrote:
> When the version of a package is a Mercurial tag, the download fails,
> with:
>     abort: unknown revision 'X.Y.Z'!
> 
> This is because, in Mercurial, tags are commits like the others, and
> when we clone, we actively request a tag. But then, the server
> "dereferences" that tag and sends us the revision pointed to by that
> tag. Of course, since the tag is a commit after the revision we got,
> we do not have the revision adding the tag.
> 
> So, we just have to download the full repository to be sure we have
> the tags in our local clone.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  support/download/hg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to next, thanks (after fixing the minor typo in the commit
title). I've also committed a follow-up patch that makes the eigen
package use a Mercurial tag.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
