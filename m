From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Fri, 10 Jul 2015 12:56:38 -0500
Subject: [Buildroot] [PATCH v7 08/22] busybox: selinux support
In-Reply-To: <CAHXCMMJkfEGqWFtW02iKWL3KEy7xFU=MLa=trcEkfMaL_WLk3g@mail.gmail.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1433251718-3167-9-git-send-email-clayton.shotwell@rockwellcollins.com>
 <CAHXCMMJkfEGqWFtW02iKWL3KEy7xFU=MLa=trcEkfMaL_WLk3g@mail.gmail.com>
Message-ID: <CANn-YGQ2wx_oOkf1HHpvEbziarsf6hw818t+0er3gCagbCXbPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel,

On Sat, Jun 20, 2015 at 11:23 AM, Samuel Martin <s.martin49@gmail.com> wrote:
> Hi Clayton,
>
> On Tue, Jun 2, 2015 at 3:28 PM, Clayton Shotwell
> <clayton.shotwell@rockwellcollins.com> wrote:
> [...]
>> diff --git a/package/busybox/Config.in b/package/busybox/Config.in
>> index feed560..e345d66 100644
>> --- a/package/busybox/Config.in
>> +++ b/package/busybox/Config.in
>> @@ -41,6 +41,23 @@ comment "Busybox individual binaries depends on dynamic libraries"
>>         depends on BR2_STATIC_LIBS
>>         depends on BR2_bfin
>>
>> +config BR2_PACKAGE_BUSYBOX_SELINUX
>> +       select BR2_PACKAGE_LIBSELINUX
>> +       depends on BR2_TOOLCHAIN_HAS_THREADS
>> +       depends on !BR2_STATIC_LIBS
>> +       bool "Enable SELinux support"
>> +       help
>> +         Enable SELinux support in BusyBox. Please note that depending on
>> +         you BusyBox config and the SELinux policy implementation, you may
> s/you BusyBox/your BusyBox/
> s/ config / configuration /

I'll get those fixed.

>> +         want to also enable BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES.
>> +
>> +         For instance, if your BusyBox configuration only uses a couple of
>> +         minor BusyBox features, such as simple command line utilities, the
>> +         symlinked version of BusyBox can be used to save space. If BusyBox
>> +         provides more features, such as crond, then individual binaries
>> +         have to be enabled for the SELinux type transitions to occur properly.
>> +
>> +
> nitpicking: one blank line is enough... ;-)

Good catch. I appreciate the nitpicks.

Thanks,
Clayton

Clayton Shotwell
Senior Software Engineer, Rockwell Collins
clayton.shotwell at rockwellcollins.com
