From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Oct 2019 00:21:42 +0200
Subject: [Buildroot] [PATCH 00/30] SELinux improvements
In-Reply-To: <da1c2d0d-d74c-9a45-3dc9-97755abc4182@mind.be>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
 <da1c2d0d-d74c-9a45-3dc9-97755abc4182@mind.be>
Message-ID: <66ad4c25-f1a5-4e01-1913-4d3d02534f28@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22/09/2019 20:09, Arnout Vandecappelle wrote:
> 
> 
> On 22/09/2019 11:06, Thomas Petazzoni wrote:
> [snip]
>> Thomas Petazzoni (30):
>>   package/policycoreutils: drop host-dbus-glib dependency from
>>     host-policycoreutils
>>   package/policycoreutils: drop host-python(3) dependency for
>>     host-policycoreutils
>>   package/policycoreutils: drop host-setools dependency from
>>     host-policycoreutils
>>   package/policycoreutils: drop ARCH variable
>>   package/policycoreutils: don't pass DESTDIR when building host variant
>>   package/libsemanage: drop dependency on ustr
>>   package/ustr: remove package
>>   package/libsemanage: reformat HOST_LIBSEMANAGE_DEPENDENCIES
> 
>  Patches 1-8 applied to master, thanks.
> 
>  Regards,
>  Arnout
> 
>>   package/musl-fts: new package
>>   package/libselinux: allow building on !glibc using musl-fts
>>   package/busybox: selinux support now available on !glibc configs
>>   package/checkpolicy: now available on !glibc configs
>>   package/audit: re-enable on musl
>>   package/selinux-python: now available on !glibc configs
>>   package/setools: now available on !glibc configs
>>   package/android-tools: fastboot now available on !glibc toolchains
>>   package/restorecond: now available on !glibc configs
>>   package/libsemanage: now available on !glibc configs
>>   package/policycoreutils: now available on !glibc configs
>>   package/refpolicy: now available on !glibc configs
>>   package/libselinux: re-enable on ARC
>>   package/setools: re-enable on ARC
>>   package/checkpolicy: re-enable on ARC
>>   package/selinux-python: re-enable audit2allow on ARC
>>   package/busybox: re-enable SELinux support on ARC
>>   package/restorecond: re-enable on ARC
>>   package/libsemanage: drop !BR2_arc dependency
>>   package/policycoreutils: drop !BR2_arc dependency
>>   package/refpolicy: drop !BR2_arc dependency
>>   package/android-tools: re-enable fastboot on ARC

 And now the rest of the series has been applied.

 Regards,
 Arnout

>>
>>  Config.in.legacy                              |   8 ++
>>  DEVELOPERS                                    |   2 +-
>>  package/Config.in                             |   2 +-
>>  package/android-tools/Config.in               |   8 +-
>>  ...tue-functions-for-strndupa-rawmemchr.patch | 133 ++++++++++++++++++
>>  package/audit/Config.in                       |   6 +-
>>  package/audit/audit.mk                        |   2 +
>>  package/busybox/Config.in                     |   2 -
>>  package/checkpolicy/Config.in                 |   8 +-
>>  package/libselinux/Config.in                  |  11 +-
>>  package/libselinux/libselinux.mk              |   5 +
>>  package/libsemanage/Config.in                 |  12 +-
>>  package/libsemanage/libsemanage.mk            |  11 +-
>>  package/musl-fts/Config.in                    |   7 +
>>  package/musl-fts/musl-fts.hash                |   3 +
>>  package/musl-fts/musl-fts.mk                  |  21 +++
>>  package/policycoreutils/Config.in             |   8 +-
>>  package/policycoreutils/policycoreutils.mk    |  26 +---
>>  package/refpolicy/Config.in                   |   8 +-
>>  package/restorecond/Config.in                 |   5 +-
>>  package/selinux-python/Config.in              |   5 +-
>>  package/setools/Config.in                     |   9 +-
>>  package/ustr/Config.in                        |  13 --
>>  package/ustr/ustr.hash                        |   9 --
>>  package/ustr/ustr.mk                          |  39 -----
>>  25 files changed, 214 insertions(+), 149 deletions(-)
>>  create mode 100644 package/audit/0002-Add-substitue-functions-for-strndupa-rawmemchr.patch
>>  create mode 100644 package/musl-fts/Config.in
>>  create mode 100644 package/musl-fts/musl-fts.hash
>>  create mode 100644 package/musl-fts/musl-fts.mk
>>  delete mode 100644 package/ustr/Config.in
>>  delete mode 100644 package/ustr/ustr.hash
>>  delete mode 100644 package/ustr/ustr.mk
>>
