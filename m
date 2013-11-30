From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 30 Nov 2013 22:26:54 +0100
Subject: [Buildroot] [PATCHv2] e2fsprogs: Install libraries to staging
In-Reply-To: <20131128192305.154ec187@skate>
References: <1385661237-13975-1-git-send-email-daniel.nystrom@timeterminal.se>
 <20131128192305.154ec187@skate>
Message-ID: <529A581E.1040106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/11/13 19:23, Thomas Petazzoni wrote:
> Dear Daniel Nystr?m,
>
> On Thu, 28 Nov 2013 18:53:57 +0100, Daniel Nystr?m wrote:
>> Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
>> ---
>>   package/e2fsprogs/e2fsprogs.mk | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
>> index 0670c74..31e671b 100644
>> --- a/package/e2fsprogs/e2fsprogs.mk
>> +++ b/package/e2fsprogs/e2fsprogs.mk
>> @@ -8,6 +8,8 @@ E2FSPROGS_VERSION = 1.42.8
>>   E2FSPROGS_SITE = http://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v$(E2FSPROGS_VERSION)
>>   E2FSPROGS_LICENSE = GPLv2, libuuid BSD-3c, libss and libet MIT-like with advertising clause
>>   E2FSPROGS_LICENSE_FILES = COPYING lib/uuid/COPYING lib/ss/mit-sipb-copyright.h lib/et/internal.h
>> +E2FSPROGS_INSTALL_STAGING = YES
>> +E2FSPROGS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install-libs
>
> I must say I'd like to know *why* the normal "install" rule does not
> install the .pc file. It seems to install everything else, including
> the libraries, but not the .pc file, for some reason.

  I would actually prefer an (upstreamable) patch to e2fsprogs that fixes 
the install rule, rather than overriding the install commands.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
