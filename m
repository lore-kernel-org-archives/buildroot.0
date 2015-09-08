From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 8 Sep 2015 15:17:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/host-gdb: fix autobuild failure
In-Reply-To: <55EEED12.6000909@mind.be>
References: <1441721106-27234-1-git-send-email-brendanheading@gmail.com>
 <55EEED12.6000909@mind.be>
Message-ID: <55EEEE0D.5050009@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On 09/08/2015 03:13 PM, Arnout Vandecappelle wrote:
> On 08-09-15 16:05, Brendan Heading wrote:
>> Fixes :
>>
>> http://autobuild.buildroot.net/results/dd5/dd50ed99abb2c8495def826866b184030953f90e/
>>
>> .. and many others.
>>
>> host-gdb is broken on all architectures at the moment, as it seems to
>> require makeinfo during "make install" even if configure
>> failed to detect it. Instead of trying to hack it, let's simply make gdb
>> dependent on host-texinfo.
> 
>  Any idea why this is not needed for target gdb?

It is needed for the target as well. You can build the target gdb
without building the host gdb, in which case the host-texinfo package
would not be installed and you would face the failure again.

Brendan, please, can you add the dependency for target gdb as well?

Regards,

Vincent.

>  Regards,
>  Arnout
> 
>>
>> Signed-off-by: Brendan Heading <brendanheading@gmail.com>
>> ---
>>  package/gdb/gdb.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
>> index 338de20..efe195a 100644
>> --- a/package/gdb/gdb.mk
>> +++ b/package/gdb/gdb.mk
>> @@ -40,7 +40,7 @@ endif
>>  # For the host variant, we really want to build with XML support,
>>  # which is needed to read XML descriptions of target architectures. We
>>  # also need ncurses.
>> -HOST_GDB_DEPENDENCIES = host-expat host-ncurses
>> +HOST_GDB_DEPENDENCIES = host-expat host-ncurses host-texinfo
>>  
>>  # Apply the Xtensa specific patches
>>  XTENSA_CORE_NAME = $(call qstrip, $(BR2_XTENSA_CORE_NAME))
>>
> 
> 
