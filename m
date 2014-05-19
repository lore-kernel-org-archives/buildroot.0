From: Tom Deblauwe <tom.deblauwe@ebo-enterprises.com>
Date: Mon, 19 May 2014 10:56:42 +0200
Subject: [Buildroot] grub2
In-Reply-To: <20140519103407.42306263@free-electrons.com>
References: <5379BBC5.5020202@ebo-enterprises.com>
 <20140519103407.42306263@free-electrons.com>
Message-ID: <5379C74A.6020603@ebo-enterprises.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In attachment my config.

I actually want to build this config that so I can run the 32-bit image
on a 64-bit efi system too.

Best regards,
Tom,

On 19-05-14 10:34, Thomas Petazzoni wrote:
> Dear Tom Deblauwe,
>
> On Mon, 19 May 2014 10:07:33 +0200, Tom Deblauwe wrote:
>
>>    I am trying to build grub2 with the platform as x86-64-efi. I am
>> building on Ubuntu 14.04 64bit. My target is i386 atom. This works when
>> I use an external toolchain from Sourcery codebench 2012.09.
>>
>>    But when I try to build with an internal buildroot toolchain it fails
>> on the grub2 configure step with an error about gcc not having the
>> "-mcmodel=large" support. I tried gcc 4.9 and 4.8 and they both didn't
>> have it compiled in apparently. I have enabled the
>> BR2_TOOLCHAIN_BUILDROOT_LARGEFILE support so I guessed that was ok then
>> but it's not working.
>>
>>    I checked out the master of today, then set the compiler, and then did
>> an "make toolchain" and then "make grub2". So it's a clean build.
>> What could be wrong with this?
> Can you share your Buildroot .config ?
>
> You say that your target is i386 Atom, so I believe you've selected
> i386 as the architecture. So that's 32 bits.
>
> On the other hand, you say you've selected x86-64-efi as the grub2
> platform. That's 64 bits.
>
> It might be where the problem lies.
>
> Thomas

Email Confidentiality: e-BO Enterprises<http://www.ebo-enterprises.com/> Company Registration Number BE 0470174242. This email message and any attachments are for the sole use of the intended recipient(s) and may contain information that is proprietary to e-BO Enterprises<http://www.ebo-enterprises.com/>. If you have received this message in error, please notify the sender by reply, and delete all copies of this message and any attachments. If you are the intended recipient you may use the information contained in this message and any files attached to this message only as authorized by e-BO Enterprises<http://www.ebo-enterprises.com/>. Any unauthorized use, dissemination or disclosure of this message or its attachments is strictly prohibited. The contents of this e-mail are not to be considered binding upon e-BO Enterprises<http://www.ebo-enterprises.com/>.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: grub2_config.gz
Type: application/gzip
Size: 8067 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140519/994acad1/attachment.bin>
