From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 02 Jan 2015 22:56:34 +0100
Subject: [Buildroot] [PATCH 1/2] dhcpcd: fix build on old toolchains
	(sa_family_t)
In-Reply-To: <20150102191233.1bf32420@free-electrons.com>
References: <1420216745-24218-1-git-send-email-luca@lucaceresoli.net>
 <20150102191233.1bf32420@free-electrons.com>
Message-ID: <54A71412.6030405@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni wrote:
> Dear Luca Ceresoli,
>
> On Fri,  2 Jan 2015 17:39:04 +0100, Luca Ceresoli wrote:
>> Fixes error such as:
>>    .../sysroot/usr/include/linux/netlink.h:31:2: error: unknown type name 'sa_family_t'
>>    .../sysroot/usr/include/linux/netlink.h:31:2: error: expected specifier-qualifier-list before 'sa_family_t'
>>
>> And autobuild failures:
>>    http://autobuild.buildroot.net/results/d92/d92e7f2af0e64bc40f7b5c9ea081471de98bf8e8/
>>    http://autobuild.buildroot.net/results/e97/e97e980a2f1e0ff4138a6dc03d86ad3ff0973e4a/
>>    http://autobuild.buildroot.net/results/ca3/ca32c4de8b645c96cedb80b6270a792e9601ad84/
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>
> But if it's actually the toolchain that is broken, should we instead
> have a patch against the toolchain headers? There are other packages
> that had similar problems with these toolchains.

Honestly I don't know. A few days ago I had the same problem with
dhcpcd 6.6.7 and a pretty old custom toolchain. The issue only emerged
since dhcpcd 6.6.6 (BWHAHAHA!). Changing toolchain was not an option
here, so I came up with this quick fix.

When I saw Baruch's patch today on the list I thought I'd propose my
patch. Maybe I was too quick and should have asked before sending...

At least my solution (o workaround, or whatever) is in the archives,
and anybody with the same problem can find this workaround until a
better solution is available.

-- 
Luca
