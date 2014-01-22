From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 22 Jan 2014 12:19:04 +0100
Subject: [Buildroot] [PATCH] libnftnl: new package
In-Reply-To: <52DEDA5B.1070004@zacarias.com.ar>
References: <1390322446-3392-1-git-send-email-yegorslists@googlemail.com>
 <52DEDA5B.1070004@zacarias.com.ar>
Message-ID: <CAGm1_ksw0thmdH1w+G79cOsyrtVxG9T=dAuw9oyego+Ya9W8pw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 21, 2014 at 9:36 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> On 01/21/2014 01:40 PM, yegorslists at googlemail.com wrote:
>> --- /dev/null
>> +++ b/package/libnftnl/Config.in
>> @@ -0,0 +1,11 @@
>> +config BR2_PACKAGE_LIBNFTNL
>> +     bool "libnftnl"
>> +     select BR2_PACKAGE_LIBMNL
>> +     help
>> +       libnftnl is a userspace library providing a low-level
>> +       netlink programming interface (API) to the in-kernel
>> +       nf_tables subsystem. The library libnftnl has been
>> +       previously known as libnftables. This library is
>> +       currently used by nftables.
>> +
>> +       http://netfilter.org/projects/libnftnl/index.html
>
> +       depends on BR2_INET_IPV6
> +       depends on BR2_LARGEFILE
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
>
> I've already tested the messy stuff :)
> Also got a nftables package, didn't submit the set yet because it
> doesn't seem to run properly on a ppc target:
>
> ~ # nft list table filter
> <cmdline>:1:1-17: Error: Could not receive sets from kernel: Address
> family not supported by protocol
>
> Didn't track the sucker down yet (yeah got ipv6, all of the netfilter
> and nft modules loaded and so on).

I've send v2.

It will be good, if we could at least get all needed packages into BR.
I can imagine, that new version would appear in the near future, as
different distros would package nftables :-)

Yegor
