From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jan 2011 09:28:50 +0100
Subject: [Buildroot] fontconfig: bump to version 2.8.0
In-Reply-To: <BAY145-w55783B9ED56A589ABC3816C2F30@phx.gbl>
References: <BAY145-w55783B9ED56A589ABC3816C2F30@phx.gbl>
Message-ID: <20110114092850.1fb27fc1@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt,

On Thu, 13 Jan 2011 21:12:09 -0700
Matt Johnson <mj1856@hotmail.com> wrote:

> Signed-off-by: Matt Johnson <mj1856@hotmail.com>
> ---
>  ...fontconfig-2.6.0-parallel-compilation-fix.patch |   26 -------

In the commit description, would be great to say that the
parallel-compilation-fix patch is no longer necessary since it has been
merged upstream at

  http://cgit.freedesktop.org/fontconfig/commit/?id=0e21b5a4d5609a5dd0f332b412d878b6f1037d29

so that people reviewing your patch can easily understand why it's no
longer necessary.

>  .../fontconfig-2.6.0-use_for_build.patch           |   80 --------------------
>  .../fontconfig-2.8.0-use_for_build.patch           |   80 ++++++++++++++++++++

A patch has been committed upstream that intends to fix some
cross-compilation issues:

 http://cgit.freedesktop.org/fontconfig/commit/?id=2a6b235ff6d2750171e8dff7cfdfe3bccb0f630e

but it is not part of fontconfig-2.8.0. Does it solve all problems
fixed by the use_for_build patch ? If so, I'd prefer to see an already
upstreamed patch used in Buildroot, with the proper comment mentionning
that the next version of fontconfig will include this fix.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
