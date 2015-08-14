From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 14 Aug 2015 18:45:15 +0200
Subject: [Buildroot] [PATCH 1/1] protobuf/protobuf-c: bump versions
In-Reply-To: <CALoSW65Z_+s+N0E7WSDbqNqzFTfaoDWaCPfA9uPyUh6Q-LyfRw@mail.gmail.com>
References: <1439516481-3375-1-git-send-email-nimaim@gmail.com>
 <20150814121935.GA4017@free.fr>
 <CALoSW66YprLV_WKuWUrPgzT9hL2JzBh69ggg2dNE3rxEkXohXg@mail.gmail.com>
 <20150814123735.GB4017@free.fr>
 <CALoSW67wa+ZY8PswjOFauGeT3-DT0eqd8VnxfS70OUECR_DQeA@mail.gmail.com>
 <20150814154215.GD4017@free.fr>
 <CALoSW65Z_+s+N0E7WSDbqNqzFTfaoDWaCPfA9uPyUh6Q-LyfRw@mail.gmail.com>
Message-ID: <20150814164515.GE4017@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nimai, All,

On 2015-08-14 11:54 -0400, Nimai Mahajan spake thusly:
> On Aug 14, 2015 11:42 AM, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > On 2015-08-14 11:11 -0400, Nimai Mahajan spake thusly:
[--SNIP--]
> > > protobuf-c v1.1.1 builds successfully with all toolchains ...
> > Good. Please provide a separate patch just to bump protobuf-c, then.
> Yep, will do.

Thanks! :-)

[--SNIP--]
> > So I think it is musch easier to just mark the package as not being
> > availble for static-only builds...
> 
> Agreed ... will do. I appreciate the help.

In this case, prepare two patches:
  - one to "fix" the static issue, that can be applied to master,
  - ont to do the bump, which can be applied to the -next branch.

Beware when "fixing" that static issue: two packages do select
BR2_PACKAGE_PROTOBUF (ola and mosh) so the new dependency must be
propagated to those two packages as well.

(In fact I already have the fix locally, but did not have time to submit
it so far, so be my guest and submit it if you want! ;-) )

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
