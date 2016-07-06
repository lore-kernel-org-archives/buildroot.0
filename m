From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Jul 2016 22:43:53 +0200
Subject: [Buildroot] [PATCH v6 1/6] audit: bump to version 2.6
In-Reply-To: <CAFSsvmrb56wuAp5mo5r6e-ZrNK2SF=wFs_3OW_WtdezqGVrCqw@mail.gmail.com>
References: <1466980753-667-1-git-send-email-Aduskett@gmail.com>
 <1466980753-667-2-git-send-email-Aduskett@gmail.com>
 <20160705171615.GJ6533@free.fr>
 <CAFSsvmp7sABianSmyfWOUv+P3-Y+ZOFVqf5cctU8Acs_zUz+kQ@mail.gmail.com>
 <CAFSsvmrb56wuAp5mo5r6e-ZrNK2SF=wFs_3OW_WtdezqGVrCqw@mail.gmail.com>
Message-ID: <20160706204353.GD3763@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2016-07-06 10:42 -0400, Adam Duskett spake thusly:
> I think this is a bug in Audit actually.
> 
> Audit 2.6.x checks for AUDIT_FEATURE_VERSION to be defined in
> include/linux/audit.h (this define was introduced in kernel version
> 3.13) and then blindly assumes that struct audit_status has
> feature_bitmap.
> However this looks like a problem as feature_bitmap wasn't introduced
> until kernel 3.19, even though the requirements for audit state >
> 2.6.30 (http://people.redhat.com/sgrubb/audit/)
> 
> This causes a compile error when attempting to compile audit 2.6.x
> against kernel headers younger than 3.19.

Thanks for investigating and explaining! :-)

> For the mean time i could add a conditional to require header versions
> > 3.19, although I am going to submit a bug report to the audit team
> as well.

I was gonna reply with a "depend on linux >= 3.19" but Thomas already
sent a patch to fix it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
