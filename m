From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 27 Jul 2018 08:46:37 -0500
Subject: [Buildroot] [PATCH] package/uboot-tools: version.h collision
In-Reply-To: <20180727090347.2b0de571@windsurf>
References: <20180727035044.4313-1-matthew.weber@rockwellcollins.com>
 <20180727090347.2b0de571@windsurf>
Message-ID: <CANQCQpZW+maukTjSf5ZP_LcpzDyiKZ=6Cws2ak_PbPDBa48XfQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Jul 27, 2018 at 2:03 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Thu, 26 Jul 2018 22:50:44 -0500, Matt Weber wrote:
>> On some systems the host system or even the cross sysroot can
>> contain a version.h.  This leads to the wrong file being picked
>> up and a PLAIN_VERSION undefined error.
>>
>> This workaround symlinks the version.h into the tool folder to
>> allow reordering of search folders.
>>
>> Fixes
>> http://autobuild.buildroot.net/results/770/7702d5df36a6532aafdbe6e9e62709bbfa058b54/build-end.log
>> http://autobuild.buildroot.net/results/e34/e3401027d2fb3ce565ca9e2456a427afd3610a87/build-end.log
>> ... additional can be found with these queries ...
>> http://autobuild.buildroot.net/?reason=uboot-tools-2018.03
>> http://autobuild.buildroot.net/?reason=uboot-tools-2018.05
>>
>> Upstream: https://lists.denx.de/pipermail/u-boot/2018-July/336283.html
>>
>> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>
> This issue has already been fixed. It was btrfs-progs that was
> installing a version.h header directly in usr/include. It has been
> fixed by:
>
>   https://git.buildroot.org/buildroot/commit/package/btrfs-progs?id=83b40e1ea2e3ce046d7db442b01c3bfe52886ce8
>
> I agree it is nice to fix it properly upstream so that the presence of
> a header with a conflicting name doesn't confuse U-Boot, but I don't
> think it's worth having this patch in Buildroot since the problem no
> longer occurs.
>

Figured out why I though it was still an error, 2018.05.x doesn't have
that btrfs patch and occasionally fails.

Matt
