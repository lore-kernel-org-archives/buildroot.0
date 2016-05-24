From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 May 2016 14:51:25 -0300
Subject: [Buildroot] [PATCH] xserver_xorg-server: add explicit handling
	for xwayland
In-Reply-To: <8760u3cvhp.fsf@dell.be.48ers.dk>
References: <1464095077-9405-1-git-send-email-gustavo@zacarias.com.ar>
 <8760u3cvhp.fsf@dell.be.48ers.dk>
Message-ID: <5744949D.8020206@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/05/16 12:43, Peter Korsgaard wrote:

> Thanks. Except for libepoxy (and wayland) these are just normal
> libraries. Would it make sense to pull them in in Config.in:
>
> E.G.:
>
>          select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_WAYLAND
>          select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_WAYLAND
>
> But ok, that can be done as a followup patch. Committed, thanks!

Hi.
Ideally this should be an option together with "classic" X server (since 
they're both different binaries).
Xwayland (X on top of wayland) doesn't need/have use for all the xorg 
drivers, and doesn't need the classic server either, but that's material 
for 2016.08+
This solves the corner case where all of the automatic deps trigger a 
failure because configure isn't complete.
Regards.
