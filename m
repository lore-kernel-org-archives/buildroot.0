From: Jeroen Roovers <jer@airfi.aero>
Date: Fri, 3 Jun 2016 16:10:08 +0200
Subject: [Buildroot] Fwd: [PATCH 1/1] uboot: Strip "-Wl," from LDFLAGS
In-Reply-To: <20160603160342.09e52895@free-electrons.com>
References: <1455102927-28502-1-git-send-email-jer@airfi.aero>
 <CANCHnQppW3mmP=6WGBChD06+7ns0u1D5R6MQb=pxCmV6nQ7=Mw@mail.gmail.com>
 <20160603151804.41a9baa7@free-electrons.com>
 <CANCHnQqhQjhG6EBapYvSODPCXjMFpLZx2AAB4bnUWuJuy4kcKg@mail.gmail.com>
 <20160603160342.09e52895@free-electrons.com>
Message-ID: <CANCHnQq_kxXOzbKUHBgS9Lj4wnVzb17Ld7DnBLMyadWcQ0Ez=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hm, OK. I did just discover that I'm on an AllWinner fork of uboot, so
maybe it doesn't apply to mainline uboot at all. If you cannot
reproduce the issue, then that may be the cause, in which case I guess
you would want to drop that patch.


Regards,
     jer

On 3 June 2016 at 16:03, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 3 Jun 2016 16:00:42 +0200, Jeroen Roovers wrote:
>
>> The patch *doesn't* pass LDFLAGS down; GNU make simply picks up the
>> exported LDFLAGS from buildroot and integrates it with its own flags.
>> I only found out because when I set BR2_TARGET_LDFLAGS using the usual
>> GCC flags and did a complete rebuild, I found that only uboot failed
>> to build.
>
> Buildroot does not export LDFLAGS, and only passes it down to packages
> if it's explicitly done in the package .mk file.
>
> Try the defconfig I posted, it built just fine, even though it has
> -Wl,--as-needed in BR2_TARGET_LDFLAGS.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
