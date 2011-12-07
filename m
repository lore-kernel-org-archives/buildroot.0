From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 7 Dec 2011 08:03:27 +0100
Subject: [Buildroot] [PATCH 4/4] sqlite: add option to enable additional
 query optimizations (stat3)
In-Reply-To: <CAAXf6LWGTLq_m9WXA4iu_b86cWMAqPa5=prqws2Kd5vgdQkZ=Q@mail.gmail.com>
References: <1323204723-6020-1-git-send-email-s.neumann@raumfeld.com>
 <1323204723-6020-4-git-send-email-s.neumann@raumfeld.com>
 <CAAXf6LWGTLq_m9WXA4iu_b86cWMAqPa5=prqws2Kd5vgdQkZ=Q@mail.gmail.com>
Message-ID: <CAAXf6LUQhTwZjbh4ECBXcx+kQ8to1ECM-pvdkB+aLQuQEacy8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 7, 2011 at 7:57 AM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> On Tue, Dec 6, 2011 at 9:52 PM, Sven Neumann <s.neumann@raumfeld.com> wrote:
>> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
>> ---
>> ?package/sqlite/Config.in | ? ?8 ++++++++
>> ?package/sqlite/sqlite.mk | ? ?4 ++++
>> ?2 files changed, 12 insertions(+), 0 deletions(-)
>>
>> diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
>> index f9b12ae..b7b17c6 100644
>> --- a/package/sqlite/Config.in
>> +++ b/package/sqlite/Config.in
>> @@ -14,3 +14,11 @@ config BR2_PACKAGE_SQLITE_READLINE
>> ? ? ? ?help
>> ? ? ? ? ?Enable command-line editing. This requires ncurses and readline.
>>
>> +config BR2_PACKAGE_SQLITE_STAT3
>> + ? ? ? bool "Additional query optimizations (stat3)"
>> + ? ? ? depends on BR2_PACKAGE_SQLITE
>> + ? ? ? help
>> + ? ? ? ? Adds additional logic to the ANALYZE command and to the query
>> + ? ? ? ? planner that can help SQLite to chose a better query plan under
>
> s/chose/choose/
>
>> + ? ? ? ? certain situations.
>> +
>> diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
>> index 0bee337..042c7f9 100644
>> --- a/package/sqlite/sqlite.mk
>> +++ b/package/sqlite/sqlite.mk
>> @@ -16,6 +16,10 @@ ifneq ($(BR2_LARGEFILE),y)
>> ?SQLITE_CFLAGS += -DSQLITE_DISABLE_LFS
>> ?endif
>>
>> +ifeq ($(BR2_PACKAGE_SQLITE_STAT3),y)
>> +SQLITE_CFLAGS += -DSQLITE_ENABLE_STAT3
>> +endif
>> +
>> ?SQLITE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) $(SQLITE_CFLAGS)"
>>
>> ?SQLITE_CONF_OPT = \

I'm not using sqlite myself, so cannot comment on the technical
correctness of your changes. But, besides the typo I mentioned, your
series looks fine to me, so as far as I'm concerned you can add
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

to the entire series.

Best regards,
Thomas
