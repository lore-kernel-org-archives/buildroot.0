From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 9 Dec 2013 11:58:38 +0000
Subject: [Buildroot] [PATCH] sawman: Link using gcc instead of ld
In-Reply-To: <52A5ADCD.5050307@imgtec.com>
References: <1386347428-4142-1-git-send-email-Vincent.Riera@imgtec.com>
 <20131206190836.637fc9f7@skate> <52A5ADCD.5050307@imgtec.com>
Message-ID: <52A5B06E.60204@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/09/2013 11:47 AM, Vicente Olivert Riera wrote:
> On 12/06/2013 06:08 PM, Thomas Petazzoni wrote:
>> Dear Vicente Olivert Riera,
>>
>> On Fri, 6 Dec 2013 16:30:28 +0000, Vicente Olivert Riera wrote:
>>
>>> +--- SaWMan-1.6.3/wm/sawman/Makefile.in.orig    2013-12-06
>>> 14:22:22.675409826 +0000
>>> ++++ SaWMan-1.6.3/wm/sawman/Makefile.in    2013-12-06
>>> 16:04:03.383752843 +0000
>>
>> Makefile.in is generated from Makefile.am. So we shouldn't be fixing
>> Makefile.in, but instead Makefile.am or the process that generates
>> Makefile.in from Makefile.am.
>>
>> What happens if you simply add:
>>
>> SAWMAN_AUTORECONF = YES
>>
>>   ?
>
> You still have the same problem.
>
>> Best regards,
>>
>> Thomas
>>
>
>

Adding:

LD = $(CC) -nostdlib

to Makefile.am and also:

SAWMAN_AUTORECONF = YES

to sawman.mk fixes the problem.

What do you think about this solution?

-- 
Vincent
