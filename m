From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Jun 2015 00:41:28 +0200
Subject: [Buildroot] [PATCH v2 1/1] board: add support for Warpboard
In-Reply-To: <20150625120747.GA8014@arthur-dreem>
References: <1434988018-16391-1-git-send-email-lambertarthur22@gmail.com>
 <558B254C.2090606@mind.be> <20150625120747.GA8014@arthur-dreem>
Message-ID: <558C8398.3040102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/25/15 14:07, Arthur LAMBERT wrote:
> Le Wednesday 24 Jun 2015 ? 23:46:52 (+0200), Arnout Vandecappelle a ?crit :
>>> new file mode 100644
>>> index 0000000..d9706c1
>>> --- /dev/null
>>> +++ b/board/freescale/warpboard/linux/linux-001-add-sdm-firmware.patch
>>> @@ -0,0 +1,145 @@
>>
>>  Patches should have a description and Signed-off-by.
>>
>>  But better yet, download it with BR2_LINUX_KERNEL_PATCH="http://... http://..."
>> instead of including it in buildroot.
>>
>> [snip]
> 
> I don't understand this suggestion. How can I download the patch instead if including it
> in buildroot since this patch does not exist anywhere. Theses patch are not commit in any git
> right now.

 OK sorry I didn't know that, your commit message "linux patch from Fabio
Estevam" suggested that you downloaded it from somewhere.


> Also you suggest me to include imx_usb_loader in warpoard_defconfig. I tried to
> flash my uboot by using the imx usb loader from buildroot but is does not work :

 Clearly that's not good :-)

[snip]
> I tried to update imx_usb_loader on last sha1 commit but same result.
> 
> To make it work I have to use an imx_usb_loader from github/warpboard which is different :
> https://github.com/warpboard/imx_usb_loader/commits/warp/master
> 
> How can I integrate it ? Do I need to add a patch on imx_usb_loader package to use custom git ?

 As far as I can see, only commit af78476b6, so you could download that as
board/freescale/warpboard/patches/imx-usb-loader/0001-...

 I don't think there's a need to support downloading custom patches in the
package itself.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
