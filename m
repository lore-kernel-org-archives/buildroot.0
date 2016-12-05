From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 5 Dec 2016 14:20:43 +0100
Subject: [Buildroot] [PATCH 1/1] nginx-dav-ext: New package
In-Reply-To: <20161205121442.51bb6c46@free-electrons.com>
References: <1480438071-11906-1-git-send-email-johan.oudinet@gmail.com>
 <20161204235230.4be68e7c@free-electrons.com>
 <CAJtjsKY2yT_EekNg2F_-K-PyLN5Zp47ykhRwVK4Kg3PixY4K9A@mail.gmail.com>
 <20161205121442.51bb6c46@free-electrons.com>
Message-ID: <CAJtjsKayVVJBRf+v1PYnL1hb6D5FqfqC1Y3pb9fGnkybf3bpAA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 5, 2016 at 12:14 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Seems like my changes broke the build:
>
>    http://autobuild.buildroot.net/?reason=nginx-1.10.2
>
> So, it might be that the location in which modules are added in
> nginx.mk might be important. Weird, because I did a number of test
> builds before pushing and never got a failure.
>
> Do you have the time to investigate? One of the failure,
> http://autobuild.buildroot.net/results/3c8/3c8798f122a421e8fae741de76b2504c20e2da91/build-end.log,
> is related to dav-ext.

Indeed, you have moved this module outside the HTTP modules:
ifeq ($(BR2_PACKAGE_NGINX_HTTP),y)
...
endif # BR2_PACKAGE_NGINX_HTTP

So now, linking fails if BR2_PACKAGE_NGINX_HTTP is not set.
Should I rename this package to nginx-http-dav-ext to indicate it must
be compiled with the HTTP server of nginx?

-- 
Johan
