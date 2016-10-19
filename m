From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 19 Oct 2016 15:41:54 +0200
Subject: [Buildroot] [PATCH V2,
	1/1] Fix: qt5webkit overwrites target python.
In-Reply-To: <20161019150115.5f331124@free-electrons.com>
References: <1476877746-13572-1-git-send-email-johanderycke@gmail.com>
 <20161019150115.5f331124@free-electrons.com>
Message-ID: <CAGm1_kuZamZ0mAJQ-ZaFGVq+MQy3Gky1qw6te-G7A2DSBJtEcw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 19, 2016 at 3:01 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 19 Oct 2016 13:49:06 +0200, johanderycke at gmail.com wrote:
>> From: Johan Derycke <johan.derycke@barco.com>
>>
>> Signed-off-by: Johan Derycke <johan.derycke@barco.com>

Tested-by: Yegor Yefremov <yegorslists@googlemail.com>

> This really requires a more detailed commit log.
>
>> -QT5WEBKIT_ENV = PATH=$(@D)/bin:$(BR_PATH)
>> +QT5WEBKIT_ENV = PATH=$(@D)/host-bin:$(BR_PATH)
>>  define QT5WEBKIT_PYTHON2_SYMLINK
>> -     mkdir -p $(@D)/bin
>> -     ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/bin/python
>> +     mkdir -p $(@D)/host-bin
>> +     ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/host-bin/python
>>  endef
>
> Otherwise, this looks good.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
