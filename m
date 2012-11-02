From: Markos Chandras <markos.chandras@gmail.com>
Date: Fri, 2 Nov 2012 11:45:15 +0000
Subject: [Buildroot] [PATCH v2] fs/common: Create initial console device
In-Reply-To: <5093AFFF.6020302@mind.be>
References: <1351765685-8128-1-git-send-email-markos.chandras@gmail.com>
 <5092F5E0.80704@mind.be>
 <CAG2jQ8iMdCZ6RC5zW6vyuQscDNJgpECyxG++4rD4J_q7q06TYQ@mail.gmail.com>
 <5093AFFF.6020302@mind.be>
Message-ID: <CAG2jQ8jkAZHzRbsaHHjjM=8GFudXwCF+2jf7YkNy=p6Nhe5ijg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 2, 2012 at 11:35 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 11/02/12 12:32, Markos Chandras wrote:
>>>>
>>>> >>  +PACKAGES_PERMISSIONS_TABLE += /dev/console c 622 0 0 5 1
>>>
>>> >
>>> >
>>> >    The last three entries are missing (start, inc, count). Also, there
>>> > should
>>> >  be a $(sep) at the end of the line; otherwise, any subsequent entries
>>> > are
>>> >  appended at the end of the line.  (This will probably be the last line
>>> > in
>>> >  the table anyway, because the fs/ tree is included at the end of
>>> > Makefile,
>>> >  but we shouldn't rely on that).
>>> >
>>
>> Do I really need these 3 numbers (start, inc, count)? The static file
>>
>> in  target/generic/device_table_dev.txt
>> is not using them for the console device.
>
>
>  It is:
> /dev/console    c       666     0       0       5       1       -       -
> -

HI Arnout,

Hmm I thought that the hyphens there meant "no value is needed". I
will prepare a new patch.

-- 
Regards,
Markos
