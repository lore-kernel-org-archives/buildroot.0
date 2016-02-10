From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Feb 2016 17:41:15 +0100
Subject: [Buildroot] Fwd: [PATCH 1/1] uboot: Strip "-Wl," from LDFLAGS
In-Reply-To: <CANCHnQppW3mmP=6WGBChD06+7ns0u1D5R6MQb=pxCmV6nQ7=Mw@mail.gmail.com>
References: <1455102927-28502-1-git-send-email-jer@airfi.aero>
 <CANCHnQppW3mmP=6WGBChD06+7ns0u1D5R6MQb=pxCmV6nQ7=Mw@mail.gmail.com>
Message-ID: <20160210174115.5c7f174d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this patch! See some comments below.

On Wed, 10 Feb 2016 16:03:23 +0100, Jeroen Roovers wrote:
> ---------- Forwarded message ----------
> From: Jeroen Roovers <jer@airfi.aero>
> Date: 10 February 2016 at 12:15
> Subject: [PATCH 1/1] uboot: Strip "-Wl," from LDFLAGS
> To: buildroot at buildroot.org
> Cc: Jeroen Roovers <jer@airfi.aero>
> 
> 
>     If we want to set proper LDFLAGS, then we need to mangle that in the
>     uboot build system as it calls ld(1) (in fact ld.bfd) directly,
>     where the "-Wl," prefix should only be used when the linker is
>     called indirectly through gcc(1).
> 
> Signed-off-by: Jeroen Roovers <jer@airfi.aero>

What specific/real problem is this fixing? I.e in which
situation/configuration are you seeing that TARGET_LDFLAGS contains a
-Wl option?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
