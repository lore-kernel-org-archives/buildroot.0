From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Mar 2016 17:53:42 +0200
Subject: [Buildroot] [PATCH v2 06/18] package/opencv3: bump version
	to	3.1.0
References: <1459070223-5901-1-git-send-email-bernd.kuhls@t-online.de>
 <1459070223-5901-7-git-send-email-bernd.kuhls@t-online.de>
 <CAHXCMMLcd313SJ-JMVRoS4UOhH_FG79g5yv463Y6r4EwgKfrMg@mail.gmail.com>
Message-ID: <69clscxmj.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

Am Sun, 27 Mar 2016 15:05:42 +0200 schrieb Samuel Martin:

> I would move at least the WITH_VA option somewhere else

ok.

>> -       -DWITH_OPENGL=OFF \
>> -       -DWITH_OPENMP=OFF \
> AFAICS, these 2 options still exist (see [2,3]).

Yes, and they are used later on in opencv3.mk:

ifeq ($(BR2_PACKAGE_OPENCV3_WITH_OPENGL),y)
OPENCV3_CONF_OPTS += -DWITH_OPENGL=ON
OPENCV3_DEPENDENCIES += libgl
else
OPENCV3_CONF_OPTS += -DWITH_OPENGL=OFF
endif

OPENCV3_CONF_OPTS += -DWITH_OPENMP=$(if $(BR2_GCC_ENABLE_OPENMP),ON,OFF)

Is there a reason why they are disabled in the first place?

Regards, Bernd
