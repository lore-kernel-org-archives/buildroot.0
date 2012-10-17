From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Oct 2012 22:16:43 +0200
Subject: [Buildroot] [PATCH 0/7] Introduce the _AVAILABLE mechanism
In-Reply-To: <20121017220525.6e7e173b@skate>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
 <201210172147.15828.yann.morin.1998@free.fr> <20121017220525.6e7e173b@skate>
Message-ID: <201210172216.43837.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout, All,

On Wednesday 17 October 2012 Thomas Petazzoni wrote:
> On Wed, 17 Oct 2012 21:47:15 +0200, Yann E. MORIN wrote:
> 
> > Maybe the solution would be that we do not add _AVAILABLE to
> > sub-options, but we can still use it from sub-options. Eg.
> > (condensed):
[--SNIP--]
> > Isn't that sufficient?
> 
> From a quick review, it sounds sufficient indeed. What surprises me is
> why we didn't think about this solution the other day when discussing
> your _AVAILABLE patch set.

To be honest, I'm surprised too I did not think about it. ;-]

In fact, as an after-thought, I do know why. That's because I was thinking
the other way-around: a package that depends on a sub-option of another
package, sub-option which in turn depends on a third package.  *That* one
would require an _AVAILABLE for sub-options.

For example, libuuid which is a sub-option of util-linux (although that one
sub-option has no dpendency; but you get the idea) is select by a few other
packages (eg. parted, ntfs-3g...).

And going *that* route is IMHO not what we want.

And first, we need to know if the case really exists (I was not able to
find a good heuristic to find such a case with a simple grep, so I gave
up the search).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
