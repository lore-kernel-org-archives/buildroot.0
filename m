From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 May 2021 22:49:50 +0200
Subject: [Buildroot] Verifying linux 5.4.x hashes
In-Reply-To: <20210528202931.futcxwo2lokvoact@falbala.internal.home.lespocky.de>
References: <BN8PR11MB366618492FB8C57A78D7752BFF229@BN8PR11MB3666.namprd11.prod.outlook.com>
 <20210528195506.GH2788252@scaer>
 <20210528202931.futcxwo2lokvoact@falbala.internal.home.lespocky.de>
Message-ID: <20210528204950.GJ2788252@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexander, All,

On 2021-05-28 22:29 +0200, Alexander Dahl spake thusly:
> On Fri, May 28, 2021 at 09:55:06PM +0200, Yann E. MORIN wrote:
> >   - the hashes for custom version are not checked at all, becasue we
> >     can't have all the hashes of all the kernel versions
> Maybe not for non official version, but why not for all mainline
> kernel versions?
>     % git tag | grep -v rc | wc -l
>     3025
> This would be 3k lines of text currently, big compared to other
> buildroot hashes files, but not that huge in general.  If one could
> split it up for major releases, I would consider it maintainable,
> that's just few hundred lines per kernel version max.

The problem is not really about the number of hashes. The problem is
about kernel relases that are made after we have done a relase.

For example, let's assume that we add all known hashes right now (and
update until we release. When we release Buildroot 2021.05, it is
frozen: it's not going to change, that's all about being a release.

A day after we release 2021.05 with all say) then-known 5.4.x versions
and thus up to and including 5.4.123, the kernel team (GKH) releases
5.4.124.

Then Buildroot 2021.05 no longer has a hash for all kernel releases.

That is the actual problem: kernel releases are going to be made after
we tag and release our own versions.

So, no, we can't have a hash for all kernel versions.

Besides, you are missing the (presumably much fewer) CIP-SLTS and
CIP-RT-SLTS versions, but that's a detail...

> Would of course not apply to custom versions, for mainline only.  But
> we all head for mainline first, anyways, don't we? ;-)

Muahahaha! :-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
