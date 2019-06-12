From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Jun 2019 17:46:24 +0200
Subject: [Buildroot] [PATCH 1/2] infra/pkg-meson: allow packages to
 expand their CFLAGS/CXXFLAGS/LDFLAGS
In-Reply-To: <20190611230043.6d986a3c@windsurf>
References: <cover.1560286529.git.yann.morin.1998@free.fr>
 <4a99ac5f8c5f10cfc9bb20b33423aceca4773fa0.1560286529.git.yann.morin.1998@free.fr>
 <20190611230043.6d986a3c@windsurf>
Message-ID: <20190612154624.GB2647@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-06-11 23:00 +0200, Thomas Petazzoni spake thusly:
> On Tue, 11 Jun 2019 22:55:43 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > Some packages will want to pass extra CFLAGS, CXXFLAGS, or LDFLAGS.
> > For example, they may want/have to pass $(TARGET_NLS_LIBS), like
> > libglib2 when the toolchain is based on musl or uClibc (because meson
> > does not have all the necessary infra internally to properly and reliably
> > detect the presence of, or need for linking with, -lintl.
> > 
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > Cc: Adam Duskett <aduskett@gmail.com>
> > Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> 
> This looks highly similar to
> http://patchwork.ozlabs.org/patch/1089760/, which seems more complete.

Hmm. It indeed looks to achieve the same goal, I'll look into it in more
details shortly.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
