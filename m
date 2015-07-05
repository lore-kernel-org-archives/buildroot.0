From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 5 Jul 2015 11:31:40 +0200
Subject: [Buildroot] [PATCH v7 5/7] package/opencv: add gtk3 support
In-Reply-To: <20150705092157.GE3647@free.fr>
References: <1436036821-10073-1-git-send-email-s.martin49@gmail.com>
 <1436036821-10073-6-git-send-email-s.martin49@gmail.com>
 <20150705092157.GE3647@free.fr>
Message-ID: <CAHXCMM+4hareKsrHU8txUt02Lffo_zDX6Y-agV8g0NiV9tY4Kw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, Jul 5, 2015 at 11:21 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Samuel, All,
>
> On 2015-07-04 21:06 +0200, Samuel Martin spake thusly:
>> Fully rework the GTK support in OpenCV because it now supports gtk-2 and
>> gtk-3 (but only one at the time).
>> Note that, in the build-system, the gtk support is only available when
>> Qt support is disabled; so make sure the menuconfig reflects this.
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> [--SNIP--]
>> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
>> index 79cf110..986e7b4 100644
>> --- a/package/opencv/opencv.mk
>> +++ b/package/opencv/opencv.mk
>> @@ -236,11 +236,18 @@ OPENCV_CONF_OPTS += -DWITH_GSTREAMER=ON -DWITH_GSTREAMER_0_10=OFF
>>  OPENCV_DEPENDENCIES += gstreamer1 gst1-plugins-base
>>  endif
>>
>> +ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK)$(BR2_PACKAGE_OPENCV_WITH_GTK3),)
>> +OPENCV_CONF_OPTS += -DWITH_GTK=OFF -DWITH_GTK_2_X=OFF
>> +endif
>> +
>>  ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK),y)
>>  OPENCV_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=ON
>
> So here, this is unlike the GST case, where we need GTK=ON whenever we
> want to have gtk support, which is gtk3 by default, unless GTK_2=ON is
> also specified, in which case it's gtk2.
>
> Right?
Exactly.

>
> If so:
>
>     Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks,

-- 
Samuel
