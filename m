From: Gilles Talis <gilles.talis@gmail.com>
Date: Thu, 23 Mar 2017 14:11:52 +0100
Subject: [Buildroot] [PATCH 1/2] leptonica: make package description
	more accurate
In-Reply-To: <20170322224550.24be1023@free-electrons.com>
References: <1490164887-2707-1-git-send-email-gilles.talis@gmail.com>
 <20170322224550.24be1023@free-electrons.com>
Message-ID: <CAKcgs2yH-YOcSxZQ5Jms7b2bMkvJzdyHFxrVpdWzd=j-n_OOKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2017-03-22 22:45 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Wed, 22 Mar 2017 07:41:26 +0100, Gilles Talis wrote:
>> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
>> ---
>>  package/leptonica/Config.in | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> Both patches applied, thanks!
>
> Note that we have a number of build failures on the leptonica package:
>
>   http://autobuild.buildroot.net/?reason=leptonica-1.74.1
>
> These occur in static linking scenarios, because leptonica configure
> script is not using pkg-config to find the TIFF library, so it doesn't
> know about the transitive dependencies of the TIFF library. Switching
> to PKG_CHECK_MODULES() to discover the TIFF library would solve this I
> believe.
Will check this. Thanks for the tip!

Best regards,
Gilles
