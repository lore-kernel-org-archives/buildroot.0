From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 Jan 2021 23:15:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/x264: bump version
In-Reply-To: <20210126200657.308062-1-bernd.kuhls@t-online.de>
References: <20210126200657.308062-1-bernd.kuhls@t-online.de>
Message-ID: <20210127221501.GM2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-01-26 21:06 +0100, Bernd Kuhls spake thusly:
> Reformatted hashes.
> 
> Switch _SITE according to
> http://download.videolan.org/x264/snapshots/x264-snapshot-20191218-README.txt
> 
> "The snapshotting service is discontinued.
> 
>  Please use https://code.videolan.org/videolan/x264/ to get the
>  tarballs."
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x264/x264.hash | 4 ++--
>  package/x264/x264.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/x264/x264.hash b/package/x264/x264.hash
> index 93242a46cc..cd9edb2bcb 100644
> --- a/package/x264/x264.hash
> +++ b/package/x264/x264.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256 0bb67d095513391e637b3b47e8efc3ba4603c3844f1b4c2690f4d36da7763055  x264-snapshot-20191217-2245.tar.bz2
> -sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
> +sha256  a8ba33e3621005ce10dc62c8e368abe6860dfbac4456af42f28c271c9ae1813e  x264-35417dcd65a57321fbadf98c9a4cff1cb741db4b.tar.gz
> +sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING

    $ make x264-source
    >>> x264 35417dcd65a57321fbadf98c9a4cff1cb741db4b Downloading
    --2021-01-27 23:09:00--  https://code.videolan.org/videolan/x264/-/archive/master/x264-35417dcd65a57321fbadf98c9a4cff1cb741db4b.tar.gz
    Resolving code.videolan.org (code.videolan.org)... 2a01:e0d:1:3:58bf:fa02:c0de:70, 213.36.253.9
    Connecting to code.videolan.org (code.videolan.org)|2a01:e0d:1:3:58bf:fa02:c0de:70|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: unspecified [application/octet-stream]
    Saving to: ?/home/ymorin/dev/buildroot/O/build/.x264-35417dcd65a57321fbadf98c9a4cff1cb741db4b.tar.gz.d64KJ6/output?

    /home/ymorin/dev/buildroot/O/build     [   <=>                                                        ] 915.24K  2.01MB/s    in 0.4s

    2021-01-27 23:09:00 (2.01 MB/s) - ?/home/ymorin/dev/buildroot/O/build/.x264-35417dcd65a57321fbadf98c9a4cff1cb741db4b.tar.gz.d64KJ6/output? saved [937201]

    ERROR: x264-35417dcd65a57321fbadf98c9a4cff1cb741db4b.tar.gz has wrong sha256 hash:
    ERROR: expected: a8ba33e3621005ce10dc62c8e368abe6860dfbac4456af42f28c271c9ae1813e
    ERROR: got     : 78b2fe56b6f9ee23458573cb2c503c5f9182b3c4362aae5ce50c83776766b653
    ERROR: Incomplete download, or man-in-the-middle (MITM) attack

> diff --git a/package/x264/x264.mk b/package/x264/x264.mk
> index 9d217d1912..3ac8e68fc8 100644
> --- a/package/x264/x264.mk
> +++ b/package/x264/x264.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -X264_VERSION = 20191217-2245
> -X264_SITE = http://download.videolan.org/x264/snapshots
> -X264_SOURCE = x264-snapshot-$(X264_VERSION).tar.bz2
> +X264_VERSION = 35417dcd65a57321fbadf98c9a4cff1cb741db4b
> +X264_SITE = https://code.videolan.org/videolan/x264/-/archive/master
> +X264_SOURCE = x264-$(X264_VERSION).tar.gz

    $ make check-package
    package/x264/x264.mk:9: remove default value of _SOURCE variable (http://nightly.buildroot.org/#generic-package-reference)

I am more concerned about the hash mismatch, though.

Do we know if Gitlab-CE instances provide reproducible archives at all?

That is one of the reasons that I really prefer that we use the git
download method, rather than let the remote server generate an
archive, especially now since we have git caching...

Regards,
Yann E. MORIN.

>  X264_LICENSE = GPL-2.0+
>  X264_DEPENDENCIES = host-pkgconf
>  X264_LICENSE_FILES = COPYING
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
