From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Wed, 12 Jul 2017 16:04:36 -0700
Subject: [Buildroot] [PATCH] package/qt5: bump latest version to 5.9.1
In-Reply-To: <69cf264e-bb78-3823-e165-5a3378806741@microchip.com>
References: <1499796056-841-1-git-send-email-joshua.henderson@microchip.com>
 <7248234a-60d3-3bf5-0954-ff0442609136@mind.be>
 <69cf264e-bb78-3823-e165-5a3378806741@microchip.com>
Message-ID: <4fa3475a-2ba2-43e5-89cb-fba66a1a99b6@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

>>> +ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
>>> +#  * -system-pcre because pcre is mandatory to build Qt, and we
>>> +#    want to use the one packaged in Buildroot
>>> +#    with Qt5.9 pcre should be > 10.20 (pcre2)
>>> +QT5BASE_CONFIGURE_OPTS += -system-pcre
>>
>>  So this option no longer exists in 5.9.1? Then it should be removed from line
>> 26, as well as the comment there.
>>
> 
> I will double check with 5.9.1, but this was originally found to be removed in
> some version of QT between 5.8.0 and 5.9.1.
> 

Upon further inspection, my statement above is wrong.  The global configure opts are
already:

    QT5BASE_CONFIGURE_OPTS += \
            -optimized-qmake \
            -no-cups \
            -no-iconv \
            -system-zlib \
            -system-pcre \
            -no-pch \
            -shared

Meaning, there is no need to conditionally set -system-pcre later for any version. That
addition to set it for 5.6 will be removed.

Josh
