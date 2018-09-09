From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sun, 9 Sep 2018 22:17:15 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] php: pdo mysql
 extension needs hash as well
In-Reply-To: <5562cbe3-3df3-94b7-fe85-2bad30175f69@micronovasrl.com>
References: <20180903072218.4E3CD81DF3@busybox.osuosl.org>
 <5562cbe3-3df3-94b7-fe85-2bad30175f69@micronovasrl.com>
Message-ID: <d44ba2b9-598a-b0cd-7e16-83cb8bb775e5@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 08/09/2018 01:34, Giulio Benetti ha scritto:
> Hello,
> 
> Il 03/09/2018 09:22, Peter Korsgaard ha scritto:
>> commit: 
>> https://git.buildroot.net/buildroot/commit/?id=dc589d21fa268c345cf910f6fa7165240ca8105d 
>>
>> branch: 
>> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/69cf9326539c8df8fa50c5e7acb2ce3bb985ede2/ 
>>
>>
>> The PDO mysql extension also needs the hash extension - so select it,
>> similar to how it was done for the mysqli extension in commit 65f96452636
>> (php: fix build with mysqli).
>>
>> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>> (cherry picked from commit 45215ffc8a75377228a477bebbf2ad9c78d40a35)
>> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>> ---
>> ? package/php/Config.ext | 1 +
>> ? 1 file changed, 1 insertion(+)
>>
>> diff --git a/package/php/Config.ext b/package/php/Config.ext
>> index 60ef1aee7c..51dcbbf4a4 100644
>> --- a/package/php/Config.ext
>> +++ b/package/php/Config.ext
>> @@ -132,6 +132,7 @@ if BR2_PACKAGE_PHP_EXT_PDO
>> ? config BR2_PACKAGE_PHP_EXT_PDO_MYSQL
>> ????? bool "MySQL"
>> +??? select BR2_PACKAGE_PHP_EXT_HASH
>> ????? help
>> ??????? PDO driver for MySQL
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
> 
> Since I don't see any new php patch on queue, I would like to signal 
> that this patch and https://patchwork.ozlabs.org/patch/962514/ are 
> needed for master branch too.

Sorry, I got confused, commit is present also in master branch.
And autobuilds are precedent to that commit.

Kind regards
Giulio Benetti
