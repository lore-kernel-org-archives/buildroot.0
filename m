From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Mon, 8 Feb 2021 07:30:01 +0300
Subject: [Buildroot] [PATCH 1/1] package/postgis: new package
In-Reply-To: <20210207115757.65aa48fa@gmx.net>
References: <20210126133908.680621-1-fido_max@inbox.ru>
 <20210207115757.65aa48fa@gmx.net>
Message-ID: <958ce0a5-1f35-a958-7b27-3c7a5ad4635c@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Should I resend it?

07.02.2021 13:57, Peter Seiderer ?????:
> And some minor check-package warnings to improve, see below...
> 
> On Tue, 26 Jan 2021 16:39:08 +0300, Maxim Kochetkov via buildroot<buildroot@busybox.net>  wrote:
> 
>> PostGIS is a spatial database extender for PostgreSQL object-relational database.
>> It adds support for geographic objects allowing location queries to be run in SQL.
>>
>> https://postgis.net/
>>
>> Signed-off-by: Maxim Kochetkov<fido_max@inbox.ru>
>> ---
>>   package/Config.in                             |  1 +
>>   ...VE_VASPRINTF-HAVE_ASPRINTF-templates.patch | 32 +++++++++++++++++
>>   ...fig-to-get-PROJ-version-if-available.patch | 36 +++++++++++++++++++
>>   ...S_DEBUG_LEVEL-define-to-configure.ac.patch | 29 +++++++++++++++
>>   ...e-forced-static-linking-of-liblwgeom.patch | 31 ++++++++++++++++
>>   package/postgis/Config.in                     | 12 +++++++
>>   package/postgis/postgis.hash                  |  3 ++
>>   package/postgis/postgis.mk                    | 31 ++++++++++++++++
>>   8 files changed, 175 insertions(+)
>>   create mode 100644 package/postgis/0001-Add-HAVE_VASPRINTF-HAVE_ASPRINTF-templates.patch
>>   create mode 100644 package/postgis/0002-Use-pkg-config-to-get-PROJ-version-if-available.patch
>>   create mode 100644 package/postgis/0003-Add-POSTGIS_DEBUG_LEVEL-define-to-configure.ac.patch
>>   create mode 100644 package/postgis/0004-Disable-forced-static-linking-of-liblwgeom.patch
>>   create mode 100644 package/postgis/Config.in
>>   create mode 100644 package/postgis/postgis.hash
>>   create mode 100644 package/postgis/postgis.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 06dfc32cc6..5ed3f5df8f 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -1401,6 +1401,7 @@ menu "Database"
>>   	source "package/mongodb/Config.in"
>>   	source "package/mysql/Config.in"
>>   	source "package/postgresql/Config.in"
>> +	source "package/postgis/Config.in"
>>   	source "package/redis/Config.in"
>>   	source "package/rocksdb/Config.in"
>>   	source "package/sqlcipher/Config.in"
>> diff --git a/package/postgis/0001-Add-HAVE_VASPRINTF-HAVE_ASPRINTF-templates.patch b/package/postgis/0001-Add-HAVE_VASPRINTF-HAVE_ASPRINTF-templates.patch
>> new file mode 100644
>> index 0000000000..7c9e46b7af
>> --- /dev/null
>> +++ b/package/postgis/0001-Add-HAVE_VASPRINTF-HAVE_ASPRINTF-templates.patch
>> @@ -0,0 +1,32 @@
>> +From 1bbc5b921d6b444cbeb505e67e4a4edcc696f592 Mon Sep 17 00:00:00 2001
>> +From: fidomax<adobegitler@gmail.com>
>> +Date: Tue, 26 Jan 2021 07:33:17 +0300
>> +Subject: [PATCH 1/4] Add HAVE_VASPRINTF HAVE_ASPRINTF templates
> package/postgis/0001-Add-HAVE_VASPRINTF-HAVE_ASPRINTF-templates.patch:4: generate your patches with 'git format-patch -N'
> 
