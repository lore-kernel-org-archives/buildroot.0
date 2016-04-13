From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Apr 2016 22:20:14 +0200
Subject: [Buildroot] [PATCH v4] qt5webkit: restore package
In-Reply-To: <20160413220646.102e7cd5@free-electrons.com>
References: <1460554835-5242-1-git-send-email-gary.bisson@boundarydevices.com>
 <20160413220646.102e7cd5@free-electrons.com>
Message-ID: <570EA9FE.4090709@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/13/16 22:06, Thomas Petazzoni wrote:
> Hello,
>
> Thanks. Looks mostly good, but I have a few questions.
>
> On Wed, 13 Apr 2016 15:40:35 +0200, Gary Bisson wrote:
>
>> Since we are now using the source from the git repository, we need
>> to create an empty .git/ folder to force the headers re-generation.
>> https://github.com/meta-qt5/meta-qt5/blob/jethro/recipes-qt/qt5/qt5.inc#L33
>>
>> Note that GPLv3 license option has been added with this release.
>
> Yes, but I don't see any reference to GPLv3 in your license information
> below.

  Argh, licensing. A LICENSE.GPLv3 file has been added to the package. Clearly, 
whenever a package is licensed under LGPLv2+, you are allowed to redistribute it 
under GPLv3+. But I don't think that that's very relevant for us.

  However, when you look at the source files, all of them (except for a few 
build tools) are either LGPLv2 or BSD-3c or BSD-2c (a bunch of them are 
dual-licensed, but that's hardly relevant for the package as a whole because not 
all files are dual-licensed). Yes, indeed, the license file is for LGPLv2.1, but 
that doesn't correspond to the actual source code.

  I threw it into the unomaha fossology a couple of days ago [1] so I'm pretty 
sure of my statement :-)

  Hm, taking a second look, there are in fact a few dozen files that are 
LGPLv2.1+, so I guess indeed the concluded license should be LGPLv2.1+.

  Regards,
  Arnout

[1] 
https://fossology.ist.unomaha.edu/?mod=license&upload=8&folder=1&item=107&show=quick

>
>
>> +ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
>> +QT5WEBKIT_LICENSE = LGPLv2+, BSD-3c, BSD-2c
>> +# Source files contain references to LGPL_EXCEPTION.txt but it is not included
>> +# in the archive.
>> +QT5WEBKIT_LICENSE_FILES += LICENSE.LGPLv21
>> +else
>> +QT5WEBKIT_LICENSE = LGPLv2+ (WebCore), Commercial license
>> +QT5WEBKIT_REDISTRIBUTE = NO
>> +endif
>
> No reference to GPLv3 whatsoever.
>
> Also, LGPLv2+ is not correct I believe, it should be LGPLv2.1+, as the
> name of the license file suggests.
>
> Thanks!
>
> Thomas
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
