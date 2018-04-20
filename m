From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Apr 2018 11:25:16 +0200
Subject: [Buildroot] [PATCH 3/4] download/git: ensure we can checkout
 repos with submodule conversions
In-Reply-To: <41022455-a486-da38-00fa-53c07432fa97@mind.be>
References: <a45b9ba78d527d29cfd5cc0daf4c767c7feb8643.1523983687.git.yann.morin.1998@free.fr>
 <5ad6b7cbf192b_23c22af60ee98304189d9@ultri4.mail>
 <627eaa46-0acb-9753-15a0-d805abb18164@mind.be>
 <20180419195948.GD30285@scaer>
 <41022455-a486-da38-00fa-53c07432fa97@mind.be>
Message-ID: <20180420092516.GA12688@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-04-20 01:30 +0200, Arnout Vandecappelle spake thusly:
> On 19-04-18 21:59, Yann E. MORIN wrote:
> > On 2018-04-18 10:04 +0200, Arnout Vandecappelle spake thusly:
[--SNIP--]
> >>  I'm liking the bare repos more and more :-)
> > But then, we can't have submodules stored in a bare repo, because we
> > need a workign copy to have the list of submodules, and their
> > versions...
> 
>  It's *possible* to do things fully "manually", e.g. with some plumbing commands:
> 
> export GIT_DIR=/path/to/bare/repo
> blob=$(git ls-tree $cset .gitmodules | awk '{print $3}')
> if [ "$blob" ]; then
>   tmpfile=$(git unpack-file $blob)
>   etc. etc.

I hope you were only joking there... ;-)

No, no, no... We don't want to go that route, reinventing the git
internals in a shell script... Even I can't find this appealing...

Well, that could be fun to write...
No, don't look down the deep ravine... ;-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
