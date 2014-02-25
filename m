From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 25 Feb 2014 14:10:04 +0100
Subject: [Buildroot] Few questions external toolchain
In-Reply-To: <530C6DD2.4070605@gmail.com>
References: <530B8CEA.90306@gmail.com> <530C6DD2.4070605@gmail.com>
Message-ID: <CAAXf6LUnOyzHbSaOZtcBak55CQuKr=zSzzgH8zLkaF7zGPdSVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marco,

On Tue, Feb 25, 2014 at 11:17 AM, Marco Trapanese
<marcotrapanese@gmail.com> wrote:
>
> After digging a bit more I found the following:
>
> ls -l ~/dev/buildroot/output/host/usr/bin/*gcc
>
> lrwxrwxrwx 1 marco marco     21 feb 25 11:00 arm-fsl-linux-gnueabi-gcc ->
> ext-toolchain-wrapper
> -rwxr-xr-x 1 marco marco   5908 feb 25 11:00 ext-toolchain-wrapper
>
>
> ./arm-fsl-linux-gnueabi-gcc
> arm-fsl-linux-gnueabi-gcc: fatal error: no input files
>
> it's ok, but:
>
> ./ext-toolchain-wrapper
> /home/marco/dev/fsl-linaro-toolchain/bin/ext-toolchain-wrapper: No such file
> or directory
>
> I don't understand this behavior and I didn't find any information about in
> the documentation. Did I searched wrong?

The external toolchain wrapper is created automatically by buildroot
when the toolchain is 'installed'.
However, above I see two different paths:
/home/marco/dev/fsl-linaro-toolchain/bin/ext-toolchain-wrapper
and
~/dev/buildroot/output/host/usr/bin/

Have you moved the buildroot repository to another location? Normally
the toolchain wrapper is located in <output>/host/usr/bin, just like
the symbolic links that point to it.

Best regards,
Thomas
