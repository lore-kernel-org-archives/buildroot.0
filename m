From: Robert Hancock <robert.hancock@calian.com>
Date: Mon, 28 Jun 2021 18:02:18 +0000
Subject: [Buildroot] [PATCH 0/5] nginx updates
In-Reply-To: <20210628161610.3197763-1-aduskett@gmail.com>
References: <20210628161610.3197763-1-aduskett@gmail.com>
Message-ID: <a44b24ab6d4af719790f5b6e03821a64ed93f23f.camel@calian.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2021-06-28 at 09:16 -0700, Adam Duskett wrote:
> Just some nginx maintnence.
> 
> Changes include:
>   - Update nginx to the latest LTS release.
>   - Update nginx naxsi, dav-ext, and modsecurity.
> 
> The nginx-upload package also has updates, however, the current nginx-upload
> url
> points to a fork of nginx-upload-module. The official project URL is fdintino
> not vkholodkov. Should this be changed to fdintino and the version changed to
> 4423994c7d8fb491d95867f6af968585d949e7a9?
> 

I believe at one point the fdintino repository was quite behind and was missing
a bunch of features like HTTP/2 support that were in the vkholodkov fork. It
looks like the vkholodkov version is only 1 commit ahead of fdintino right now
however, so we might be able to switch to the "official" version.

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
>  delete mode 100644 package/nginx/0010-Resolver-fixed-off-by-one-write-in-
> ngx_resolver_copy.patch
> 
-- 
Robert Hancock
Senior Hardware Designer, Calian Advanced Technologies
www.calian.com
