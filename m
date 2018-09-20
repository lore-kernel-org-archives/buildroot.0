From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 23:50:38 +0200
Subject: [Buildroot] [PATCH 1/1] domoticz: fix build with gcc <= 4.7
In-Reply-To: <20180917165547.30222-1-fontaine.fabrice@gmail.com>
References: <20180917165547.30222-1-fontaine.fabrice@gmail.com>
Message-ID: <20180920235038.1cb70d40@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Sep 2018 18:55:47 +0200, Fabrice Fontaine wrote:
> sleep_for is not always defined with gcc <= 4.7, see
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52680
> 
> To fix this issue, add -D_GLIBCXX_USE_NANOSLEEP if gcc version is lower
> than 4.8

First comment in the bug report says:

"""
Don't define that manually,  you should configure gcc with
--enable-libstdccxx-time instead.
"""

So I'm not sure enthusiastic with going in this direction. What about
making domoticz depend on gcc >= 4.8 ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
