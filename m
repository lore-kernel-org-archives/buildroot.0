From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Sun, 19 Oct 2008 01:55:49 +0200
Subject: [Buildroot] ext2+isofs initrd too big
In-Reply-To: <e4c675870810181256j11da9c1eha5035bedc7a088a4@mail.gmail.com>
References: <e4c675870810181157u69e5e3d4j3ed89b53a414c6f3@mail.gmail.com>
	<e4c675870810181256j11da9c1eha5035bedc7a088a4@mail.gmail.com>
Message-ID: <e4c675870810181655x1bdf8817l114da029a3a9c807@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/10/18 Roberto A. Foglietta <roberto.foglietta@gmail.com>:
> 2008/10/18 Roberto A. Foglietta <roberto.foglietta@gmail.com>:
>> Hi,
>>
>>  using buildroot I have compiled a system which is big enough to not
>> fit in the initrd image (default size is 4Mb but could be enlarged by
>> kernel .config). Attached patch prepare a initrd of 16Mb and I can
>> enlarge it more in order to put all my system inside. However this is
>> not the best solution because has no future itself, initrd image could
>> not enlarged forever.
>
>  _Attached patch_ forgot, until now
>


 a) stripping modules (previous patch was wrong, see below)

 Using strip on .ko does not work at all without --strip-unneeded.

 http://mailman.uclinux.org/pipermail/uclinux-dev/2007-January/041616.html

 strip -R  .comment -R .note -g --strip-unneeded


 b) bootable iso

 a line like this is required for initrd and it does not hurt in initramfs case

 root=/dev/ram0 initrd=0x00800000,16M

 http://www.uwsg.iu.edu/hypermail/linux/kernel/0501.3/1144.html


Cheers,
-- 
/roberto
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-svn_r23678.diff
Url: http://busybox.net/lists/buildroot/attachments/20081019/dcc7d655/attachment.txt 
