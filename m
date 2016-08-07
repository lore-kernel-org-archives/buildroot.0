From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 7 Aug 2016 19:06:49 +0200
Subject: [Buildroot] cmake Release build overwrites Os
In-Reply-To: <20160807164032.GL22524@waldemar-brodkorb.de>
References: <20160807164032.GL22524@waldemar-brodkorb.de>
Message-ID: <CAHXCMM+4ZYp8hJZanWYEGWYV_Uhvm836GxHY77ui8oCNDgOtkQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar, all,

On Sun, Aug 7, 2016 at 6:40 PM, Waldemar Brodkorb <wbx@openadk.org> wrote:
> Hi,
>
> while doing the m68k patch for assimp, I realized that following is
> used to configure cmake based packages:
> package/pkg-cmake.mk:           -DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),RelWithDebInfo,Release)
>
> This means that Cmake adds -O3 to the CFLAGS/CXXFLAGS _after_ -Os
> and so get used.
>
> Is this the correct behaviour or do I missed something?
>
Hum... IMHO, the current behavior is not right :-/

It should be something like (not tested at all):
-DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),RelWithDebInfo,$$(if
$$(BR2_OPTIMIZE_S),MinSizeRel,Release))

Regards,

> best regards
>  Waldemar
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Samuel
