From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Oct 2015 18:32:00 +0200
Subject: [Buildroot] [PATCH 1/9] core: sort packages and eliminate
 duplicates before building
In-Reply-To: <20151001081917.7957b83b@free-electrons.com>
References: <cover.1443650034.git.yann.morin.1998@free.fr>
 <ef61b62e70416103f69b2e8c214b7f6bedd99b5e.1443650034.git.yann.morin.1998@free.fr>
 <20151001081917.7957b83b@free-electrons.com>
Message-ID: <20151001163200.GA3686@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-10-01 08:19 +0200, Thomas Petazzoni spake thusly:
> On Wed, 30 Sep 2015 23:54:44 +0200, Yann E. MORIN wrote:
> > Currently, enabling more than one filesystem image will make
> > 'show-targets' list a few host packages more than once.
> > 
> > This is because all filesystem images add the same set of
> > host-packages to their dependencies, which are then added as-is
> > to the package list.
> > 
> > Thus, host-fakeroot, host-makedevs and, if needed, host-mkpasswd will
> > appear as many times as there are filesystem images enabled.
> 
> Is this a problem? I don't think "show-targets" aims at guaranteeing
> that each target will only be listed once.

Well, it's not a real, hard problem. It's just not clean.

However, the part I'm most interested in is to sort the packages list,
so we have ven more reproducible builds. Maybe I should have articulated
the commit log to stress more on that reason rather than on show-targets.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
