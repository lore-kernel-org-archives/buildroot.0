From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 Aug 2017 18:30:06 +0200
Subject: [Buildroot] [PATCH 1/2] alsa-lib: add patch to fix incorrect
 code dependency
In-Reply-To: <20170812135013.14446155@windsurf>
References: <20170811212103.24433-1-thomas.petazzoni@free-electrons.com>
 <20170812100046.GB3021@scaer> <20170812135013.14446155@windsurf>
Message-ID: <0d61e1b6-5ab2-bf5d-7a1e-bcd0fab91f04@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-08-17 13:50, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 12 Aug 2017 12:00:46 +0200, Yann E. MORIN wrote:
> 
>>> +/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libasound.a(pcm_dmix.o): In function `snd_pcm_dmix_sync_ptr':
>>> +pcm_dmix.c:(.text+0x83c): warning:
>>> +/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libasound.a(rawmidi_symbols.o):(.data+0x4): undefined reference to `_snd_module_rawmidi_virt'
>>> +collect2: error: ld returned 1 exit status
>>> +
>>> +To fix this, we make sure that rawmidi_symbols.c only uses
>>> +_snd_module_rawmidi_virt when available.
>>> +
>>> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  
>>
>> Upstream status?
> 
> I submitted it upstream after sending the Buildroot patch, so I didn't
> had the link. But it's submitted upstream, see
> https://www.spinics.net/lists/alsa-devel/msg65902.html.

 I added this link to the patch and applied to master, thanks.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
