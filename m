From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Apr 2018 19:33:26 +0200
Subject: [Buildroot] [RFC PATCH 3/3] download/git: unshallow when
 fetching all refs
In-Reply-To: <20180412132815.7307e923@windsurf>
References: <20180412092855.30621-1-ricardo.martincoski@gmail.com>
 <20180412092855.30621-4-ricardo.martincoski@gmail.com>
 <20180412132815.7307e923@windsurf>
Message-ID: <20180412173326.GD4221@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Ricardo, All,

On 2018-04-12 13:28 +0200, Thomas Petazzoni spake thusly:
> Thanks a lot Ricardo for all this work on the download issues, much
> appreciated.

Indeed, thanks!

> One question on this specific commit.
> 
> On Thu, 12 Apr 2018 06:28:55 -0300, Ricardo Martincoski wrote:
> > With any version of git, after the git cache was once populated using a
> > shallow fetch, a full fetch succeeds but doesn't download the commits
> > behind the reference that was fetched with --depth 1. In this case the
> > download fails like this:
> >  Fetching all references
> >  Could not fetch special ref 'sha1'; assuming it is not special.
> >  fatal: reference is not a tree: sha1
> > 
> > One scenario in buildroot development that would trigger this sequence
> > is for example when a package is bumped on master branch, some users
> > create the git cache at this time, then the bump is reverted.
> > 
> > Another scenario is when giving maintenance to a product version that
> > uses one version of buildroot using the same build farm that uses a
> > newer version of buildroot.
> 
> In the light of this, wouldn't it be simpler to stop doing shallow
> clones at all ? A shallow clone did make a lot of sense back when we
> didn't cache the Git repositories. But now that we are caching the
> results, does it make sense to keep the complexity of the code to use
> shallow clones ?
> 
> Note that this is really an open question, there are possibly some
> convincing argument for us to keep a shallow clone strategy.

Indeed, I don't think it makes sense anymore...

So, intead of fixing it, let's just do full clones now.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
