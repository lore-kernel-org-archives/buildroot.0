From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Nov 2013 18:50:35 +0100
Subject: [Buildroot] Autobuilder site back online
In-Reply-To: <20131117172917.GB4425@free.fr>
References: <20131116223632.462c6e60@skate>
 <20131117172917.GB4425@free.fr>
Message-ID: <20131117175034.GC4425@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-11-17 18:29 +0100, Yann E. MORIN spake thusly:
> Here are a few analysis of some of the build failures:

Here are a few more (note: I'm only doing analysis for now):

http://autobuild.humanoidz.org/results/5f7/5f7003615207adc737c482edc8271557d9f2ce79/
  -> valloc missing
  -> config is using uClibc snapshot
  -> since e806570 (2013-04-04), valloc is hidden behind SUSV2_LEGACY
     which is missing from our uclibc-snapshot.config

http://autobuild.humanoidz.org/results/6d4/6d4c476421b2a2620c52b4cfc6189f65325ee026/
  -> error: conversion to 'unsigned int' from 'long unsigned int' may
     alter its value [-Werror=conversion]
  -> cc1plus: all warnings being treated as errors
  -> ola code is not 64-bit clean

http://autobuild.humanoidz.org/results/95f/95fe1ed8b2e51e7eb1712958d9e4d891bb38e35b/
  -> gzip: /home/test/test/2/dl/aiccu_20070115.tar.gz: not in gzip format
  -> the file is 6.4KiB in size, which is wrong
  -> downloaded from here, the file is 68KiB, and is a correct .tar.gz
  -> spurious network/server error?

http://autobuild.humanoidz.org/results/a50/a5078a8759242ac8198bf55fe6c61da3c793522c/
  -> error: #warning requested reentrant code, but thread support was
     disabled [-Werror=cpp]
  -> but BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS is not set
  -> libpfm4-4.3.0 needs threads?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
