From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 28 May 2016 21:14:54 +0200
Subject: [Buildroot] [PATCH] package/net-tools: fix static linking issue
 with lintl
In-Reply-To: <20160528193055.5aa2185a@free-electrons.com>
References: <1464444171-12033-1-git-send-email-romain.naour@gmail.com>
 <20160528193055.5aa2185a@free-electrons.com>
Message-ID: <c30f73c1-5513-a937-5d21-233818225bec@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 28/05/2016 ? 19:30, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Sat, 28 May 2016 16:02:51 +0200, Romain Naour wrote:
>> When net-tools are build with uClibc-ng and statically linked,
>> some tools like hostname and route needs to link with -lintl.
>>
>> Adding -lintl in LDFLAGS place the library before object files:
>> arm-linux-gcc -O2 -g -Wall -fno-strict-aliasing   -static -lintl -Llib -o hostname hostname.o
>>
>> Move $(LDFLAGS) after object files in the Makefile.
> 
> Thanks. However, I believe a slightly better fix is to add a $(LIBS)
> variable passed after object files, and keep $(LDFLAGS) where it is
> today. This is what automake Makefiles are doing, so it seems like the
> most "standard way". See for example
> https://lists.gnu.org/archive/html/autoconf/2004-01/msg00182.html.

Thanks for the link, fixed in v2.

> 
> And this way, maybe the patch can be submitted upstream? I see that
> upstream has an active Git repository, so such patches could definitely
> be upstreamed.

See the recent discussion on their ML [1], the same issue has already been
reported and a similar patch has been submitted.
I'll reply and send mine.

Best regards,
Romain

[1]https://sourceforge.net/p/net-tools/mailman/message/34924345/

> 
> Thanks!
> 
> Thomas
> 
