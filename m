From: jean.sorgemoel at laposte.net <jean.sorgemoel@laposte.net>
Date: Sat, 01 Feb 2014 22:33:20 +0100
Subject: [Buildroot] [PATCH 1/1] new package - generate iso with
 isolinux bootloader
In-Reply-To: <20140129092520.4ea8141e@skate>
References: <y>	<1376644934-4302-1-git-send-email-jean.sorgemoel@laposte.net>	<5213ECA4.9030405@mind.be>	<20140128172502.171b2f84@skate>	<52E7E9E4.20400@mind.be>	<20140128223929.3101c67a@skate>	<52E8A720.1010801@mind.be>
 <20140129092520.4ea8141e@skate>
Message-ID: <52ED6820.8030300@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout,

I sent new patch to include your comment.
I modify iso9660 module (add choice to select grub or isolinux)

I'm not happy with my code.
For each image we use different filename:
      rootfs.iso9660 for grub
      rootfs.isolinux.iso9660 for isolinux
The code is similar but we have each difference on dependency (and other 
but not important)

I'm not sure understand optional initramfs (because it's not easy to see 
if option activated) but I implement same method of old module iso9660 
(with grub)

Thanks for your remark (and your time)

Regards,
Jean

> Arnout, Jean,
>
> On Wed, 29 Jan 2014 08:00:48 +0100, Arnout Vandecappelle wrote:
>
>>> Aaah, interesting, I didn't know that. So it would probably make a lot
>>> of sense to improve the ISO9660 support to:
>>>
>>>    * Generate just an ISO9660 root filesystem image by default
>>>
>>>    * Optionally, make it bootable using either Grub or isolinux
>>>
>>>    * Optionally, replace the ISO9660 root filesystem by an initramfs
>>    The third one fits better in the genimages approach IMHO. The second
>> one as well - except that that is not possible, once the iso image is
>> created you can't make it bootable anymore. So yes, I think that would
>> really improve the iso9660 support.
> I agree.
>
>>    However, I would also be happy with a patch that simply adds an option
>> to use isolinux instead of grub for the current iso9660 infrastructure.
> Yes, this would be interesting regardless of the other possible
> improvements discussed above.
>
> Bottomline: Jean, if you could add the possibility of using isolinux as
> part of the existing fs/iso9660 stuff, that would be great.
>
> Thanks a lot!
>
> Thomas
