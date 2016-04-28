From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 28 Apr 2016 11:51:59 -0300
Subject: [Buildroot] [PATCH] mpv: va-api requires egl-drm,
 wayland and/or x11
In-Reply-To: <20160428164216.0e28690d@free-electrons.com>
References: <1461853987-5313-1-git-send-email-gustavo@zacarias.com.ar>
 <20160428164216.0e28690d@free-electrons.com>
Message-ID: <5722238F.9080308@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/04/16 11:42, Thomas Petazzoni wrote:

> Can we make that positive logic ?
>
> ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_XLIB_LIBX11),y)
> enable vaapi
> else
> disable vaapi
> endif
>
> or you have cases where wayland on X is used, so you have both options
> set to 'y' and still want the vaapi support ?
>
> Thomas

Hi.
Unfortunately both at the same time is possible, hence why i shyed away 
of including egl-drm support without clean knobs.
If you look at the libva package it can conditionally enable xorg and/or 
wayland support.
Regards.
