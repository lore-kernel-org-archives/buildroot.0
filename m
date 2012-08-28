From: Stephan Hoffmann <sho@relinux.de>
Date: Tue, 28 Aug 2012 08:39:18 +0200
Subject: [Buildroot] qmake -o Makefile cannot create Makefile
In-Reply-To: <CAAfyv342h_ci-sW2MPR6SeUAk0dgQnF0fc7iYEwE56rZS2hYtw@mail.gmail.com>
References: <CAAfyv35hHwKR9v4-7OtqQhy6p4B7dkCnr0ED6pDG4aUuota=YQ@mail.gmail.com>
 <201208272259.04188.yann.morin.1998@free.fr>
 <CAAfyv342h_ci-sW2MPR6SeUAk0dgQnF0fc7iYEwE56rZS2hYtw@mail.gmail.com>
Message-ID: <503C6796.7020103@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 27.08.2012 23:04, schrieb Belisko Marek:
> On Mon, Aug 27, 2012 at 10:59 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> Belisko, All,
>>
>> On Monday 27 August 2012 22:46:35 Belisko Marek wrote:
>>
>> I think you should write it that way (untested!):
>>
>> define SONG_CONFIGURE_CMDS
>>         cd $(@D); \
>>         $(HOST_DIR)/usr/bin/qmake -o Makefile -v songPresentation.pro
>> endef
> Doesn't work in both ways but finally works this way:
> define SONG_CONFIGURE_CMDS
>        cd $(@D); \
>        $(HOST_DIR)/usr/bin/qmake
> endef
I am using

    cd $(@D) && $(QT_QMAKE)

since QT_QMAKE is defined when QT is built by buildroot.

Regards

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
