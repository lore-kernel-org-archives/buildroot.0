From: Nathaniel Roach <nroach44@gmail.com>
Date: Tue, 19 Aug 2014 21:28:59 +0800
Subject: [Buildroot] [PATCH 1/1] package/bandwidthd: improve configure
 check for zlib and libusb.
In-Reply-To: <1408394513-5177-1-git-send-email-romain.naour@openwide.fr>
References: <1408394513-5177-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <53F3511B.70104@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/08/14 04:41, Romain Naour wrote:> The configure script doesn't
check for zlib, then -lz is missing during libpng
> test.
> The first patch add this check.
>
> If the libpcap is linked with libusb, then the libpcap check fail because
> -lusb-1.0 is missing.
> Also -lpthread need to be added since libusb depends on threads support.
> The second patch add -lusb-1.0 and -lpthread only if libusb is present.
>
> Tested with and without libusb support.
>
> Fixes:
>
http://autobuild.buildroot.net/results/37a/37a94e0f2d3faa0aec9c488e987cfff706fc9f3b/build-end.log
>
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Cc: Nathaniel Roach <nroach44@gmail.com>
--- snip ---
> +
>
 Thanks Romain, your help has been instrumental in getting this stuff
fixed. Because I maintain the fork that buildroot uses in addition to
the buildroot package, I can put these fixes in upstream without adding
complexity to buildroot.

Could you do one last test using v2.0.1-auto-r09 as the version?
Hopefully this solves the dependency issues and it removes the need for
--without-x.

Thanks, Nathaniel.
