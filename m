From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 26 Jan 2019 00:34:31 +0100
Subject: [Buildroot] Building host-python-2.7.15 Failed
In-Reply-To: <CAAsE_udvpXEBB_euZymg+QHajf5oC5SSywpOCvoiY=Oyan2Xog@mail.gmail.com>
References: <CAAsE_udvpXEBB_euZymg+QHajf5oC5SSywpOCvoiY=Oyan2Xog@mail.gmail.com>
Message-ID: <8017d9a3-290f-f8de-8e13-55430ace2b77@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/01/2019 17:15, Woody Wu wrote:
> /usr/bin/gcc -pthread -shared
> -L/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/lib
> -Wl,-rpath,/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/lib
> -Wl,--enable-new-dtags
> build/temp.linux-x86_64-2.7/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/build/host-python-2.7.15/Modules/cryptmodule.o
> -L/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/lib
> -L/usr/lib/x86_64-linux-gnu -L/usr/local/lib -L. -lcrypt -lpython2.7 -o
> build/lib.linux-x86_64-2.7/crypt.so
> /usr/bin/ld: /usr/lib/x86_64-linux-gnu/libcrypt.a(crypt-entry.o): relocation
> R_X86_64_PC32 against symbol `_ufc_foobar' can not be used when making a shared
> object; recompile with -fPIC

 There is something wrong with your host compiler. There should be a
/lib*/libcrypt.so that the compiler links against, instead of
/usr/lib/libcrypt.a. On which distro do you work?

 Regards,
 Arnout
