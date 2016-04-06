From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Apr 2016 01:06:49 +0200
Subject: [Buildroot] [PATCH v4 3/7] barebox: support custom barebox
	output image name
In-Reply-To: <20160406201410.GA5332@smipidev>
References: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
 <1458513351-6556-4-git-send-email-pieter@boesman.nl>
 <5702F6AD.1030402@mind.be> <20160406201410.GA5332@smipidev>
Message-ID: <57059689.8070200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/06/16 22:14, Pieter Smith wrote:
> Hi Arnout / Thomas,
>
> On Tue, Apr 05, 2016 at 01:20:13AM +0200, Arnout Vandecappelle wrote:
[snip]
>>   However, on second thought I'm wondering if it is really needed. For u-boot
>> or the kernel, we always copy the images with the same name as they were
>> built. If that is not what the ROM boot loader expects, the name can be
>> changed in the image generation script. For example, genimage.cfg could
>> contain:
>>
>> image boot.vfat {
>>          vfat {
>>                  file MLO {
>> 			"barebox-am33xx-beaglebone-mlo.img"
>> 		}
>> 		file barebox.img {
>> 			"barebox-am33xx-beaglebone.img"
>>                  }
>>          }
>>          size = 8M
>> }
>>
>>
>>   What do you think?
>
> I agree that this is cleaner from a buildroot perspective. But this would
> require carrying a genimage.cfg patch for barebox as part of
> beaglebone_barebox_defconfig. Is this what you are suggesting?

  I don't really understand what you mean. As I suggested in that patch, it 
would be nice to add a genimage config as well. When you do that, you can use a 
fragment like above to make sure the files will have the correct name in the 
filesystem. (Like above, except I screwed up the indentation :-)

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
