From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Tue, 13 Oct 2015 01:17:37 +0200
Subject: [Buildroot] [PATCH 1/4] configs/raspberrypi: use EABIhf
In-Reply-To: <20151012235935.6a195741@free-electrons.com>
References: <20150820143005.GA6441@ketchup.mtl.sfl>
 <1440273688-92868-1-git-send-email-benoit@wsystem.com>
 <20151012235935.6a195741@free-electrons.com>
Message-ID: <CA+sos78PFnHQLQknch1N22C=q_Qv=NaE1qvmUHi7ffnf6t=UeQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Mon, Oct 12, 2015 at 11:59 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Applied, thanks. I actually believe we should be doing the same for all
> ARMv6/ARMv7 platforms, except if there is a specific issue with using
> EABIhf (such as existing pre-built binaries that are EABI only).

Yes, there is such an issue because some hardware vendors provide
closed libraries that use soft-FP. It was the case e.g. for i.MX6
(audio/video CODEC and GPU libraries), but they now provide hard-float
binaries IIRC. So such a change should be checked on a per-platform
basis.

> Maybe we should even use EABIhf by default on ARMv6+.

Yes, I think that it would be a sane default, and it would still be
possible to set EABI for a specific platform for which EABIhf would
not apply.

Best regards,
Beno?t
