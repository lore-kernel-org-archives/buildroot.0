From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Mon, 18 May 2015 09:31:44 -0500
Subject: [Buildroot] [PATCH v5 09/24] busybox: selinux support
In-Reply-To: <20150518163017.2d87c2a7@free-electrons.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1431553177-7280-10-git-send-email-clayton.shotwell@rockwellcollins.com>
 <CAHXCMM+9VKZ=i_=QZtLGjA3P=kuFbJDQhBiom10_80ahKjk1ZQ@mail.gmail.com>
 <CANn-YGQn8EmFxguMC_0+5037zXTaRFHCYL5JL5FumaTEar7myg@mail.gmail.com>
 <20150518163017.2d87c2a7@free-electrons.com>
Message-ID: <CANn-YGRKoBk3oxxjv7mPWhpdY0iH4j-4+F+EwxVh9b-4PNihtQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, May 18, 2015 at 9:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Clayton Shotwell,
>
> On Mon, 18 May 2015 09:14:54 -0500, Clayton Shotwell wrote:
>
>> >> +config BR2_PACKAGE_BUSYBOX_SELINUX
>> >> +       select BR2_PACKAGE_LIBSELINUX
>> >> +       depends on BR2_TOOLCHAIN_HAS_THREADS
>> >> +       depends on !BR2_STATIC_LIBS
>> >> +       bool "Enable SELinux support"
>> > Does not this option also need to select
>> > BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES?
>>
>> Those features are not necessarily dependent, it mostly depends on
>> what parts of busybox are being used. For instance, if a configuration
>> only used a couple of minor busybox features, such as simple command
>> line utilities, the symlinked version of busybox could be used to save
>> space. If busybox was providing more features, such as crond, then
>> individual binaries would have to be enabled for the SELinux type
>> transitions to occur properly. I would like to leave that up to the
>> individual user to enable the individual binaries as needed.
>
> Then exactly this needs to be copy/pasted in the help text of this
> option :-)

Good point. I'll add that in there.

Thanks,
Clayton
