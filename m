From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Jun 2014 08:39:25 +0200
Subject: [Buildroot] [PATCH] reenable microblaze little endian for
 internal musl toolchain
In-Reply-To: <CAPALihOk0J7b7GWzth6AsiEm5KE7EZJ1w_XeSfRXbBvZ_Aa04Q@mail.gmail.com>
References: <20140531084556.GA17277@waldemar-brodkorb.de>
 <CAPALihPyH5erdhQOsTiQ7E2_La9AuTi_7ED5tUqpfph713sjWw@mail.gmail.com>
 <20140531234315.3cc32e4e@free-electrons.com>
 <CAPALihOk0J7b7GWzth6AsiEm5KE7EZJ1w_XeSfRXbBvZ_Aa04Q@mail.gmail.com>
Message-ID: <20140601083925.45e9502d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear William Welch,

On Sat, 31 May 2014 17:12:45 -0500, William Welch wrote:

> I did not manually enter any specifics about where/how to download the
> toolchain.
> 
> When I asked for an external toolchain, Musl was the only external
> toolchain listed.

Right.

> The resulting 'savedefconfig' looked like this (note: there is no mention
> of musl...)
> 
> BR2_microblazeel=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_ENABLE_LOCALE_PURGE=y
> BR2_TARGET_OPTIMIZATION="-pipe -mno-xl-soft-mul -mxl-barrel-shift
> -mcpu=v8.20.a"

There is nothing wrong in what you did. There was a bug in Buildroot,
and I already sent a patch to fix it, and the fix is part of the final
2014.05 release.

The problem was that Buildroot was assuming the pre-built Musl
toolchain was valid for both Microblaze BE and Microblaze LE, which is
not the case. Therefore, in commit
http://git.buildroot.net/buildroot/commit/?id=77ef6a3a12ec1e41317ddfa54842c6a59d75dab8
this problem was fixed. You were in Cc of the patch.

So from now on, if you select Microblaze little endian as the
architecture, the pre-built Musl toolchain will not be selectable.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
