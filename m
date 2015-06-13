From: Patricia Holden <patholdn@gmail.com>
Date: Fri, 12 Jun 2015 21:26:33 -0400
Subject: [Buildroot] Building bootable usb drive for target board with
	ext2
In-Reply-To: <CANKYLMEpujp5YDJRZixuLk7EG7MNVOGWiMgZFWgaCsf5qAOb9g@mail.gmail.com>
References: <CANKYLME21pAifC-tb+HC=tRhy5k9ka0W-gywZCPrOdpq1aOTMA@mail.gmail.com>
 <20150612211031.3a684e7d@free-electrons.com>
 <CANKYLMF9crxgDKVuHBZHHkhh=iw=O_o=Sq0cafM_HusVWAPd2w@mail.gmail.com>
 <CANKYLME+Dh85AHMX5yQdwuBU_WbsbMLurUf8d6Hn3pf=Ybpw8A@mail.gmail.com>
 <20150612235154.1a723af5@free-electrons.com>
 <CANKYLMEpujp5YDJRZixuLk7EG7MNVOGWiMgZFWgaCsf5qAOb9g@mail.gmail.com>
Message-ID: <CANKYLMGNgcH-uiuHYELR9Rcct5QjHBQa9u83zouRipB06+X-8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm getting nowhere fast.  I try running kernel command once on the target
but bzImage fails with "Error 17: Cannot mount seected partition".  Guess
I'm back to square run trying to get this thing working.

On Fri, Jun 12, 2015 at 6:43 PM, Patricia Holden <patholdn@gmail.com> wrote:

> I copied the boot directory to the USB after extracting it from
> rootfs.tar, copied bzImage to /boot, and  successfully got grub onto the
> USB device following the grub help instructions.  Then I moved the USB to
> my target and powered it up.  The grub prompt came up (yay, one step
> further!).  I tried to boot or reboot but it says my kernel is missing.  Is
> there something else I'm missing in my config file for buildroot?  do I
> need to give grub special kernel instructions?
>
> On Fri, Jun 12, 2015 at 5:51 PM, Thomas Petazzoni <
> thomas.petazzoni at free-electrons.com> wrote:
>
>> Dear Patricia Holden,
>>
>> On Fri, 12 Jun 2015 17:49:57 -0400, Patricia Holden wrote:
>>
>> > Ok, so I'm still not quite out of the woods.  I copied over the boot
>> > directory from output to my usb drive, copied bzImage to usb drive.  It
>> > hangs on target.  Do I need to edit grub files for the usb?  Do I need
>> to
>> > install grub instead of copying?  Sorry for such mundane questions, but
>> I'm
>> > just getting back into the linux world and my mind is a bit foggy.
>>
>> You need to install grub on your USB drive. See the instructions in the
>> grub option help text, also visible at:
>>
>>   http://git.buildroot.net/buildroot/tree/boot/grub/Config.in#n8
>>
>> The instructions are done on a disk image, but it can be done directly
>> on a real drive in a similar way.
>>
>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150612/336293fc/attachment.html>
