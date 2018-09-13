From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 13 Sep 2018 08:09:40 +0200
Subject: [Buildroot] [PATCH/next v2 2/3]
 package/perl-crypt-openssl-random: bump version to 0.15
References: <20180821204134.2819-1-bernd.kuhls@t-online.de>
 <20180821204134.2819-2-bernd.kuhls@t-online.de>
 <20180912163906.013b75f7@windsurf>
Message-ID: <4ibp6fxp95.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 12 Sep 2018 16:39:06 +0200 schrieb Thomas Petazzoni:

> Hello,
> 
> On Tue, 21 Aug 2018 22:41:33 +0200, Bernd Kuhls wrote:
>> Changelog:
>> https://metacpan.org/changes/distribution/Crypt-OpenSSL-Random
>> 
>> Added new build dependency to host-perl-crypt-openssl-guess and force
>> it to search for openssl in STAGING_DIR. Added license hash.
>> 
>> Signed-off-by: Bernd Kuhls
>> <bernd.kuhls@t-online.de>
> 
> This update is causing issues in the autobuilders:
> http://autobuild.buildroot.net/?reason=perl-crypt-openssl-random-0.15.
> Since it's only happening since September 9, even though the commit was
> made on August 22, maybe the root issue is due to another update/change,
> but it breaks this package.

Hi Thomas,

I can not reproduce the problem with this defconfig
http://autobuild.buildroot.net/results/54f/
54f274f33e5221d6979c6c0ad9b5633a1869b204/

xlocale.h is present:

$ find output/staging/usr/include/ | grep xlocale
output/staging/usr/include/xlocale.h

But it is weird that the autobuilder build uses perl.h from output/host

/usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/host/lib/
perl5/5.26.2/x86_64-linux/CORE/perl.h:738:13: fatal error: xlocale.h: No 
such file or directory
 #   include <xlocale.h>

instead of staging... But again, the build works on my machine.

Regards, Bernd
