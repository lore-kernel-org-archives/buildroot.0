From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 16 Jan 2015 11:29:26 +0100
Subject: [Buildroot] Python: ctype: find_library support
In-Reply-To: <CAGm1_kso0sheGZqzPugfxHba-9wVj-AwJHUd++DN+tRqqd=czg@mail.gmail.com>
References: <CAGm1_kso0sheGZqzPugfxHba-9wVj-AwJHUd++DN+tRqqd=czg@mail.gmail.com>
Message-ID: <CAGm1_kvnbZ=XfNZ7vr8D48z8A88Pb1S_DDauKhMjrYLDbbvH2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 14, 2015 at 8:54 AM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> This subject was brought up yesterday on IRC.
>
> Some packages like pyudev
> (https://pyudev.readthedocs.org/en/latest/index.html) require
> find_library support in order to emit proper *.so name. To do so,
> Python uses either /sbin/ldconfig, objdump or gcc (see
> https://docs.python.org/2/library/ctypes.html#finding-shared-libraries).
> See build/python-2.7.9/Lib/ctypes/util.py for implementation details.
>
> As we don't supply target gcc and objdump, /sbin/ldconfig seems to be
> the only solution. But in the default configuration of internally
> built toolchain library cache is disabled and in external toolchains
> (Sourcery CodeBench ARM 2014.05 for example), ldconfig is not provided
> at all.
>
> How can we solve this issue?

Hm. We seem not to be alone. There is a related, but unresolved and
uncommented bug in Python's bug tracker:
http://bugs.python.org/issue13508

I've also found this BR thread:
http://lists.busybox.net/pipermail/buildroot/2013-October/081219.html

Wojciech, have you tried to contact Python devs?

Yegor
