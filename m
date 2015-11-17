From: David Van Arnem <dvanarnem@cmlab.biz>
Date: Tue, 17 Nov 2015 11:30:13 -0700
Subject: [Buildroot] Kernel patches in Buildroot
In-Reply-To: <564B603B.5010907@synopsys.com>
References: <56432809.3000902@synopsys.com> <56432ED3.7070008@mind.be>
 <564B0BBE.8050102@synopsys.com> <564B603B.5010907@synopsys.com>
Message-ID: <564B7235.20209@cmlab.biz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/17/2015 10:13 AM, Joao Pinto wrote:
>
> Hi!
> I am trying to use BR2_GLOBAL_PATCH_DIR to indicate the global patch directory,
> which has the following value:
>
> BR2_GLOBAL_PATCH_DIR="snps-custom/packages"
>
> I have a "snps-custom" folder which has a "packages" folder inside. Inside the
> "packages" folder we have a folder for each package we need to patch, in this
> example mplayer and the linux kernel.
>
> --snps-custom
>    --packages
>      --linux-arc-axs101-20141021-3.13
> 	0001-XXXX.patch
> 	0002-YYYY.patch
>      --mplayer
> 	0001-mplayer.patch
>      --<packagename>
> 	000x-xxxxx.patch
>
> The linux kernel patching system does not recognizes the
> packages/linux-arc-axs101-20141021-3.13 patch folder. Could you give me a help
> on this?

I haven't done this myself, so I'm not completely sure if this is 
correct, but there's an option to add custom kernel patches under 
menuconfig -> Kernel -> Custom kernel patches.  I think to patch the 
kernel you would need to set that value to the 
snps-custom/packages/linux-arc-axs... path.

David

>
> Thanks!
>
> BR,
> Joao Pinto
>
>
>
> On 11/17/2015 11:13 AM, Joao Pinto wrote:
>> Thanks for your help!
>>
>> On 11/11/2015 12:04 PM, Arnout Vandecappelle wrote:
>>> On 11-11-15 12:35, Joao Pinto wrote:
>>>> Hi,
>>>> We are designing the procedure to release our software stack based on buildroot.
>>>> Could you please tell what is the advised method for including a kernel patch
>>>> set in buildroot? I typically use BR2_LINUX_KERNEL_PATCH where I indicate each
>>>> patch file. Is there a easier way like using BR2_GLOBAL_PATCH_DIR for example?
>>>
>>>   I personally prefer to use a git repository that includes the patches. During
>>> development, I make a local checkout specified with LINUX_OVERRIDE_SRCDIR; for
>>> release, I point to the repository (often on gitlab) and specify a tag.
>>>
>>>   BR2_GLOBAL_PATCH_DIR and BR2_LINUX_KERNEL_PATCH are basically equivalent, you
>>> can specify a directory with the latter as well.
>>>
>>>
>>>   Regards,
>>>   Arnout
>>>
>>>>
>>>> Thanks for your help!
>>>>
>>>> Joao
>>>> _______________________________________________
>>>> buildroot mailing list
>>>> buildroot at busybox.net
>>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>>
>>>
>>>
>>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Thanks,
David
