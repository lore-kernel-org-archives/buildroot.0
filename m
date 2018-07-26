From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Jul 2018 15:42:23 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/lvm2: Fix runtime crash when
 using uclibc
In-Reply-To: <20180726131023.28695-1-m.niestroj@grinn-global.com>
References: <20180726131023.28695-1-m.niestroj@grinn-global.com>
Message-ID: <20180726154223.390beed1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this new iteration.

On Thu, 26 Jul 2018 15:10:22 +0200, Marcin Niestroj wrote:

> + configure                 | 32 ++++++++++++++++++++++++++++++--

I missed that in the review of the previous version. Is there a reason
to patch the configure script itself? In Buildroot, our general rule is
to not patch configure, but instead patch configure.ac and use
<pkg>_AUTORECONF = YES to regenerate the configure script.

Is there a reason to not follow this rule in this specific situation ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
