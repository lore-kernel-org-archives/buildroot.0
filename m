From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 23:53:57 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-07-22
In-Reply-To: <CAMo8BfJTvgvTPviYqiAhgMk+eEerLYU4m3cgGwC5XWmKp_gF7w@mail.gmail.com>
References: <20150723063018.EA19A101D01@stock.ovh.net>
 <55B12984.2090104@openwide.fr>
 <20150723221133.51e59215@free-electrons.com>
 <CAMo8BfJTvgvTPviYqiAhgMk+eEerLYU4m3cgGwC5XWmKp_gF7w@mail.gmail.com>
Message-ID: <20150723235357.52cc7ec0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Jul 2015 00:30:44 +0300, Max Filippov wrote:

> I looked at that patch a while ago and reported that it looks good but
> doesn't work for xtensa, got no reply though:
> http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/116099
> 
> Most of libgcc issues are just missing .literal_position in assembly
> functions, I'll post a patch that fixes them. But there's bigger issue
> with literals emitted for .init and .fini sections, for which I don't have
> a fix yet.

In the mean time, maybe we can just filter-out the
-mtext-section-literals from CFLAGS for Xtensa in gcc.mk ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
