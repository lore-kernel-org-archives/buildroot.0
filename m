From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Nov 2017 13:31:40 +0100
Subject: [Buildroot] [PATCH v2 1/1] zlib-ng: new package
In-Reply-To: <1509858069-12976-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1509858069-12976-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <20171125133140.68d1bd5a@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  5 Nov 2017 05:01:09 +0000, Stefan Fr?berg wrote:

>  package/Config.in            |  1 +
>  package/zlib-ng/Config.in    |  7 +++++++
>  package/zlib-ng/zlib-ng.hash | 10 ++++++++++
>  package/zlib-ng/zlib-ng.mk   | 13 +++++++++++++
>  4 files changed, 31 insertions(+)

You forgot to update the DEVELOPERS file.

However, there is a bigger problem: zlib-ng overwrites zlib. I.e, both
install the same libz.so and libz.so.1 libraries.

So installing both packages at the same time does not make sense. So,
we need to do something like jpeg/libjpeg/jpeg-turbo.

Could you look into doing this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
