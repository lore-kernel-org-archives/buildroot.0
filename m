From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Thu, 24 Apr 2014 14:56:50 +0100
Subject: [Buildroot] [PATCH v3] package/zile: add Zile is Lossy Emacs
	editor
In-Reply-To: <20140417221418.5e3939fb@skate>
References: <1397737179-12262-1-git-send-email-alex.bennee@linaro.org>
 <1397737179-12262-2-git-send-email-alex.bennee@linaro.org>
 <20140417221418.5e3939fb@skate>
Message-ID: <87fvl2rftp.fsf@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

> Dear Alex Benn?e,
>
> On Thu, 17 Apr 2014 13:19:39 +0100, Alex Benn?e wrote:
>> This is a lightweight Emacs clone useful for embedded systems. I nabbed
>> the help2man disable patch from OpenEmbedded.
>
> There are unfortunately a few things still not good here.
<snip>
>
> Also, when I build your package with the toolchain at
> http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-arm-full.config,
> it fails to build with:
>
> /home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.7.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgc.so:
> undefined reference to symbol 'pthread_cancel'
> /home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.7.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
> note: 'pthread_cancel' is defined in DSO /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/lib/libpthread.so.0 so try adding it to the linker command line
> /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/lib/libpthread.so.0:
> could not read symbols: Invalid operation

OK I'm stuck on this one. Is this a weirdness caused my uclibc's pthread
implementation? The config.log shows it's correctly detected but it
fails on linking. Should I just --disable-threads for uclibc builds?

-- 
Alex Benn?e
