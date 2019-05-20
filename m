From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 May 2019 22:25:45 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/murata-cyw-fw: download
 NVRAM and BT_PATCH only when needed
In-Reply-To: <20190520222150.5feafcf5@windsurf.home>
References: <20190510083505.1341-1-m.niestroj@grinn-global.com>
 <20190510083505.1341-3-m.niestroj@grinn-global.com>
 <20190520222150.5feafcf5@windsurf.home>
Message-ID: <20190520202545.GB2229@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-05-20 22:21 +0200, Thomas Petazzoni spake thusly:
> On Fri, 10 May 2019 10:35:05 +0200
> Marcin Niestroj <m.niestroj@grinn-global.com> wrote:
> > Do not download NVRAM and BT_PATCH repositories when selected modules do
> > not require files from them. One of the example module is CYW4359, which
> > has neither NVRAM nor BT_PATCH files.
> > 
> > There is also drawback of this approach: NVRAM and BT_PATCH are not
> > downloaded when package is being rebuilt with changed set selected
> > modules, so the whole build fails because of missing files.
> > 
> > Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> > ---
> > Changes v2 -> v3: add this patch
> 
> I looked at the size of the different tarballs:
> 
> -rw-r--r-- 1 thomas thomas 193K 20 mai   21:53 cyw-bt-patch-748462f0b02ec4aeb500bedd60780ac51c37be31.tar.gz
> -rw-r--r-- 1 thomas thomas  12K 20 mai   21:53 cyw-fmac-nvram-d27f1bf105fa1e5b828e355793b88d4b66188411.tar.gz
> -rw-r--r-- 1 thomas thomas 2,7M 20 mai   21:53 murata-cyw-fw-8d87950bfad28c65926695b7357bd8995b60016a.tar.gz
> 
> So the main tarball is 2.7 MB, and it gets always downloaded. The other
> ones are 193 KB and 12 KB. I don't think this really warrants some
> additional complexity: we can simply always download all tarballs, as
> you did in PATCH 1/2.

It was I who suggested Marcin could do this conditional download, after
they explained the extra downloads where not always required.

However, I did not know the relative sizes. Now that I do, I do agree
that this does not warrant the extra complexity.

> So I marked PATCH 2/2 as Rejected.

Agreed.

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
