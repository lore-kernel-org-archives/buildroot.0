From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 Sep 2014 00:02:56 +0200
Subject: [Buildroot] [PATCH 3/4] arch: do not distinguish revisions of
 ARM1136JF-S
In-Reply-To: <CA+sos781LFuT-ukvPyKnOgtdYd7uVUHb3FCX8BCSz7sox11T9Q@mail.gmail.com>
References: <1410814919-11523-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1410814919-11523-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140915213339.GC3878@free.fr>
 <20140915233916.55c17894@free-electrons.com>
 <CA+sos781LFuT-ukvPyKnOgtdYd7uVUHb3FCX8BCSz7sox11T9Q@mail.gmail.com>
Message-ID: <20140915220256.GE3878@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Beno?t, Thomas, All,

On 2014-09-15 23:44 +0200, Beno?t Th?baudeau spake thusly:
> On Mon, Sep 15, 2014 at 11:39 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Dear Yann E. MORIN,
> >
> > On Mon, 15 Sep 2014 23:33:39 +0200, Yann E. MORIN wrote:
> >
> >> > Note that the removal of the two options should not break existing
> >> > full .config, since the hidden option BR2_arm1136jf_s becomes again a
> >> > visible option to select the CPU.
> >>
> >> But it would break a defconfig.
> >
> > Right. But I believe that when we change the default value of an
> > option, we also break a defconfig, and we don't include that as part of
> > the Config.in.legacy handling (but also because it's obviously more
> > complicated).
> >
> >> As suggested on IRC, move the BR2_arm1136jf_s_r1 to Config.legacy, and
> >> have it select BR2_arm1136jf_s, so the user can re-use a defconfig.
> >
> > Hum, why just BR2_arm1136jf_s_r1 and not BR2_arm1136jf_s_r0 ?
> 
> This issue disappears if -march and -mtune are kept and -mcpu removed
> as I suggested.

So, maybe we need something like this:

    https://gist.github.com/aeruder/341565b759822b352dd9

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
