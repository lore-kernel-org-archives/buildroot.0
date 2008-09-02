From: Steven Woody <narkewoody@gmail.com>
Date: Tue, 2 Sep 2008 23:10:27 +0800
Subject: [Buildroot] Login exited
In-Reply-To: <ed4892840809020809r69eb6383wda4db62d49058959@mail.gmail.com>
References: <ed4892840809011747w183e8e8bma1451d38c40e65c0@mail.gmail.com>
	<MJEBLBOLLBKOACLOGNPBGEIHCBAA.e.krueper@solcon-systemtechnik.de>
	<ed4892840809020426s36489484t7ca0a5dd2863733e@mail.gmail.com>
	<20080902130749.GA12634@cloud.net.au>
	<ed4892840809020809r69eb6383wda4db62d49058959@mail.gmail.com>
Message-ID: <ed4892840809020810h71632bfdh370015793ae688f5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 2, 2008 at 11:09 PM, Steven Woody <narkewoody@gmail.com> wrote:
> On Tue, Sep 2, 2008 at 9:07 PM, Hamish Moffatt <hamish@cloud.net.au> wrote:
>> On Tue, Sep 02, 2008 at 07:26:44PM +0800, Steven Woody wrote:
>>> I think the origin of the "can't open /dev/ttySxxx" problem is differ
>>> with the origin of the "getty exited" problem.  And, for the former, I
>>> think it has nothing to do with my device_table.txt,  since if I
>>> comment out the following line in etc/inittab:
>>>    ::sysinit:/bin/mount -t tmpfs -o size=64k,mode=0755 none /dev
>>> and replace it with
>>>    ::sysinit:/bin/mount -t tmpfs -o size=64k,mode=0755 none /dev
>>> then, the "can't open /dev/ttySxxx" problem gone away.  so I think,
>>
>> What is the difference between these two lines? I don't see one.
>
> Sorry for the careless.  The correct one should be:
>   ::sysinit:/bin/mount -t tmpfs none /dev
> That is, without any option.
>
>>
>>> But, as you know, this problem had been resoved, I finally get the
>>> login problem and the system is waiting for me to login.  My new
>>> problem is that I can not login.  When I type in user name 'root' at
>>> the prompt, I got the on-console log message:
>>>     Dec 31 17:24:45 ffcplus daemon.info init: init: process
>>> '/usr/bin/tail -f /var/log/messages' (pid 7568) exited. Scheduling for
>>> restart.
>>
>> Maybe you could boot your system with the command line "init=/bin/sh" so
>> that it skips all start up scripts and see what happens?
>
> Okay, I will try next when I go office.

sorry, I forgot to ask: where to put the command line?
