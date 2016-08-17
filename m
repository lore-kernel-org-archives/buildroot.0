From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Aug 2016 00:00:56 +0200
Subject: [Buildroot] [PATCH 1/1] support/download/git: Prioritize remote
 archive
In-Reply-To: <20160817235400.43af6dec@free-electrons.com>
References: <1471461016-9660-1-git-send-email-kamath.ben@gmail.com>
 <20160817210314.GG5778@free.fr>
 <CAJsd3zJZ6o3dbCuRC8uZ6CE_41jqmVYbtRrkCQZhEkdmeG_t0Q@mail.gmail.com>
 <20160817213102.GH5778@free.fr>
 <20160817235400.43af6dec@free-electrons.com>
Message-ID: <20160817220056.GK5778@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-08-17 23:54 +0200, Thomas Petazzoni spake thusly:
> Hello,
> 
> On Wed, 17 Aug 2016 23:31:02 +0200, Yann E. MORIN wrote:
> 
> > So, I think it is safe to assume that git-archives always generates
> > reproducible archive.
> 
> So the only remaining reason to not use git archive all the time is to
> support submodules?

Yes.

When doing submodules, I pondered doing two code paths: one for
non-submodules, that would use git-archive, and one where we would do it
all manually as we do today.

But then I concluded that it was better to have a single code path.

Note that, before submodules, we were happily using git-archive locally,
not even forcing the collating rules.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
