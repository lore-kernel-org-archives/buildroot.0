From: Sonic Zhang <sonic.adi@gmail.com>
Date: Thu, 2 May 2013 18:11:40 +0800
Subject: [Buildroot] [PATCH v6 6/7] arch: toolchain: Install blackfin
 FDPIC and FLAT libraries in external toolchain makefile.
In-Reply-To: <20130502120120.5fd9b4e0@skate>
References: <1366279592-9055-1-git-send-email-sonic.adi@gmail.com>
 <1366279592-9055-6-git-send-email-sonic.adi@gmail.com>
 <CAJxxZ0M4jZccZF3i3OM8-B7bWT1NzEXf62qsKEg4-wfAJqjnJA@mail.gmail.com>
 <20130502120120.5fd9b4e0@skate>
Message-ID: <CAJxxZ0NC2O2D5m4COx-r=-cT_TJoyGkXRxqNYXt-=7ze5+xcmg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, May 2, 2013 at 6:01 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Sonic Zhang,
>
> On Thu, 2 May 2013 15:36:11 +0800, Sonic Zhang wrote:
>
>> ---------------------------------
>> config BR2_BFIN_INSTALL_FLAT_SHARED
>>        bool "Install FLAT shared libraries"
>>        depends on BR2_bfin && !BR2_BINFMT_FLAT_SHARED
>>        default y if BR2_BINFMT_FLAT_SHARED
>> ---------------------------------
>>
>> doesn't work. In the later case, if BR2_BINFMT_FLAT_SHARED is
>> selected, option BR2_BFIN_INSTALL_FLAT_SHARED is not set to y by
>> default. Only the former case works correctly.
>
> Wasn't my suggestion:
>
> config BR2_BFIN_INSTALL_FLAT_SHARED
>         bool "Install FLAT shared libraries" if !BR2_BINFMT_FLAT_SHARED
>         depends on BR2_bfin
>         default y if BR2_BINFMT_FLAT_SHARED
>
> So: option enabled by default when BR2_BINFMT_FLAT_SHARED, and the
> prompt is shown to optionally enable/disable it when
> BR2_BINFMT_FLAT_SHARED is not selected.

In this way, the developer can disable the option
BR2_BFIN_INSTALL_FLAT_SHARED in share flat binary mode. This is
incorrect. My solution ensures the developer have no way to disable
BR2_BFIN_INSTALL_FLAT_SHARED when BR2_BINFMT_FLAT_SHARED is selected.

Regards,

Sonic
