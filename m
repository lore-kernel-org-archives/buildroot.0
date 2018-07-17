From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 17 Jul 2018 13:30:08 +0200
Subject: [Buildroot] [PATCH] package/binutils: add binutils version 2.31
In-Reply-To: <20180717120806.5be54c85@windsurf>
References: <20180716213010.29310-1-romain.naour@gmail.com>
 <20180717120806.5be54c85@windsurf>
Message-ID: <0d2afb3c-fe85-057a-4ad3-5744eb397d6e@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 17/07/2018 ? 12:08, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Mon, 16 Jul 2018 23:30:10 +0200, Romain Naour wrote:
>> https://sourceware.org/ml/binutils/2018-07/msg00213.html
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> ---
>>  package/binutils/2.31/0001-sh-conf.patch           |  48 ++++
>>  package/binutils/2.31/0002-ld-makefile.patch       |  41 +++
>>  .../2.31/0003-check-ldrunpath-length.patch         |  36 +++
>>  .../2.31/0004-add-sysroot-fix-from-bug-3049.patch  |  51 ++++
>>  .../2.31/0005-poison-system-directories.patch      | 306 +++++++++++++++++++++
>>  ...location-where-GOT-information-is-collect.patch | 198 +++++++++++++
>>  ...bustness.-Return-FALSE-in-case-of-NULL-po.patch |  35 +++
>>  ...lobal-symbol-is-not-an-indirect-or-warnin.patch |  43 +++
>>  ...tion-was-still-being-generated-when-symbo.patch |  37 +++
>>  package/binutils/Config.in.host                    |   4 +
>>  package/binutils/binutils.hash                     |   1 +
>>  11 files changed, 800 insertions(+)
>>  create mode 100644 package/binutils/2.31/0001-sh-conf.patch
>>  create mode 100644 package/binutils/2.31/0002-ld-makefile.patch
>>  create mode 100644 package/binutils/2.31/0003-check-ldrunpath-length.patch
>>  create mode 100644 package/binutils/2.31/0004-add-sysroot-fix-from-bug-3049.patch
>>  create mode 100644 package/binutils/2.31/0005-poison-system-directories.patch
>>  create mode 100644 package/binutils/2.31/0006-Refactored-location-where-GOT-information-is-collect.patch
>>  create mode 100644 package/binutils/2.31/0007-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch
>>  create mode 100644 package/binutils/2.31/0008-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch
>>  create mode 100644 package/binutils/2.31/0009-PLT-information-was-still-being-generated-when-symbo.patch
> 
> Applied to master, thanks. Could you as follow-up patches set binutils
> 2.30 as the default version, and drop the oldest binutils version we
> support ?

I'll do it, but we have to be careful with arm thumb/thumb2 dependencies.
ADR and ADRl pseudo-ops are still broken for Binutils 2.29 and 2.30. I'm not
sure if it's necessary to backport the fix since we have now binutils 2.31.

> 
> Also, I'm surprised that we still have all those ARC binutils patches,
> which should have been upstream. Could you get in touch with the
> Synopsys guys and see what's going on with those patches ?

I'm adding Alexey in Cc :)

Best regards,
Romain

> 
> Thanks a lot!
> 
> Thomas
> 
