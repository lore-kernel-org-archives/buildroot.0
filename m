From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 7 Oct 2011 20:34:34 +0200
Subject: [Buildroot] [PATCH] crosstool-ng: add dependency to host-lzma
 if no lzma found
In-Reply-To: <201110072010.50040.yann.morin.1998@anciens.enib.fr>
References: <5ce1be6b920b684e152c.1317999108@localhost6.localdomain6>
 <201110072010.50040.yann.morin.1998@anciens.enib.fr>
Message-ID: <CAAXf6LUkL=AE7UHrn_KiVNGCWbDb1zVzbiesJFoGXurb5sSWjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Fri, Oct 7, 2011 at 8:10 PM, Yann E. MORIN
<yann.morin.1998@anciens.enib.fr> wrote:
> Thomas, All,
>
> On Friday 07 October 2011 16:51:48 Thomas De Schampheleire wrote:
>> Crosstool compilation fails when lzma is not present. If not present on the host
>> system, we should compile one ourselves.
>>
>> This patch uses the already existing but seemingly unused check-host-lzma.sh
>> script in toolchain/dependencies.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> NAK.
>
> A better solution is to remove the check from crosstool-NG's ./configure.
> It's the way I followed upstream.
>
> In fact, it's a bit more complex than that. In the current development
> version of crosstool-NG, ./configure still checks for lzma, but it is
> not an error if it is missing.

From which version is this available? No stable version as for now,
but the next one?

How would you like to proceed? Will you add the patch that modifies
the configure script to buildroot, or would you like me to do it?

>
> lzma (and/or now xz-utils) are used in crosstool-NG for two things:
> ?- apply the contributions in contrib/
> ?- download lzma/xz-compressed tarballs if possible
>
> For buildroot use-case, just removing the check is largely sufficient,
> because buildroot does not use the contrib/ution in crosstool-NG, and
> the download will not try .xz or .lzma, but directly try .bz2
>
> So, this is a NAK on my part.

Ok, thanks for your comments.

Best regards,
Thomas
