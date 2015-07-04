From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 4 Jul 2015 19:51:30 +0200
Subject: [Buildroot] [PATCH v6 14/16] package/opencv: add gtk3 support
In-Reply-To: <20150626230043.GI12470@free.fr>
References: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
 <1435262397-888-15-git-send-email-s.martin49@gmail.com>
 <20150626230043.GI12470@free.fr>
Message-ID: <CAHXCMML8NFSO8dMdUcVwm4GkWb_RV1iCuTtC4dPw7znR1NFGsw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sat, Jun 27, 2015 at 1:00 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[...]
>>  ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK),y)
>>  OPENCV_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=ON
>>  OPENCV_DEPENDENCIES += libgtk2
>> -else
>> -OPENCV_CONF_OPTS += -DWITH_GTK=OFF
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK3),y)
>> +OPENCV_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=OFF
>> +OPENCV_DEPENDENCIES += libgtk3
>>  endif
>
> So, have you tried a build with both gtk2 and gtk3 enabled, but with
> OpenCV using gtk2?

Yes I did and it works as expected :-)

Regards,

-- 
Samuel
