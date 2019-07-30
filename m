From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Jul 2019 16:03:59 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5webengine: fix build error
In-Reply-To: <20190730115832.21008-1-b.bilas@grinn-global.com>
References: <20190730115832.21008-1-b.bilas@grinn-global.com>
Message-ID: <20190730160359.3f298606@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bartosz,

Thanks for your patch, see below for some questions.

On Tue, 30 Jul 2019 13:58:32 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> This commit adds a patch from upstream chromium
> and bumps required minimal gcc version to 8.
> 
> Fixes:
>   ../../3rdparty/chromium/third_party/skia/third_party/skcms/skcms.cc:1909:16:
>   note: in definition of macro 'NS'
>   #define NS(id) id
>                 ^~
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

Do we have any corresponding build failure in the autobuilders ? If so,
we like to have a reference to such build failures.

Also, why is the required gcc version now >= 8.x ? This is not really
explained in your commit log.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
