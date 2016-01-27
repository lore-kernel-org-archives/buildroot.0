From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 27 Jan 2016 21:17:40 +0100
Subject: [Buildroot] [PATCH 1/2] package/kodi: not available using a
 musl-based toolchain
References: <1453848286-2477-1-git-send-email-bernd.kuhls@t-online.de>
 <20160127092255.75c83958@free-electrons.com>
Message-ID: <48lnncxqr3.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 27 Jan 2016 09:22:55 +0100 schrieb Thomas Petazzoni:

> Dear Bernd Kuhls,
> 
> On Tue, 26 Jan 2016 23:44:45 +0100, Bernd Kuhls wrote:
>> The build stops with configure: error: unsupported host
>> (i586-buildroot-linux-musl)
>> due to musl not being supported in
>> https://github.com/xbmc/xbmc/blob/Isengard/m4/xbmc_arch.m4
>> 
>> Signed-off-by: Bernd Kuhls
>> <bernd.kuhls@t-online.de>
> 
> And what happens if you add an additional case to support musl ?

Hi Thomas,

the build will fail:

In file included from emu_msvcrt.cpp:64:0:
emu_msvcrt.h:93:3: error: ?__off64_t? does not name a type
   __off64_t dll_lseeki64(int fd, __off64_t lPos, int iWhence);
   ^
emu_msvcrt.h:94:3: error: ?__off_t? does not name a type
   __off_t dll_lseek(int fd, __off_t lPos, int iWhence);
   ^

I know these problems are fixable and the voidlinux projects seems to 
have done it already for 15.2-Isengard: https://github.com/voidlinux/void-
packages/tree/99f74705bc6520297d689fae4bcc9606c71ad34f/srcpkgs/kodi/
patches

Since Kodi 16.0-Jarvis is already at rc1 stage and the 15.x-branch being 
closed upstream as "final"[1] version I will put no effort providing a 
musl-compilable package for the current Kodi package, hence my patch ;)

Regards, Bernd

[1] https://github.com/xbmc/xbmc/commits/Isengard
