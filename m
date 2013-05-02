From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 May 2013 12:01:20 +0200
Subject: [Buildroot] [PATCH v6 6/7] arch: toolchain: Install blackfin
 FDPIC and FLAT libraries in external toolchain makefile.
In-Reply-To: <CAJxxZ0M4jZccZF3i3OM8-B7bWT1NzEXf62qsKEg4-wfAJqjnJA@mail.gmail.com>
References: <1366279592-9055-1-git-send-email-sonic.adi@gmail.com>
 <1366279592-9055-6-git-send-email-sonic.adi@gmail.com>
 <CAJxxZ0M4jZccZF3i3OM8-B7bWT1NzEXf62qsKEg4-wfAJqjnJA@mail.gmail.com>
Message-ID: <20130502120120.5fd9b4e0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Thu, 2 May 2013 15:36:11 +0800, Sonic Zhang wrote:

> ---------------------------------
> config BR2_BFIN_INSTALL_FLAT_SHARED
>        bool "Install FLAT shared libraries"
>        depends on BR2_bfin && !BR2_BINFMT_FLAT_SHARED
>        default y if BR2_BINFMT_FLAT_SHARED
> ---------------------------------
> 
> doesn't work. In the later case, if BR2_BINFMT_FLAT_SHARED is
> selected, option BR2_BFIN_INSTALL_FLAT_SHARED is not set to y by
> default. Only the former case works correctly.

Wasn't my suggestion:

config BR2_BFIN_INSTALL_FLAT_SHARED
        bool "Install FLAT shared libraries" if !BR2_BINFMT_FLAT_SHARED
        depends on BR2_bfin
        default y if BR2_BINFMT_FLAT_SHARED

So: option enabled by default when BR2_BINFMT_FLAT_SHARED, and the
prompt is shown to optionally enable/disable it when
BR2_BINFMT_FLAT_SHARED is not selected.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
