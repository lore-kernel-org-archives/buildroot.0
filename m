From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 18 Mar 2015 22:30:30 -0700
Subject: [Buildroot] [PATCH] package/numactl: upgrade to 2.0.10
In-Reply-To: <20150319052622.GT2415@tarshish>
References: <1426736888-29437-1-git-send-email-steven@uplinklabs.net>
 <1426736888-29437-4-git-send-email-steven@uplinklabs.net>
 <20150319052622.GT2415@tarshish>
Message-ID: <CAKbGBLjy=iBuh=HN-gDCkJ55e=X-Ybrdq68xLeaFQryhGjKHnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 18, 2015 at 10:26 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Steven,
>
> On Wed, Mar 18, 2015 at 08:48:06PM -0700, Steven Noonan wrote:
>> Signed-off-by: Steven Noonan <steven@uplinklabs.net>
>
> This is a non trivial version bump. Please explain here that the package now
> uses the autotools infrastructure.
>
>> ---
>>  package/numactl/numactl.mk | 12 +++---------
>>  1 file changed, 3 insertions(+), 9 deletions(-)
>>
>> diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
>> index f36a1b3..042f2d8 100644
>> --- a/package/numactl/numactl.mk
>> +++ b/package/numactl/numactl.mk
>> @@ -4,17 +4,11 @@
>>  #
>>  ################################################################################
>>
>> -NUMACTL_VERSION = 2.0.9
>> +NUMACTL_VERSION = 2.0.10
>>  NUMACTL_SITE = ftp://oss.sgi.com/www/projects/libnuma/download
>>  NUMACTL_LICENSE = LGPLv2.1 (libnuma), GPLv2 (programs)
>>  NUMACTL_LICENSE_FILES = README
>>
>> -define NUMACTL_BUILD_CMDS
>> -     $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
>> -endef
>> +NUMACTL_AUTORECONF = YES
>
> Why? Please add inline comment clarifying that.

Fair enough. The reason is because the numactl tarball doesn't already
contain a configure script, but does contain configure.ac,
Makefile.am, etc. Will add a comment.
