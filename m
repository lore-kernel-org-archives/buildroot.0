From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Nov 2014 18:53:30 +0100
Subject: [Buildroot] [PATCH v3 0/3] Improve silent builds
In-Reply-To: <CAHkwnC-Ds16rDgPAASzLof_xcGgvde_Pni9Vc8Am45gnNT5_PA@mail.gmail.com>
References: <1415265217-18494-1-git-send-email-fabio.porcedda@gmail.com>
 <20141106182725.450971c9@free-electrons.com>
 <CAHkwnC-Ds16rDgPAASzLof_xcGgvde_Pni9Vc8Am45gnNT5_PA@mail.gmail.com>
Message-ID: <20141106185330.659d572f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Thu, 6 Nov 2014 18:35:32 +0100, Fabio Porcedda wrote:

> > When I look at patches 2 and 3, I must say I dislike the fact that in
> > one case (svn), silencing is handled in pkg-download.mk when defining
> > the SVN variable, while in the other case (git), it's handled in the
> > git-specific helper script.
> 
> I would like to do the same for git but it does not work because:
>   git -q clone <url>
> does not work, but
>   git  clone -q <url>
> works, so adding the "-q" in the script is the only option.
> 
> Do you have any better idea?

Yes: handle the svn case in the download helper as well. This way,
we're consistent between svn and git. And maybe wget should be handled
this way as well.

Yann can comment on this on whether my proposal is fine for him.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
