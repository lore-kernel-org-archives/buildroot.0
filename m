From: shy <mail_hysong@163.com>
Date: Tue, 24 Mar 2020 08:50:32 +0800 (CST)
Subject: [Buildroot] date command
In-Reply-To: <20200323180549.6ccd2738@gmx.net>
References: <589197dd.b0b7.17107dc905e.Coremail.mail_hysong@163.com>
 <20200323180549.6ccd2738@gmx.net>
Message-ID: <2047d0f5.f3a.1710a050334.Coremail.mail_hysong@163.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all:


I test in buildroot and ubuntu, it all can't set time "1970-01-01 00:00:00", there is error message "date: can't set date: Invalid argument".
I don't know why and how to solve the problem. It's UTC time and no timezone.


1. I use buildroot-2013.05, the busybox is in 1.21.1, the linux kernel is in version 4.4.39.


# date -s "1970-01-20 00:00:00"
Tue Jan 20 00:00:00 UTC 1970
# date -R
Tue, 20 Jan 1970 00:00:03 +0000
# date -s "1970-01-01 00:00:00"
date: can't set date: Invalid argument
Thu Jan  1 00:00:00 UTC 1970




2. I test in ubuntu version 14.04.1.
shy at ubuntu:/etc$ sudo date -s "2020-03-01 00:00:00"
Sun Mar  1 00:00:00 UTC 2020
shy at ubuntu:/etc$ date -R
Sun, 01 Mar 2020 00:00:03 +0000

shy at ubuntu:/etc$ sudo date -s "1970-01-01 00:00:00"

date: cannot set date: Invalid argument

Thu Jan  1 00:00:00 UTC 1970

shy at ubuntu:/etc$ uname -a

Linux ubuntu 4.4.0-142-generic #168~14.04.1-Ubuntu SMP Sat Jan 19 11:26:28 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux







Best regards!








At 2020-03-24 00:05:49, "Peter Seiderer" <ps.report@gmx.net> wrote:
>Hello,
>
>On Mon, 23 Mar 2020 22:47:07 +0800 (CST), shy  <mail_hysong@163.com> wrote:
>
>> Hi:
>>
>>
>> I have a question and need your help.
>>
>>
>> The linux epoch time is 1970-01-01 00:00:00,  I set the UTC  time, but it has error with "date: cannot set date: Invalid argument".
>> I'm confused with it.
>
>Please show the exact commands (including options) your use...
>
>Regards,
>Peter
>
>>
>>
>>
>>
>> Best regards!
>>
>>
>>
>>
>>
>>
>>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200324/7df9940e/attachment.html>
