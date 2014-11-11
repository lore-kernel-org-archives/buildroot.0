From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 11 Nov 2014 04:30:48 +0100
Subject: [Buildroot] [PATCH v2 13/15] erlang-p1-iconv: new package.
In-Reply-To: <20141110173012.GA22119@free.fr>
References: <1415366931-6870-1-git-send-email-johan.oudinet@gmail.com>
 <1415366931-6870-14-git-send-email-johan.oudinet@gmail.com>
 <20141110163700.GE2466@free.fr> <20141110173012.GA22119@free.fr>
Message-ID: <CAJtjsKYuoJLEcgf0f98ud6GDKDyu4qX8zHdXoQQhDos=+uAFQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

On Mon, Nov 10, 2014 at 6:30 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> Compiling c_src/iconv.c
>> /home/ymorin/x-tools/armv6-rpi-linux-gnueabihf/lib/gcc/armv6-rpi-linux-gnueabihf/4.9.1/../../../../armv6-rpi-linux-gnueabihf/bin/ld.bfd:
>> cannot find -lerl_interface
>> /home/ymorin/x-tools/armv6-rpi-linux-gnueabihf/lib/gcc/armv6-rpi-linux-gnueabihf/4.9.1/../../../../armv6-rpi-linux-gnueabihf/bin/ld.bfd:
>> cannot find -lei
>> /home/ymorin/x-tools/armv6-rpi-linux-gnueabihf/lib/gcc/armv6-rpi-linux-gnueabihf/4.9.1/../../../../armv6-rpi-linux-gnueabihf/bin/ld.bfd:
>> cannot find -lerl_interface
>> /home/ymorin/x-tools/armv6-rpi-linux-gnueabihf/lib/gcc/armv6-rpi-linux-gnueabihf/4.9.1/../../../../armv6-rpi-linux-gnueabihf/bin/ld.bfd:
>> cannot find -lei
>> collect2: error: ld returned 1 exit status
>> ERROR: sh(/home/ymorin/dev/buildroot/O/host/usr/bin/armv6-rpi-linux-gnueabihf-gcc
>> c_src/iconv.o
>> -L/home/ymorin/dev/buildroot/O/target/usr/lib/erlang/lib/erl_interface-/lib
>> -lerl_interface -lei  -shared
>> -L/home/ymorin/dev/buildroot/O/target/usr/lib/erlang/lib/erl_interface-/lib
>> -lerl_interface -lei -o priv/lib/iconv.so)
>> failed with return code 1 and the following output:
>> /home/ymorin/x-tools/armv6-rpi-linux-gnueabihf/lib/gcc/armv6-rpi-linux-gnueabihf/4.9.1/../../../../armv6-rpi-linux-gnueabihf/bin/ld.bfd:
>> cannot find -lerl_interface
>> /home/ymorin/x-tools/armv6-rpi-linux-gnueabihf/lib/gcc/armv6-rpi-linux-gnueabihf/4.9.1/../../../../armv6-rpi-linux-gnueabihf/bin/ld.bfd:
>> cannot find -lei
>> /home/ymorin/x-tools/armv6-rpi-linux-gnueabihf/lib/gcc/armv6-rpi-linux-gnueabihf/4.9.1/../../../../armv6-rpi-linux-gnueabihf/bin/ld.bfd:
>> cannot find -lerl_interface
>> /home/ymorin/x-tools/armv6-rpi-linux-gnueabihf/lib/gcc/armv6-rpi-linux-gnueabihf/4.9.1/../../../../armv6-rpi-linux-gnueabihf/bin/ld.bfd:
>> cannot find -lei
>> collect2: error: ld returned 1 exit status

I've seen this error few times when compiling several rebar packages.
As a workaround, I run `make erlang-dirclean'.
I'm not 100% sure of the reason for this error but I suspect that old
versions of rebar remove such libraries after compiling, which leads
to an error on the next compilation.

-- 
Johan
