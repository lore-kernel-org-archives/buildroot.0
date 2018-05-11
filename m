From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 23:05:17 +0200
Subject: [Buildroot] [PATCHv2] docs/manual: using a branch name as
 FOO_VERSION does not work
In-Reply-To: <20180511155058.26875-1-yann.morin.1998@free.fr>
References: <20180511155058.26875-1-yann.morin.1998@free.fr>
Message-ID: <20180511230517.08f676bc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 May 2018 17:50:58 +0200, Yann E. MORIN wrote:
> For various reasons, we've always suggested users to avoid using a
> branch as version string for their packages, because it does not work
> as a they would expect:
> 
>   - it is not reproducible, because the branch may change between two
>     builds that are done at different times;
> 
>   - it does not even follow the branch, as Buildroot anyway generates
>     a local tarball, which it will reuse on subsequent builds.
>     Furthermore, since we fetch and not pull, any existing local branch
>     is not updated.
> 
> Yet, until recently, using a branch name would just work (with the
> above limitations): the git tree was cloned, the branch checked out,
> and the tarball created.
> 
> But with the advent of the git caching, using a branch name does not
> work anymore. Indeed, we now do a git-fetch, and that does not create
> local master branch. So we can't check out master, because it does not
> exist locally. And for other branches, as noticed above, the local
> branch does not get udpated to the remote one.
> 
> Furthermore, the local branches are only created by chance, again as a
> side-effect of trying to fetch the "special refs".
> 
> So, we can't say that we reliably support the use of a branch name.
> 
> Update the manual to state that using a branch does not work. Remove
> the 'stable' example, as it looked like the name of a stable branch;
> instead, replace it with a version string that ressemble a tag.
> 
> Fix the layout of the manual by making the version examples an actual
> bulleted list.
> 
> Note: the above is only entirely true for git. For Mercurial, CVS and
> subversion, the status may be mixed, but nonetheless, using branches is
> still a bad idea, if at least because it is not reproducible, and
> because Buildroot does not even follow the branch. So, we do not
> differentiate between the various SCMs, and just flatly state that using
> a branch name is not supported.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> 
> ---
> Changes v1 -> v2:
>   - enhance commit log with additional details  (Ricardo)
>   - blurb about
>   - typoes in commit log  (Ricardo)
> ---
>  docs/manual/adding-packages-generic.txt | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Applied to master after using "version control system", as suggested by
Thomas DS. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
