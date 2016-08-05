From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Aug 2016 13:58:12 -0700
Subject: [Buildroot] [PATCH] glibc: add version 2.24
In-Reply-To: <20160805185348.4c0ff1fd@free-electrons.com>
References: <1470387567-64171-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160805185348.4c0ff1fd@free-electrons.com>
Message-ID: <2039F480-7B29-4B59-8F02-62125387E3F6@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Aug 5, 2016, at 9:53 AM, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> Hello,
> 
> On Fri, 5 Aug 2016 09:59:27 +0100, Vicente Olivert Riera wrote:
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>> package/glibc/Config.in  | 6 ++++++
>> package/glibc/glibc.hash | 1 +
>> 2 files changed, 7 insertions(+)
>> 
>> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
>> index f86822d..a9a6cc7 100644
>> --- a/package/glibc/Config.in
>> +++ b/package/glibc/Config.in
>> @@ -22,6 +22,11 @@ config BR2_GLIBC_VERSION_2_23
>> 	# No support for pthread barriers on < v9 ISA
>> 	depends on !BR2_sparc
>> 
>> +config BR2_GLIBC_VERSION_2_24
>> +	bool "2.24"
>> +	# No support for pthread barriers on < v9 ISA
>> +	depends on !BR2_sparc
> 
> One thing important I notice in the release announcement of 2.24 is:
> 
> * The minimum Linux kernel version that this version of the GNU C Library
>  can be used with is 3.2, except on i[4567]86 and x86_64, where Linux
>  kernel version 2.6.32 or later suffices (on architectures that already
>  required kernel versions more recent than 3.2, those requirements remain
>  unchanged).  Linux 3.2 or later kernel headers are required on all
>  architectures.
> 
> It is not written completely clearly: they first say that on
> x86/x86-64, 2.6.32 is sufficient, but they conclude that 3.2 is the
> minimum version on all architectures. It would be good to clarify this
> aspect.
> 
> Regardless of this detail, this means we will have to encode this
> dependency somehow. Indeed, we still have people using kernels older
> than 3.2 I believe on various platforms.

thats right. perhaps --enable-kernel=3.2.0 conditional on version being
2.24 in glibc mk file would put in a runtime check where apps would fail
to run on older kernels. If you want to detect it at build time then you
need to insert a mechanism to parse the kernel version of the build and
then compare that against kernel version used with --enable-kernel,

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 204 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160805/b94541fe/attachment.asc>
