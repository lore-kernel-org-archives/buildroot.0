From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Mon, 15 Aug 2016 11:07:17 +0530
Subject: [Buildroot] [PATCH 2/2] wayland: fix musl build issue
In-Reply-To: <20160814142650.GA30771@free.fr>
References: <1471025702-6945-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1471025702-6945-2-git-send-email-rahul.bedarkar@imgtec.com>
 <20160814142650.GA30771@free.fr>
Message-ID: <57B1550D.6010203@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sunday 14 August 2016 07:56 PM, Yann E. MORIN wrote:
> Rahul, All,
>
> On 2016-08-12 23:45 +0530, Rahul Bedarkar spake thusly:
>> With musl C library, we see following build failure.
>>
>>    src/scanner.c: In function 'find_enumeration':
>>    src/scanner.c:811:2: error: unknown type name 'uint'
>>      uint idx = 0, j;
>>      ^
>>
>> uint is defined in <sys/types.h> header. It is usually included by <stdlib.h>
>> but in musl stdlib.h doesn't include it.
>
> As commented by Khem, there is an upstream patch, so it's better to
> backport it.
>
> Consequently, I've marked this as "Changes Requested" in our Patchwork.
>
> Care to respin, please? Thanks!

Thanks Yann, Khem,

I will send v2.

Regards,
Rahul
