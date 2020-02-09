From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 9 Feb 2020 11:21:45 -0800
Subject: [Buildroot] [PATCH] package/uclibc: fix ctype.h is*_l
 definitions
In-Reply-To: <20200209163842.GT23769@scaer>
References: <20200207195144.4060-1-jcmvbkbc@gmail.com>
 <87mu9tv5qu.fsf@dell.be.48ers.dk> <20200209163842.GT23769@scaer>
Message-ID: <CAMo8BfLcrUf3rR9m7h5xjN5Cgbu-2q7qUnXivDX_Foxz1nXf7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 9, 2020 at 8:38 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> On 2020-02-08 09:32 +0100, Peter Korsgaard spake thusly:
> > >>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:
> >
> >  > ctype locale-specific macro definitions are broken because they result
> >  > in dereference of pointer to structure of incomplete type.
> >  > Drop these macros since they are optional and let applications use
> >  > functions with the same names.
> >
> >  > Backported from:
> >  >   https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=d1a3ca7ca56630fddde7311a0474eed4a21335a7
> >  > Fixes:
> >  >   http://autobuild.buildroot.net/results/b7ba1210d5aa184b133f0171da621d2b0083ec39
> >
> >  > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> >
> > Committed, thanks.
>
> uClibc now fails to build:
>     http://autobuild.buildroot.org/results/124/124e8ad32e1dbaf131749456f4b59333623cd91f/build-end.log
>
>     home/test/autobuild/run/instance-3/output-1/host/lib/gcc/xtensa-build
>     root-linux-uclibc/8.3.0/../../../../xtensa-buildroot-linux-uclibc/bin
>     /ld: libc/libc_so.a(isalnum_l.os):(.text+0x0): undefined reference to
>     `__isctype_l'
>
> Care to have a look, please?

Looking at it, sorry.

-- 
Thanks.
-- Max
