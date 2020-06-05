From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jun 2020 00:30:09 +0200
Subject: [Buildroot] [PATCH v2 0/4] package/redis: bump to Redis 6
In-Reply-To: <20200602104011.837-1-titouan.christophe@railnova.eu>
References: <20200602104011.837-1-titouan.christophe@railnova.eu>
Message-ID: <20200605223009.GW13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Titouan, All,

On 2020-06-02 12:40 +0200, Titouan Christophe spake thusly:
> This series bumps Redis to the new major version 6.
> 
> Redis 6 introduces new data types and commands, support for clients ACL, TLS 
> connections, client-side caching, threaded I/O, and many other improvements.
> See the full announcement on: http://antirez.com/news/132
> See the changelog:
>     https://raw.githubusercontent.com/antirez/redis/6.0/00-RELEASENOTES
> 
> 
> In addition to the version bump, this series also adds a runtime test for
> Redis, and enables support for TLS and Systemd integration.

Series applied to master, but I will reply to individual patches...

Thanks!

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
> * Bump to Redis 6.0.4 instead of 6.0.1
> * Drop patch which has been applied upstream
> ---
> Titouan Christophe (4):
>   package/redis: bump to version 6.0.4
>   support/testing: add runtime test for Redis
>   package/redis: add optional support for TLS connections
>   package/redis: add optional support for systemd
> 
>  .gitlab-ci.yml                              |  1 +
>  DEVELOPERS                                  |  1 +
>  package/redis/Config.in                     | 15 +++++++------
>  package/redis/redis.hash                    |  4 ++--
>  package/redis/redis.mk                      | 11 +++++++++-
>  package/redis/redis.service                 | 10 +++++----
>  support/testing/tests/package/test_redis.py | 24 +++++++++++++++++++++
>  7 files changed, 53 insertions(+), 13 deletions(-)
>  create mode 100644 support/testing/tests/package/test_redis.py
> 
> -- 
> 2.25.3
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
