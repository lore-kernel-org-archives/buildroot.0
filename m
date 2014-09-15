From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Sep 2014 23:48:41 +0200
Subject: [Buildroot] [PATCH 3/4] arch: do not distinguish revisions of
	ARM1136JF-S
In-Reply-To: <20140915233916.55c17894@free-electrons.com>
References: <1410814919-11523-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1410814919-11523-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140915213339.GC3878@free.fr>
 <20140915233916.55c17894@free-electrons.com>
Message-ID: <20140915214841.GD3878@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-09-15 23:39 +0200, Thomas Petazzoni spake thusly:
> On Mon, 15 Sep 2014 23:33:39 +0200, Yann E. MORIN wrote:
> > > Note that the removal of the two options should not break existing
> > > full .config, since the hidden option BR2_arm1136jf_s becomes again a
> > > visible option to select the CPU.
> > 
> > But it would break a defconfig.
> 
> Right. But I believe that when we change the default value of an
> option, we also break a defconfig, and we don't include that as part of
> the Config.in.legacy handling (but also because it's obviously more
> complicated).
> 
> > As suggested on IRC, move the BR2_arm1136jf_s_r1 to Config.legacy, and
> > have it select BR2_arm1136jf_s, so the user can re-use a defconfig.
> 
> Hum, why just BR2_arm1136jf_s_r1 and not BR2_arm1136jf_s_r0 ?

Yes, of course.

I re-did my mental flow, and not having _r0 in legacy does not fly.
We need both in legacy, indeed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
