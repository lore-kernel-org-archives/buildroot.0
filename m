From: Will Newton <will.newton@gmail.com>
Date: Thu, 17 Mar 2011 12:20:16 +0000
Subject: [Buildroot] [PATCH] libnss: Add new package.
In-Reply-To: <20110315235711.05d56f8d@surf>
References: <AANLkTinFsyQbjv2PvuzV3TDmzMDZkCfAR95_sycwBo1x@mail.gmail.com>
	<20110315235711.05d56f8d@surf>
Message-ID: <AANLkTi=sR0f9wavbSMjiJ4VhkjfNehzw6DGFs23pKr1N@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 15, 2011 at 10:57 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Mon, 14 Mar 2011 17:24:56 +0000
> Will Newton <will.newton@gmail.com> wrote:
>
>> NSS is the Network Security Services library developed as part of
>> the Mozilla project. It provides similar functions to OpenSSL but
>> allows MPL, GPL and LGPL licensing.
>
> Just curious, besides Mozilla software, are there other software
> components that rely on libnss ?

Yes, there's a discussion about it here:

http://lwn.net/Articles/428292/

It's part of the LSB and is also used by some quite high profile
proprietary software packages.

>> +config BR2_PACKAGE_LIBNSS
>> + ? ? bool "libnss"
>> + ? ? depends on BR2_PACKAGE_LIBNSPR
>> + ? ? depends on BR2_PACKAGE_SQLITE
>> + ? ? depends on BR2_PACKAGE_ZLIB
>
> The tradition is to use "select" dependencies for
> non-obvious dependencies on libraries.

Ok, fixed.

>> diff --git a/package/libnss/libnss-cross.patch
>> b/package/libnss/libnss-cross.patch
>
> Your patch seems wrapped.

Hopefully the attached version will not be word wrapped. Unfortunately
gmail makes it very difficult not to word wrap patches (I don't have
SMTP access from behind the corporate firewall).

> The patch lacks a description.

I've added some description to the patches.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-libnss-Add-new-package.patch
Type: text/x-patch
Size: 5667 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110317/534f5819/attachment.bin>
