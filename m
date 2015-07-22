From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 23:26:13 +0200
Subject: [Buildroot] [PATCH] snmppp: extract license text from source
 files
In-Reply-To: <20150722210108.GB3777@free.fr>
References: <1437496184-26203-1-git-send-email-luca@lucaceresoli.net>
 <20150721215438.19389da8@free-electrons.com>
 <20150722210108.GB3777@free.fr>
Message-ID: <20150722232613.149d5890@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Luca,

On Wed, 22 Jul 2015 23:01:08 +0200, Yann E. MORIN wrote:

> My point of view in the case there is no license file in the package:
> 
>  1) we should not regenerate a file, neither manually nor automatically:
>     - the automatic part (i.e. in the infra) can be easily foiled when a
>       package is updated,
>     - the manual part (like suggested by Luca) can also, but to a lower
>       extent, be broken on updates;
> 
>  2) if we refer to a file, it should be an existing file like a source
>     file.
> 
> But all-in-all, I believe we should not refer to a license file if
> there's none in the package.

The v3.cpp file is only 428 lines long, and weights 10260 bytes.
Comparatively, the GPLv2 text is 339 lines long for 18092 bytes, and
the GPLv3 text is 647 lines lon for 35147 bytes.

If you're really concerned about the file size used for the license of
snmppp, we could switch to use src/gauge.cpp instead of src/v3.cpp.
gauge.cpp is only 75 lines long, for 2804 bytes, and I'd say two thirds
of the file contents are license stuff.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
