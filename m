From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
Date: Tue, 13 Nov 2018 22:34:12 +0100
Subject: [Buildroot] [PATCH v2] linux-firmware: bump version to latest
 1baa348
In-Reply-To: <20181113210216.37879bd4@windsurf>
References: <20181108153322.17362-1-m.niestroj@grinn-global.com>
 <20181109215700.6b8dc6af@windsurf> <20181109210610.GB2445@scaer>
 <87bm6svqpy.fsf@grinn-global.com> <20181113210216.37879bd4@windsurf>
Message-ID: <87a7mcsluz.fsf@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

> Hello,
>
> On Tue, 13 Nov 2018 18:20:57 +0100, Marcin Niestr?j wrote:
>
>> I have investigated the issue on my side. It turns out that gzip is
>> really the issue here.
>
> Thanks for the additional investigation!

Some new findings now. It turned out that I actually used pigz instead
of gzip. It was not directly clear, because I had PATH variable
prepended with a directory containing "gzip -> /usr/bin/pigz". I have
set this up ~3 years ago and totally forgot about that. Sorry for
misleading that gzip version / patch could be the reason of wrong hash
in my case.

I need to really go through all the patches that got applied to
master...

>
>> You can find differences in package here:
>> https://git.archlinux.org/svntogit/packages.git/log/trunk?h=packages/gzip
>> 
>> I have also checked output of gzip command on another PC with pigz
>> configured as gzip drop-in replacement. It outputs even different file,
>> with different sha256 hash.
>> 
>> I think the overall conclusion is that a host-gzip package is needed,
>> just like host-tar. In the meantime I will send v3 of this patch with
>> proper hash (the same as you calculated above).

-- 
Marcin Niestr?j
