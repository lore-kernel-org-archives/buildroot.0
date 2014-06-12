From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Jun 2014 09:17:45 +0200
Subject: [Buildroot] [PATCH v2 1/1] xserver_xorg-server: Depends on
 host-xfont_font-util
In-Reply-To: <1402524987-24727-1-git-send-email-bernd.kuhls@t-online.de>
References: <1402524987-24727-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140612091745.73abc72f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu, 12 Jun 2014 00:16:27 +0200, Bernd Kuhls wrote:
> Fixes build error:
> >>> xserver_xorg-server 1.15.1 Autoreconfiguring
> configure.ac:51: error: must install font-util 1.1 or later before running autoconf/autogen

Why is your xserver_xorg-server package autoreconfiguring itself? In
the mainline Buildroot tree, we don't autoreconf the X.org server:

$ grep AUTORECONF package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
$

Isn't the problem you're seeing related to a local change you've made
to the X.org server package?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
