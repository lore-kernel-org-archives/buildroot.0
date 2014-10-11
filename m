From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 11 Oct 2014 17:47:25 +0200
Subject: [Buildroot] [PATCH v4] package/trinity: New package
In-Reply-To: <38121FAB319C3344930C920E7B51831320FD3B9E@LEMAIL01.le.imgtec.org>
References: <1412867742-53521-1-git-send-email-Vincent.Riera@imgtec.com>
 <CAHXCMMKe4BiNxg5j6WuH195fH3+konYpCk+vNBSaNNNRnb8ECQ@mail.gmail.com>
 <38121FAB319C3344930C920E7B51831320FD3A02@LEMAIL01.le.imgtec.org>
 <CAHXCMML3v10VLchF0dknLiQmpi-y_nj3bEqC6mJHu=GVG4Z8Qg@mail.gmail.com>
 <38121FAB319C3344930C920E7B51831320FD3B9E@LEMAIL01.le.imgtec.org>
Message-ID: <CAHXCMML2_6s4Wn6PEVoOK396vPr+M5jbf+258Q02oLmsNvGdFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 11, 2014 at 4:03 PM, Vincent Olivert Riera
<Vincent.Riera@imgtec.com> wrote:
> Dear Samuel Martin,
>
> it's very weird. I just used your defconfig and everything was fine. Look:
>
> [...]
> /usr/bin/install -m 0644 support/misc/target-dir-warning.txt /home/peratu/downloads/buildroot/output/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
> $ make savedefconfig && cat defconfig
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2014.08.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_PACKAGE_TRINITY=y
>

Humm... indeed weird! :-|

For the record, the gen-versionh.sh trace:
http://code.bulix.org/kn3whb-87181/?raw
I got this doing:
$ make trinity-dirclean
$ make trinity-configure
# add 'set -x' right after /bin/bash in
<output>/build/trinity-780d879c71979f54dfc9ec0a26e6f1e0d5e361e1/scripts/gen-versionh.sh
$ make trinity

Maybe you'll be able to find something.

Regards,

> Regards,
>
> --
> Vincent
> ________________________________________
> From: Samuel Martin [s.martin49 at gmail.com]
> Sent: 11 October 2014 14:40
> To: Vincent Olivert Riera
> Cc: buildroot
> Subject: Re: [Buildroot] [PATCH v4] package/trinity: New package
>
> Hi Vicente,
>
> On Sat, Oct 11, 2014 at 2:57 PM, Vincent Olivert Riera
> <Vincent.Riera@imgtec.com> wrote:
>> Dear Samuel Martin,
>>
>> can you provide a defconfig which fails? I have built it twice few minutes ago.
>
> Here it is: http://code.bulix.org/4oyy7r-87179/?raw
>
> And here the build error: http://code.bulix.org/j2n1a8-87180/?raw
>
> (I've just apply the patch from patchwork on top of master).
>
>>
>> Also, it will be faster if you send an email directly to the maintainer instead of a pull request, as it's said in the "Downloads:" section of trinity's website.
>
> Oops, forgot to check that :-s
> I will send a mail.
>
> Regards,
>
>
> --
> Samuel



-- 
Samuel
