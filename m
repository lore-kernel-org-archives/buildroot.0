From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 24 May 2017 21:41:42 +0200
Subject: [Buildroot] [PATCH 1/2] package/sngrep: add libgcrypt missing
 dependencies
In-Reply-To: <20170524084439.56e64c59@free-electrons.com>
References: <20170520162751.30809-1-romain.naour@gmail.com>
 <20170523161950.2b24f43f@free-electrons.com>
 <f09dc6c1-557c-885b-4bb9-370a1ca9b8ae@gmail.com>
 <20170524084439.56e64c59@free-electrons.com>
Message-ID: <cc45b380-dbda-98f0-0fab-e7f8adbb75da@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 24/05/2017 ? 08:44, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Tue, 23 May 2017 23:09:19 +0200, Romain Naour wrote:
> 
>> I was looking for this kind of build failure with a glibc based system:
>>
>> checking for ncurses.h... yes
>> checking for initscr in -lncurses... yes
>> checking for new_panel in -lpanel... yes
>> checking for new_form in -lform... yes
>> checking for new_item in -lmenu... yes
>> checking for gnutls_init in -lgnutls... yes
>> checking for gcry_md_map_name in -lgcrypt... no
>> configure: error:  You need to have libgcrypt installed to compile sngrep
>>
>> I just read what I wanted to read in the autobuilder reference...
>>
>> It's weird that the autobuilder didn't catch it.
> 
> So in other words, there are no autobuilder reference for the build
> failure you are fixing? If so, could you add in the commit log a
> minimal defconfig that exhibits the issue?

Exactly...

Here the minimal defconfig:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_NEON=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_GNUTLS=y
BR2_PACKAGE_LIBGCRYPT=y
BR2_PACKAGE_SNGREP=y

Best regards,
Romain

> 
> Thanks!
> 
> Thomas
> 
