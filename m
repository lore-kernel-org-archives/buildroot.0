From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Sun, 17 Jan 2016 20:02:36 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20160117001117.569d43f2@free-electrons.com>
References: <20160116073021.A4B95101BCC@stock.ovh.net>
 <20160117001117.569d43f2@free-electrons.com>
Message-ID: <CAAMH-yuD1eTt6L0vSzUZpyQV+QrvY5MDyLGCUADFdb0JMFDCPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Jan 17, 2016 at 12:11 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> <snip>
>>          arm |         imx-kobs-3.14.28-1.0.0 | NOK | http://autobuild.buildroot.net/results/05a159c7f8382237d4c941b1bb6de7dad72708f3/
>
> Gary, can you have a look ?

This comes from the fact the mtd-user.h header used to include
stdint.h but it's no longer the case since linux 4.4.
http://lxr.free-electrons.com/source/include/uapi/mtd/mtd-user.h?v=4.3
http://lxr.free-electrons.com/source/include/uapi/mtd/mtd-user.h?v=4.4

So I guess I'll offer a patch that adds the stdint inclusion, plus
I'll update the package.

Regards,
Gary
