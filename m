From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Fri, 17 Jun 2011 13:30:53 +0200
Subject: [Buildroot] [PATCH] Qt: add config option to build
 libQtDeclarative module
In-Reply-To: <BANLkTikE-g_4XiWxipaqO+PYQJy9Et8GiQ@mail.gmail.com>
References: <1306858594-28995-1-git-send-email-zonque@gmail.com>
 <BANLkTi=cj-ZdHnL7iKo6aMVXTbMra4w-ug@mail.gmail.com>
 <BANLkTikE-g_4XiWxipaqO+PYQJy9Et8GiQ@mail.gmail.com>
Message-ID: <BANLkTik8_91acRg=+G-h7a2Z-EyWOJqmvg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for this patch, Daniel. Can't see any obvious errors (and
support for QtDeclaratives is very appreciated), so acking this:

Acked-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>



2011/6/17 Daniel Mack <zonque@gmail.com>:
> ping ...
>
> On Tue, Jun 7, 2011 at 10:36 AM, Daniel Mack <zonque@gmail.com> wrote:
>> I just wanted to ping on this one.
>> I haven't contributed to BR2 for awhile, so I don't know who's able to
>> pick and commit this one?
>>
>> Thanks,
>> Daniel
>>
>>
>> On Tue, May 31, 2011 at 6:16 PM, Daniel Mack <zonque@gmail.com> wrote:
>>> Signed-off-by: Daniel Mack <zonque@gmail.com>
>>> ---
>>> ?package/qt/Config.in | ? ?7 +++++++
>>> ?package/qt/qt.mk ? ? | ? ?9 +++++++++
>>> ?2 files changed, 16 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/package/qt/Config.in b/package/qt/Config.in
>>> index 4a3945c..214f140 100644
>>> --- a/package/qt/Config.in
>>> +++ b/package/qt/Config.in
>>> @@ -378,4 +378,11 @@ config BR2_PACKAGE_QT_SCRIPTTOOLS
>>> ? ? ? ? ?Build the Qt Script Tools module.
>>> ? ? ? ? ?if unsure, say n.
>>>
>>> +config BR2_PACKAGE_QT_DECLARATIVE
>>> + ? ? ? bool "Declarative module"
>>> + ? ? ? depends on BR2_PACKAGE_QT_GUI_MODULE
>>> + ? ? ? help
>>> + ? ? ? ? Build the Qt Declarative Module for qml support
>>> + ? ? ? ? if unsure, say n.
>>> +
>>> ?endif # BR2_PACKAGE_QT
>>> diff --git a/package/qt/qt.mk b/package/qt/qt.mk
>>> index 8bcbd3f..e8b7a49 100644
>>> --- a/package/qt/qt.mk
>>> +++ b/package/qt/qt.mk
>>> @@ -398,6 +398,12 @@ else
>>> ?QT_CONFIGURE_OPTS += -no-stl
>>> ?endif
>>>
>>> +ifeq ($(BR2_PACKAGE_QT_DECLARATIVE),y)
>>> +QT_CONFIGURE_OPTS += -declarative
>>> +else
>>> +QT_CONFIGURE_OPTS += -no-declarative
>>> +endif
>>> +
>>> ?# ccache and precompiled headers don't play well together
>>> ?ifeq ($(BR2_CCACHE),y)
>>> ?QT_CONFIGURE_OPTS += -no-pch
>>> @@ -535,6 +541,9 @@ endif
>>> ?ifeq ($(BR2_PACKAGE_QT_SCRIPTTOOLS),y)
>>> ?QT_INSTALL_LIBS ? ?+= QtScriptTools
>>> ?endif
>>> +ifeq ($(BR2_PACKAGE_QT_DECLARATIVE),y)
>>> +QT_INSTALL_LIBS ? ?+= QtDeclarative
>>> +endif
>>> ?ifeq ($(BR2_PACKAGE_QT_QT3SUPPORT),y)
>>> ?QT_INSTALL_LIBS ? ?+= Qt3Support
>>> ?endif
>>> --
>>> 1.7.5.1
>>>
>>>
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
