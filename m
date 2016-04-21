From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 23:25:43 +0200
Subject: [Buildroot] [PATCH] weston: add build fix for clock_gettime()
 in librt
In-Reply-To: <1461177538-21402-1-git-send-email-gustavo@zacarias.com.ar>
References: <1461177538-21402-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160421232543.4c15e546@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Apr 2016 15:38:58 -0300, Gustavo Zacarias wrote:
> Over time weston has been manually adding -lrt LDADDs to the Makefile
> for clock_gettime() using sources. However this isn't 100% correct since
> "modern" glibc versions don't require it so switch all over to a
> configure test for that purpose. Fixes:
> http://autobuild.buildroot.net/results/7fb/7fb9968b13f144c4576b28ecd01c82b74e4ed9d5/

This autobuilder reference was not correct, so I replaced it by
http://autobuild.buildroot.net/results/a16/a165f439cf5a81c79fe3fa3af7a2a5a30022e7ed/,
as discussed on IRC, and applied your patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
