From: Petr Kulhavy <brain@jikos.cz>
Date: Mon, 15 May 2017 16:05:54 +0200
Subject: [Buildroot] [PATCH v4 1/1] linuxptp: new package
In-Reply-To: <20170515135628.gf5xzgh3o3frf6sc@tarshish>
References: <1494843913-13912-1-git-send-email-brain@jikos.cz>
 <20170515135628.gf5xzgh3o3frf6sc@tarshish>
Message-ID: <d3b65d29-e82b-3252-c5f6-d30b16ad626a@jikos.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

yes, it works in both ways.

Petr

On 15/05/17 15:56, Baruch Siach wrote:
> Hi Petr,
>
> On Mon, May 15, 2017 at 12:25:13PM +0200, Petr Kulhavy wrote:
>> diff --git a/package/linuxptp/0002-Remove-conflicting-netinet-ether.h.patch b/package/linuxptp/0002-Remove-conflicting-netinet-ether.h.patch
>> new file mode 100644
>> index 0000000..28ddb15
>> --- /dev/null
>> +++ b/package/linuxptp/0002-Remove-conflicting-netinet-ether.h.patch
>> @@ -0,0 +1,32 @@
>> +From 8e8db2a5b90a611be39922694c7bdacbffbabcd5 Mon Sep 17 00:00:00 2001
>> +From: Petr Kulhavy <brain@jikos.cz>
>> +Date: Mon, 15 May 2017 09:36:30 +0200
>> +Subject: [PATCH] Remove conflicting netinet/ether.h
>> +
>> +On some platforms like br-arm-cortex-a9-musl struct ethhdr was defined twice
>> +due to including of both linux/if_ether.h and netinet/ether.h. Which lead
>> +to a compilation error.
>> +
>> +Remove netinet/ether.h as the official header for struct ethhdr is
>> +linux/if_ether.h
> I think that removing the kernel header, if possible, would be better. Relying
> on libc headers alone generally makes for better code portability.
>
> Does that work for you?
>
>> +
>> +Signed-off-by: Petr Kulhavy <brain@jikos.cz>
>> +---
>> + raw.c | 1 -
>> + 1 file changed, 1 deletion(-)
>> +
>> +diff --git a/raw.c b/raw.c
>> +index f51c829..73e45b4 100644
>> +--- a/raw.c
>> ++++ b/raw.c
>> +@@ -20,7 +20,6 @@
>> + #include <fcntl.h>
>> + #include <linux/filter.h>
>> + #include <linux/if_ether.h>
>> +-#include <net/ethernet.h>
>> + #include <net/if.h>
>> + #include <netinet/in.h>
>> + #include <netpacket/packet.h>
> baruch
>
