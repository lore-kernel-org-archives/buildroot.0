From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Jan 2013 22:29:00 +0100
Subject: [Buildroot] [PATCH v2 1/6] sg3_utils: new package
In-Reply-To: <CAAfyv36XKECoCh4+Dx-revgX_hF9N7A94DqD=5zaNdo=4scm3g@mail.gmail.com>
References: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
 <201301152159.17888.yann.morin.1998@free.fr>
 <CAAfyv36XKECoCh4+Dx-revgX_hF9N7A94DqD=5zaNdo=4scm3g@mail.gmail.com>
Message-ID: <201301152229.00798.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Belisko, All,

On Tuesday 15 January 2013 Belisko Marek wrote:
> On Tue, Jan 15, 2013 at 9:59 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > SG3_UTILS_LICENCE = LGPLv2.1+ BSD-3c
> > ifneq ($(BR2_PACKAGE_SG3_UTILS_PROGS),)
> > SG3_UTILS_LICENCE += GPLV2+ BSD-3c
> > endif
> It's bit complicated. All library files are BSD only but utils files
> are mixed (BSD + GPLv2).

Then: 

SG3_UTILS_LICENSE = BSD-3c
ifneq ($(BR2_PACKAGE_SG3_UTILS_PROGS),)
SG3_UTILS_LICENSE += GPLV2+
endif

(Note: LICENSE with a 'S', not LICENCE, my bad...)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
