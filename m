From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Apr 2018 21:45:22 +0200
Subject: [Buildroot] [PATCH 2/4] download/git: ensure we have a sane
 repository
In-Reply-To: <5ad8baa92a09d_7cd63f7f1600bf84178aa@ultri4.mail>
References: <8019bec4b6420d014d263c2c3e12e3c985a2ef0d.1523983687.git.yann.morin.1998@free.fr>
 <5ad8baa92a09d_7cd63f7f1600bf84178aa@ultri4.mail>
Message-ID: <20180419194522.GC30285@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2018-04-19 12:50 -0300, Ricardo Martincoski spake thusly:
> On Tue, Apr 17, 2018 at 01:48 PM, Yann E. MORIN wrote:
> > There are cases where a repository might be broken, e.g. when a previous
> > operation was killed or otherwise failed unexpectedly.
> > 
> > We fix that by always initialising the repository, as suggested by
> > Ricardo. git-init is safe on an otherwise-healthy repository:
> > 
> >     Running git init in an existing repository is safe. It will not
> >     overwrite things that are already there. [...]
> > 
> > Using git-init will just ensure that we have the strictly required files
> > to form a sane tree. Any blob that is still missing would get fetched
> > later on.
> > 
> > Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> Acked-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> [a broken repo with a clean worktree is recovered at the extent that git allows]
> Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> 
> 
> Tests performed with patches 1 and 2 applied:
> 
> 1) In the same scenario tested for patch 1 (empty dl/<package>/git) instead of
>    bailing out the script reinitialises and uses the git cache.
> 
> 2) Using git 2.11.0, download all git packages in the tree, remove the tarball
>    and regenerate it 2 times, before [1] and after [2] this patch.
> [1] https://gitlab.com/RicardoMartincoski/buildroot/pipelines/20734086
> [2] https://gitlab.com/RicardoMartincoski/buildroot/pipelines/20729761
> In theses GitLab pipelines there are jobs marked as failures (remote server did
> not respond, ...) but they are not related to patch 1 or 2. The same occur
> before and after the 2 patches.

Thanks for the extensive testing! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
