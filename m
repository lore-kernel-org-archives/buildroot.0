From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Thu, 17 Sep 2020 00:20:42 +0200
Subject: [Buildroot] [PATCH 1/2] package/gpsd: bump version to 3.21
In-Reply-To: <20200824080449.10036-1-olivier.dautricourt@orolia.com>
References: <20200824080449.10036-1-olivier.dautricourt@orolia.com>
Message-ID: <246a1374-8ea4-8efc-bed4-83dcd5d29d36@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Olivier and all,

On 24/08/20 10:04, Olivier Dautricourt wrote:
> - removed unnecessary patch
> - removed obsolete gpsd options:
> 	GPSD_CONTROLSEND
> 	GPSD_RECONFIGURE
> 	GPSD_FIXED_PORT_SPEED

In my opinion, it would be better to rephrase the commit log in 
imperative style

> 
> ref: https://gpsd.gitlab.io/gpsd/NEWS
> Signed-off-by: Olivier Dautricourt <olivier.dautricourt@orolia.com>
> ---
>   Config.in.legacy                              |  20 +++
>   ...s-during-gpsd-3.20-cross-compilation.patch | 148 ------------------
>   package/gpsd/Config.in                        |  16 --
>   package/gpsd/gpsd.hash                        |   2 +-
>   package/gpsd/gpsd.mk                          |  11 +-
>   5 files changed, 22 insertions(+), 175 deletions(-)
>   delete mode 100644 package/gpsd/0001-Fix-errors-during-gpsd-3.20-cross-compilation.patch
> 

[...]

> diff --git a/package/gpsd/gpsd.hash b/package/gpsd/gpsd.hash
> index af53fc05bf..1888881942 100644
> --- a/package/gpsd/gpsd.hash
> +++ b/package/gpsd/gpsd.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256	172a7805068eacb815a3c5225436fcb0be46e7e49a5001a94034eac43df85e50	gpsd-3.20.tar.gz
> +sha256	65504c3af8d3b0cce3c07405b8815d7730d2d2be2da7d28d275f1a9c57c6fe91	gpsd-3.21.tar.gz
>   sha256	13ba6fe5b2f41f03b854f9ac5f271e116d5ed55890cc20f5fe44dcfa0dc5958b	COPYING

The COPYING file has changed since 3.20 (see 
https://gitlab.com/gpsd/gpsd/-/commit/0e40daf5e7b8d9686cf34a1b492205aab90b0328), 
and its hash is no longer valid:

$ ./utils/test-pkg -p gpsd -n 1
                              br-arm-full [1/1]: FAILED
$ tail ~/br-test-pkg/br-arm-full/logfile
 >>> gpsd 3.21 Collecting legal info
ERROR: COPYING has wrong sha256 hash:
ERROR: expected: 
13ba6fe5b2f41f03b854f9ac5f271e116d5ed55890cc20f5fe44dcfa0dc5958b
ERROR: got     : 
fdf339997bbca9eaf507476b82fbcac608fc39a3d89b86b51e16db4c9f933716

Regards,
Titouan
