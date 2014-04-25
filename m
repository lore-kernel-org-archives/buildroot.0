From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Apr 2014 16:54:59 +0200
Subject: [Buildroot] [PATCH 3/9] boot/syslinux: remove 'default y' in
 sub-options
In-Reply-To: <5359965A.2040101@mind.be>
References: <cover.1398378217.git.yann.morin.1998@free.fr>
 <d3ab10dd08d3a1f70c0f7c79a5104d17a503579f.1398378217.git.yann.morin.1998@free.fr>
 <5359965A.2040101@mind.be>
Message-ID: <20140425145459.GA3273@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-04-25 00:55 +0200, Arnout Vandecappelle spake thusly:
> On 25/04/14 00:29, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > Remove the 'default y' from sub-options, but ensure at least one
> > is enabled anyway.
> > 
> > We keep the 'default y' to the default option, so that the menuconfig
> > behaviour is not too surprising.
> 
>  The "surprising" part is that isolinux will be unselected when one of
> the other options is selected. If you really want both isolinux and
> pxelinux, that indeed is surprising. But I think you usually want either,
> not both. So in that case the fact that you first have to select pxelinux
> and then unselect isolinux doesn't seem appropriate to me.

Yes, I was wondering what the expected behaviour would have been. I
would expect that something that is forcibly ON by default stays ON,
unless I explicitly disable it.

But the expected usage of syslinux is indeed that either is usually
used, not both (or more, given the following addition of the MBR, too).

So, I don't really care either way. Let's see what others think, I'll
rework the series if needed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
