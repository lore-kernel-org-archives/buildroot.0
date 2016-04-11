From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 11 Apr 2016 23:57:15 +0200
Subject: [Buildroot] [PATCH v2] qt5webkit: restore package
In-Reply-To: <CAAMH-ysd-NmBVqYD7KAfh8kJYqcFxpM_fUmwF4ULFsaZEwPp=w@mail.gmail.com>
References: <1459525200-12624-1-git-send-email-gary.bisson@boundarydevices.com>
 <570ACBCE.3090506@mind.be>
 <CAAMH-ysd-NmBVqYD7KAfh8kJYqcFxpM_fUmwF4ULFsaZEwPp=w@mail.gmail.com>
Message-ID: <570C1DBB.4090900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/11/16 23:13, Gary Bisson wrote:
> Arnout, All,
>
> On Sun, Apr 10, 2016 at 11:55 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 04/01/16 17:40, Gary Bisson wrote:
[snip]
>>> +ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
>>> +QT5WEBKIT_LICENSE = LGPLv2+ (WebCore), LGPLv2.1 with exception or LGPLv3
>>> or GPLv2 or GPLv3
>>
>>   Actually, as far as I can see with the help of fossology, it's all LGPLv2+
>> except a few files which specify additional possibilities. So I'd say that
>> it's LGPLv2+.
>>
>>   There is also quite a lot of BSD-2c and BSD-3c, so I'd add those, even if
>> there's no corresponding license file.
>>
>>   There are also a few build tools that are GPLv2+ but we don't consider
>> those.
>
> Yes sorry I actually just looked at the LICENSE files available. The
> Yocto recipe actually says "BSD & LGPLv2+ | GPL-2.0"[1].
>
> So I'll discard the GPLv2 as for build tools. Should I specify BSD-2c
> and BSD-3c or is BSD sufficient?

  LGPLv2+, BSD-3c, BSD-2c


  Regards,
  Arnout

>
>>> +# Source files contain references to LGPL_EXCEPTION.txt but it is not
>>> included
>>> +# in the archive.
>>> +QT5WEBKIT_LICENSE_FILES += LICENSE.LGPLv21 LICENSE.LGPLv3 LICENSE.GPLv2
>>> LICENSE.GPLv3
>>
>>   This is a funny situation... Four license files are provided, but none of
>> them actually corresponds to the license of the code... Anyway, I'd keep
>> just the LGPLv21 file.
>
> They got me there.
>
[snip]
>
> [1] https://github.com/meta-qt5/meta-qt5/blob/master/recipes-qt/qt5/qtwebkit_git.bb#L4
>

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
