From: Christian Stewart <christian@paral.in>
Date: Mon, 23 Apr 2018 11:57:49 -0400
Subject: [Buildroot] [PATCH 1/1] go: bump to 1.10
In-Reply-To: <87y3i7q8fw.fsf@dell.be.48ers.dk>
References: <20180219072718.28895-1-christian@paral.in>
 <87po3js3j3.fsf@dell.be.48ers.dk> <87y3i7q8fw.fsf@dell.be.48ers.dk>
Message-ID: <877eoxc3uq.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Peter Korsgaard <peter@korsgaard.com> writes:
> What is common for all the failures is that the target arch == host arch
> (x86-64) AND the C library is different (musl/uclibc-ng).
>
> I did a quick test here and the reason is that host-go gets linked with
> the target C library:
>
> ls -lah build/host-go-1.10/bin/go
> -rwxr-xr-x 1 peko peko 11M Apr  1 16:44 build/host-go-1.10/bin/go
>
> ./build/host-go-1.10/bin/go
> zsh: no such file or directory: ./build/host-go-1.10/bin/go
>
> ldd ./build/host-go-1.10/bin/go
>         linux-vdso.so.1 (0x00007ffcd2bae000)
>         libc.so.0 => not found
>
> libc.so.0 is uClibc-ng.
>
> Care to take a look?

I haven't had a chance to check on this yet. I'm puzzled why the
behavior would be different between glibc and uclibc.

Will do some testing when possible.

Best,
Christian Stewart
