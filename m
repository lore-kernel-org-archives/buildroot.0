From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 May 2014 11:37:27 +0200
Subject: [Buildroot] [WIP PATCH 2/5] gcc-final: disable shared build for
 static
In-Reply-To: <1401055980-28742-3-git-send-email-gustavo@zacarias.com.ar>
References: <1401055980-28742-1-git-send-email-gustavo@zacarias.com.ar>
 <1401055980-28742-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140526113727.6ac42e12@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 25 May 2014 19:12:57 -0300, Gustavo Zacarias wrote:
> Disable shared build for host-gcc-final when building for static targets.
> We really want static or shared, there's no such thing as "preferring static"
> since we can't choose with any degree of granularity for which packages.
> And it confuses linking scripts having both available at the same time. Fixes:
> http://autobuild.buildroot.net/results/c54/c54bdf88eff6d60c7001cb0e2cb6792cc75178db/

While on principle I'm probably fine with the patch, I kinda disagree
that it fixes the autobuilder issues. Because the same autobuilder
issue will appear with an external toolchain that has both libstdc++.so
and libstdc++.a.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
