From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Thu, 14 Oct 2010 15:34:00 -0500
Subject: [Buildroot] mkfs.jffs2 image is not usable
In-Reply-To: <8739s8fs1q.fsf@macbook.be.48ers.dk>
References: <0D753D10438DA54287A00B02708426976450A64C87@AUSP01VMBX24.collaborationhost.net>
	<4CB5A0BB.2040106@zacarias.com.ar>
	<0D753D10438DA54287A00B02708426976450B0AF44@AUSP01VMBX24.collaborationhost.net>
	<8739s8fs1q.fsf@macbook.be.48ers.dk>
Message-ID: <0D753D10438DA54287A00B02708426976450C428E0@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday, October 14, 2010 1:17 PM, Peter Korsgaard wrote:
>>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:
>
> Hi,
>
>> The flash geometry settings should be the same as when I made the
>> jffs2 image that does work.  But, for the record, the flash is a
>> parallel 4kB pagesize and 128 kB erase size.
>>
>> sudo modprobe mtd
>> sudo modprobe jffs2
>> sudo modprobe mtdram totalsize=32768 erase_size=256
>
> You should use the same erase_size here, E.G. 128KB.

Ah... You are correct. But, the working rootfs.jffs2 image does still mount.

>> Suggestions?
>
> Not really, do you have an old (working) image? If so, you could compare
> the jffs2dump output of those.

I do have an older image that works.

When I run jffs2dump -c on the working image the output does look like my
rootfs.  But when I run it on any of the non-working images I get stuff like:

Wrong hdr_crc  at  0x00000000, 0x813c6fd8 instead of 0xe41eb0b1
Wrong bitmask  at  0x00000004, 0x000c

Hartley
