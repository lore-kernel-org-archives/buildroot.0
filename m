From: Steve Kenton <skenton@ou.edu>
Date: Tue, 10 Mar 2015 13:05:45 -0500
Subject: [Buildroot] Obscure bug in Util-Linux umount?
In-Reply-To: <20150310185937.280f8497@free-electrons.com>
References: <54FE7E8E.20306@ou.edu> <54FF18D4.2030709@ou.edu>
 <20150310185937.280f8497@free-electrons.com>
Message-ID: <54FF3279.80403@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 3/10/2015 12:59 PM, Thomas Petazzoni wrote:
> Dear Steve Kenton,
>
> On Tue, 10 Mar 2015 11:16:20 -0500, Steve Kenton wrote:
>
>> Further testing revealed that it only occurs if the embedded root filesystem is read-only
>> which I forgot to mention (blush) so it's probably an interaction with a stale /etc/mtab
>> or something, but only for the root filesystem and only if the mount point directory names
>> are the same, yada etc. Much less likely to bite anyone else so I guess a heads up is not needed.
>>
>> Any way, not really a bug but rather a feature with  undefined behaviour and most importantly
>> a case of 'it hurts if I do this' soooo  'don't do that'!
> Interesting. After reading your e-mail, I had a very quick look at the
> kernel side and util-linux side, looking for code using the
> s_last_mounted field of the superblock which indeed contains the last
> location where it was mounted. But I couldn't spot any place where it
> is specifically used to prevent something from happening. But I didn't
> spend a lot of time, so I may very well have missed something.
>
> Thomas
If anyone else has ever hit this then it might be worth pursuing and 
I'll take another look,
but if nobody else cares I'll just chock it up to dumb-(bad)-luck and 
move along.

Any one out there care about this? It's easy for me to reproduce right 
now while (painfully) fresh in my memory.

Steve
