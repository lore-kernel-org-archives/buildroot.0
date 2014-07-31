From: =?UTF-8?B?SsO2cmcgS3JhdXNl?= <jkrause@posteo.de>
Date: Thu, 31 Jul 2014 10:42:51 +0200
Subject: [Buildroot] Build failed for package avahi
In-Reply-To: <20140731093821.2c5d8ac3@free-electrons.com>
References: <53D9739C.7040301@posteo.de>	<20140731010417.77c5d67c@free-electrons.com>	<53D9EF25.8040803@posteo.de>
 <20140731093821.2c5d8ac3@free-electrons.com>
Message-ID: <53DA018B.6050507@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,


On 07/31/2014 09:38 AM, Thomas Petazzoni wrote:
> Dear J?rg Krause,
>
> On Thu, 31 Jul 2014 09:24:21 +0200, J?rg Krause wrote:
>
>>>> checking how to run the C++ preprocessor... /lib/cpp
>>>> configure: error: in
>>>> `/home/joerg/Freescale/buildroot/output/build/avahi-0.6.31':
>>>> configure: error: C++ preprocessor "/lib/cpp" fails sanity check
>>>> See `config.log' for more details
>>> Can you post the contents of output/build/avahi-0.6.31/config.log ?
>> I attached the config.log.
> Problem is:
>
> configure:13407: /lib/cpp  conftest.cpp
> ./configure: line 2321: /lib/cpp: No such file or directory
>
> Autotools (or parts of it) expect /lib/cpp to be a symbolic link to the
> C preprocessor. However, certain distributions (I think Archlinux) are
> no longer installing this symbolic link.

You're right, /lib/cpp is missing on Arch linux.

>
> I'm not sure what is to blame here: the distro not creating
> the /lib/cpp symbolic link, or the autotools using this symbolic link?

In my opinion autotools should be fixed. I have no experience with 
autotools. How can this be done?

Best regards
J?rg Krause
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140731/80f82c11/attachment.html>
