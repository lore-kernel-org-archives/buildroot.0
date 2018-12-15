From: Carlos Santos <casantos@datacom.com.br>
Date: Fri, 14 Dec 2018 22:53:50 -0200 (BRST)
Subject: [Buildroot] [PATCH] package/libpam-tacplus: fix compilation
 with GCC 8
In-Reply-To: <20181213221212.5dcafde0@windsurf>
References: <20181211112113.21648-1-casantos@datacom.com.br>
 <20181213221212.5dcafde0@windsurf>
Message-ID: <1184835993.3022523.1544835230237.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "Carlos Santos" <casantos@datacom.com.br>
> Cc: "buildroot" <buildroot@buildroot.org>
> Sent: Quinta-feira, 13 de dezembro de 2018 19:12:12
> Subject: Re: [Buildroot] [PATCH] package/libpam-tacplus: fix compilation with GCC 8

> Hello,
> 
> On Tue, 11 Dec 2018 09:21:13 -0200, Carlos Santos wrote:
>> GCC 8 demands that the size of the string copied by strncpy be smaller
>> than the size of the destination to keep space for the trailibg '\0'.
>> This causes a compilation error in pam_tacplus, so add a patch already
>> sent uptream to fix it.
>> 
>> Fixes:
>>   http://autobuild.buildroot.net/results/da6d150e470046c03c5f7463de045604e15e4a30/
>> 
>> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
>> ---
>>  ...0002-Fix-compilation-of-tacc.c-with-GCC-8.patch | 39 ++++++++++++++++++++++
>>  1 file changed, 39 insertions(+)
>>  create mode 100644
>>  package/libpam-tacplus/0002-Fix-compilation-of-tacc.c-with-GCC-8.patch
> 
> Applied to master, thanks. Please submit the patch upstream. Thanks!

It's already on master, upstream.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
