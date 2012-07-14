From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 14 Jul 2012 18:56:51 +0200
Subject: [Buildroot] [PATCH 1/1] skeleton: add default login port to
	/etc/securetty
In-Reply-To: <1342149545-10417-1-git-send-email-roylee17@gmail.com>
References: <1342149545-10417-1-git-send-email-roylee17@gmail.com>
Message-ID: <5001A4D3.1030802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/13/12 05:19, roylee17 at gmail.com wrote:
> From: Tzu-Jung Lee<tjlee@ambarella.com>
>
> We ran into a "Login incorrect" problem when running the same rootfs
> image across platforms with different loging ports ttyS0/1/2/3.
>
> Simply assignning "console" to BR2_TARGET_GENERIC_GETTY_PORT, which in
> turn modifies the /etc/inittab, is not enough because the "console" device
> was missing in the /etc/securetty.
>
> While current securetty has enumerated a lot of ttys, this patch should save
> some efforts to enumerate more.
>
> Change-Id: Ifb1239c80eb86528345b24eb8d04b52b67aa1209
> Signed-off-by: Tzu-Jung Lee<tjlee@ambarella.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  But perhaps it's even better to remove securetty completely?  If it just
enumerates all possible ttys (even non-existent ones), it doesn't really add
security...  (Note: I haven't verified if util-linux's login allows root login if
/etc/securetty is missing.)


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
