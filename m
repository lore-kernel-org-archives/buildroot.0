From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 27 Aug 2012 23:04:22 +0200
Subject: [Buildroot] qmake -o Makefile cannot create Makefile
In-Reply-To: <201208272259.04188.yann.morin.1998@free.fr>
References: <CAAfyv35hHwKR9v4-7OtqQhy6p4B7dkCnr0ED6pDG4aUuota=YQ@mail.gmail.com>
 <201208272259.04188.yann.morin.1998@free.fr>
Message-ID: <CAAfyv342h_ci-sW2MPR6SeUAk0dgQnF0fc7iYEwE56rZS2hYtw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 27, 2012 at 10:59 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Belisko, All,
>
> On Monday 27 August 2012 22:46:35 Belisko Marek wrote:
>> I'm trying to add qt based application to be compiled in buildroot.
>> App is using qmake infrastructure which is not supported in BR.
>>
>> I just want to hack it somehow so choose generic-package and plan use configure
>> step to generate Makefile with qmake (then continue with Makefile).
>>
>> mk file:
>> +#############################################################
>> +#
>> +# song
>> +#
>> +#############################################################
>> +
>> +SONG_VERSION = master
>> +SONG_SITE    = https://github.com/nandra/songPresentation.git
>> +SONG_SITE_METHOD = git
>> +
>> +define SONG_CONFIGURE_CMDS
>> +     $(HOST_DIR)/usr/bin/qmake -o Makefile -v $(@D)/songPresentation.pro
>> +endef
>
> I think you should write it that way (untested!):
>
> define SONG_CONFIGURE_CMDS
>         cd $(@D); \
>         $(HOST_DIR)/usr/bin/qmake -o Makefile -v songPresentation.pro
> endef
Doesn't work in both ways but finally works this way:
define SONG_CONFIGURE_CMDS
       cd $(@D); \
       $(HOST_DIR)/usr/bin/qmake
endef

>
> or maybe:
>
> define SONG_CONFIGURE_CMDS
>         cd $(@D) && \
>         $(HOST_DIR)/usr/bin/qmake -o Makefile -v songPresentation.pro
> endef
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

Regards,

mbe

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
