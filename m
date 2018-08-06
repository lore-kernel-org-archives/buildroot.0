From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Aug 2018 20:36:47 +0200
Subject: [Buildroot] [PATCH 3/3] support/download: detect and abort when
 using a git branch by name
In-Reply-To: <5b67bd1e9b36b_78eb3f98000819849635@ultri5.mail>
References: <d1cdffd986d2f2128396aa785d542fdd3d2c90e0.1533400367.git.yann.morin.1998@free.fr>
 <5b67bd1e9b36b_78eb3f98000819849635@ultri5.mail>
Message-ID: <20180806183647.GC2427@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2018-08-06 00:14 -0300, Ricardo Martincoski spake thusly:
> On Sat, Aug 04, 2018 at 01:33 PM, Yann E. MORIN wrote:
> > +# Check if the changeset is a branch name.
> > +if _git show-ref "${cset}" |grep -qv refs/tags; then
> 
> I didn't had time to test it yet.
> Special refs still works after this?

It is not supposed to be broken, as those special refs are (AFAIU)
exposed as tags, not heads. But as I don't have access to a server
serving those special refs (support for which I find ugly, btw), I
could not test.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
