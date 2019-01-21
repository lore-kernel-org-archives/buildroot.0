From: Vadim Kochan <vadim4j@gmail.com>
Date: Mon, 21 Jan 2019 13:32:23 +0200
Subject: [Buildroot] [PATCH v5 1/4] libopenssl: bump version to 1.1.1a
In-Reply-To: <CAKKE0ZH4PzYGW5i55kEpG_6NsoWZ=tUwn3y0abg2NpzB1yKyLQ@mail.gmail.com>
References: <20190117181608.12644-1-ps.report@gmx.net>
 <CAKKE0ZG54aPrwtbCiPKogDTHJfgha_x1iR1bBnhVQ4H0bp4q5g@mail.gmail.com>
 <20190118114943.j5jdw7nzzl2cddnu@vkochan-ThinkPad-T470p>
 <CAKKE0ZFNnbbDE8TQK_L8hSZ_PSpT+F0jYgTT-cAy58zRrq8vQQ@mail.gmail.com>
 <20190118160114.episx2qs7ohdawgm@vkochan-ThinkPad-T470p>
 <CAKKE0ZH4PzYGW5i55kEpG_6NsoWZ=tUwn3y0abg2NpzB1yKyLQ@mail.gmail.com>
Message-ID: <20190121113223.t2sy6dvhrogw2u7z@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Jan 21, 2019 at 11:31:17AM +0100, Patrick Havelange wrote:
> Hi,
> 
> > I looked into uclibc-1.0.31/extra/Configs/Config.in and I see that
> > UCLIBC_HAS_CONTEXT_FUNCS depends on ARCH_HAS_UCONTEXT which is not
> > selected by extra/Configs/Config.xtensa .
> >
> 
> Thanks for the explanation, I'm also now doing a patch to set the
> proper openssl #define based on that property.
> 
> BR,
> 
> Patrick Havelange

I think that probably disabling the openssl's "async" feature for arch which does
not support ucontext by uclibc might be enough.

Regards,
Vadim Kochan
