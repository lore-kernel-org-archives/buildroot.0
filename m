From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Aug 2013 18:41:13 +0200
Subject: [Buildroot] [PATCH] targets: move target options to their own
 sub-menu
In-Reply-To: <20130816175906.GA3422@free.fr>
References: <1376598482-9492-1-git-send-email-yann.morin.1998@free.fr>
 <520D5FE6.2090007@mind.be>
 <CAAXf6LV8gfZUmLogOubg5j03d9HJR7-bm+cm+HDG-N6kNAiK_g@mail.gmail.com>
 <201308160839.05082.yann.morin.1998@free.fr>
 <CAAXf6LXZ3vzUfexiNiGZu-c-chMZ0rKOpGs=N9APmTO_Y63wRg@mail.gmail.com>
 <CAAXf6LVX6TR+dPhS_FGHZpf+-_j_XBaCVaQxFY+MFp=O7m+LNA@mail.gmail.com>
 <20130816175906.GA3422@free.fr>
Message-ID: <20130818184113.61b46b20@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 16 Aug 2013 19:59:07 +0200, Yann E. MORIN wrote:

> This is two-sided:
>   - either you consider what Buildroot has to offer: one kernel, and
>     multiple bootloaders;
>   - or you consider what the user may want to install on the targe, at
>     most one kernel, and at most one bootloader.

"At most one bootloader" is wrong in many situations. On many ARM
platforms, you have two bootloaders. A small first stage bootloader,
and a full-featured second stage bootloader such as U-Boot or Barebox.

On AT91 platforms, you have AT91Bootstrap + U-Boot or Barebox.

On some i.MX platforms, you have mxs-bootlets + U-Boot or Barebox.

On some OMAP platforms, you have X-Loader + U-Boot.

etc, etc.

So clearly, we should keep "Bootloaders" in the plural form.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
