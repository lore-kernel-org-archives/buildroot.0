From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 09:19:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/openldap: don't patch libtool
In-Reply-To: <CAPi7W81VVd+YaHfjtZohWvPD6Kyqw=u8g6ZbxTu6AbRkxKKx6Q@mail.gmail.com>
References: <20190328172937.11268-1-fontaine.fabrice@gmail.com>
 <20190328185416.01eb56c6@windsurf>
 <CAPi7W83jjGhMgEy7_c4pnHynxeC4Ym5vtCpCUhS_JkJ4YtDXnQ@mail.gmail.com>
 <CAPi7W81VVd+YaHfjtZohWvPD6Kyqw=u8g6ZbxTu6AbRkxKKx6Q@mail.gmail.com>
Message-ID: <20190401091922.4eab8812@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Mar 2019 00:00:58 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> The issue is raised by this openldap specific patch (added in 2005) on
> ltmain.sh:
> https://github.com/openldap/openldap/commit/7b6a088a2590fdad10286d10050b769e48554e13.
> This patch adds a use_static_libs that is not managed by
> https://git.buildroot.net/buildroot/tree/support/libtool/buildroot-libtool-v1.5.patch.
> 
> So, the issue can be fixed if I patch ltmain.sh to revert those
> changes. However, I suppose that this patch won't be upstreamable.

Thanks for the research. I applied your alternate solution, which you
proposed as v2. To be honest, I'm not sure which one was the best
option, so I've decided pretty much arbitrarily.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
