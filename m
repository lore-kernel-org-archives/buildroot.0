From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jun 2021 22:20:50 +0200
Subject: [Buildroot] [PATCH 0/5] nginx updates
In-Reply-To: <20210628161610.3197763-1-aduskett@gmail.com>
References: <20210628161610.3197763-1-aduskett@gmail.com>
Message-ID: <20210629202050.GR2829@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2021-06-28 09:16 -0700, Adam Duskett spake thusly:
> Just some nginx maintnence.

Yeah, welcome to the world of typoes. You'll see, we live very well
with them! ;-)

> Changes include:
>   - Update nginx to the latest LTS release.
>   - Update nginx naxsi, dav-ext, and modsecurity.
> 
> The nginx-upload package also has updates, however, the current nginx-upload url
> points to a fork of nginx-upload-module. The official project URL is fdintino
> not vkholodkov. Should this be changed to fdintino and the version changed to
> 4423994c7d8fb491d95867f6af968585d949e7a9?

Given the explanations by Roberts, I think it would be a good idea to
switch back to the official repo, yes.

Also, given Baruch review and mine, I've marked the series as changes
requested.

Thanks!

Regards,
Yann E. MORIN.

> Adam
> 
> Adam Duskett (5):
>   package/nginx: bump version to 1.20.1
>   package/nginx: add stream_set_module support
>   package/nginx-naxsi: bump version to 1.3
>   package/nginx-dav-ext: bump version to 3.0.0
>   package/nginx-modsecurity: bump to  version 1.0.2
> 
>  package/nginx-dav-ext/nginx-dav-ext.hash      |  4 +-
>  package/nginx-dav-ext/nginx-dav-ext.mk        |  2 +-
>  .../nginx-modsecurity/nginx-modsecurity.hash  |  6 +--
>  .../nginx-modsecurity/nginx-modsecurity.mk    |  2 +-
>  package/nginx-naxsi/nginx-naxsi.hash          |  4 +-
>  package/nginx-naxsi/nginx-naxsi.mk            |  6 +--
>  ...ture_run_force_result-for-each-featu.patch | 40 ++++++++-----------
>  ...ake-sys_nerr-guessing-cross-friendly.patch | 27 ++++++-------
>  ...to-os-linux-fix-build-with-libxcrypt.patch |  2 +-
>  ...ff-by-one-write-in-ngx_resolver_copy.patch | 40 -------------------
>  package/nginx/Config.in                       |  6 +++
>  package/nginx/nginx.hash                      |  4 +-
>  package/nginx/nginx.mk                        |  6 ++-
>  13 files changed, 55 insertions(+), 94 deletions(-)
>  delete mode 100644 package/nginx/0010-Resolver-fixed-off-by-one-write-in-ngx_resolver_copy.patch
> 
> -- 
> 2.31.1
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
