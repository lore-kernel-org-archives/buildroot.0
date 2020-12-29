From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 18:46:17 +0100
Subject: [Buildroot] [PATCH v2 0/2 ] package/timescaledb: Don't build
 with postgresql 13
In-Reply-To: <20201229095255.183687-1-fido_max@inbox.ru>
References: <20201229095255.183687-1-fido_max@inbox.ru>
Message-ID: <20201229174617.GT1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxim, All,

On 2020-12-29 12:52 +0300, Maxim Kochetkov via buildroot spake thusly:
> TimescaleDB is not supporting postgresql 13 at the moment.

What about bumping timescaledb to version 2.0.0, which carries the
following patches, and thus should ahve PG13 support:

    21dc9b9c1a30 Allow building against PG13 source
    002510cb01e1 Add compatibilty wrapper functions for base64
                 encoding/decoding
    be8dd086a089 Add missing utils/acl.h includes

We are otherwise trying hard to not have a version choice, except in
very special cases (hardware support, bootloaders, incomaptible APIs,
etc...), so I would prefer that we carry a few upstream patches if
updating timescaledb is not possible.

Regards,
Yann E. MORIN.

> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
> changes in v2:
> - Hide version selection in "if BR2_PACKAGE_POSTGRESQL" block
> 
> Maxim Kochetkov (2):
>   package/postgresql: allow to select postgresql version
>   package/timescaledb: add dependency on postgresql 12
> 
>  package/postgresql/Config.in       | 24 ++++++++++++++++++++++++
>  package/postgresql/postgresql.hash |  3 +++
>  package/postgresql/postgresql.mk   |  2 +-
>  package/timescaledb/Config.in      |  1 +
>  4 files changed, 29 insertions(+), 1 deletion(-)
> 
> -- 
> 2.29.2
> 
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
