From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Apr 2018 22:59:49 +0200
Subject: [Buildroot] [PATCH] autobuild-run: remove only tarballs from
 download dir
In-Reply-To: <20180415223829.55ca00e3@windsurf.numericable.fr>
References: <20180413133431.19449-1-ricardo.martincoski@gmail.com>
 <20180415214257.1e90704a@windsurf.numericable.fr>
 <20180415194915.GE21958@scaer>
 <20180415220222.6413547a@windsurf.numericable.fr>
 <20180415201026.GA13321@scaer>
 <20180415223829.55ca00e3@windsurf.numericable.fr>
Message-ID: <20180415205949.GB13321@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-04-15 22:38 +0200, Thomas Petazzoni spake thusly:
> On Sun, 15 Apr 2018 22:10:26 +0200, Yann E. MORIN wrote:
> 
> > > OK, so in practice removing random files inside the git/ folders should
> > > not cause any problem ?  
> > 
> > Well, if you remove files from the working copy, no. The next git-checkout
> > would fix it to a certain extent, which can be covered by a mix of
> > git-clean + git-checkout, again to a certain extent...
> > 
> > However, if you remove files from below .git, you can cause heavy
> > breakage. Even removing a single object will cause the tree to get
> > uterly broken, not telling what happens when one removes a ref or
> > HEAD.
> > 
> > So, runniong git-fsck would catch the cases where something is missing
> > in .git, in which case we're toast and the git cache is as good as if
> > it were not present.
> 
> Still not following you. Are you saying that today we do *not* run
> git-fsck, and therefore a borked repository is not detected, but that
> we could add a call to git-fsck to detect borked repositories, and
> therefore avoid the problems of the autobuilders already having borked
> Git caches ?

Basically, yes, that is what I wanted to say.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
