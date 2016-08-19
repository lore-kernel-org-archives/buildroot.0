From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Aug 2016 10:47:05 -0700
Subject: [Buildroot] [PATCH 1/1] arch/arm: Add Cortex-a53 CPU
In-Reply-To: <20160819100320.1d2609bd@free-electrons.com>
References: <1471565224-15625-1-git-send-email-flatmax@flatmax.org>
 <20160819100320.1d2609bd@free-electrons.com>
Message-ID: <192101AE-C8DB-444C-8A52-68EA27264045@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Aug 19, 2016, at 1:03 AM, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> Hello,
> 
> On Fri, 19 Aug 2016 10:07:04 +1000, Matt Flax wrote:
>> Adds the Cortex-a53 CPU to the target architecture variant choice. This sets
>> the toolchain to use cortex-a53 as the target. The effect is that various
>> cortex-a53 tunings are enabled for the compilation of packages.
>> 
>> Signed-off-by: Matt Flax <flatmax@flatmax.org>
> 
> The A53 is an ARM64 CPU, so it should rather be added to
> Config.in.aarch64 (in which we don't yet have a CPU selection, but that
> can be added).
> 
> Or are you building a 32 bits ARM system for a Cortex-A53 ? In that
> case, adding it to Config.in.arm would be OK, but it's a bit annoying
> that we would have to duplicate many ARM CPUs between Config.in.arm and
> Config.in.aarch64.

64bit kernel with 32bit userspace is most common usecase as of now for
a53 that I see. so you need some sort of multilib.

> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 204 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160819/f178d6c9/attachment.asc>
