From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 21:53:24 +0200
Subject: [Buildroot] [PATCH/next 1/1] lxc: fix hash of patch
In-Reply-To: <20170529215223.1d3808f9@free-electrons.com>
References: <1496044092-78363-1-git-send-email-fontaine.fabrice@gmail.com>
 <20170529121236.5318e2d8@free-electrons.com>
 <CAPi7W83jQ9Z2t9TDLc5ZRo1tmPHF4SkYD86aBAKkOD0=99zwnQ@mail.gmail.com>
 <4nvtvdxcra.ln2@ID-313208.user.individual.net>
 <20170529215223.1d3808f9@free-electrons.com>
Message-ID: <20170531215324.43afad6b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 May 2017 21:52:23 +0200, Thomas Petazzoni wrote:

> Then it would be nice to compare the old and new .patch files, and see
> how they differ.

OK, so I've checked the difference between the old and the new patch,
and here it is:

--- /home/thomas/dl/bc5b27d6f6d166d2a6df47982cbe36041ce6b735.patch.old	2017-05-20 16:13:12.193576930 +0200
+++ bc5b27d6f6d166d2a6df47982cbe36041ce6b735.patch	2017-05-31 21:49:49.177157735 +0200
@@ -9,7 +9,7 @@
  1 file changed, 8 insertions(+)
 
 diff --git a/src/lxc/conf.c b/src/lxc/conf.c
-index 35bdb24..76a1901 100644
+index 35bdb249b..76a190120 100644
 --- a/src/lxc/conf.c
 +++ b/src/lxc/conf.c
 @@ -130,6 +130,14 @@ lxc_log_define(lxc_conf, lxc);

So, the patch change to use slightly longer commit hashes. Is this
because there was a conflicting commit in the repository added in the
mean time? Or Github changing to a different length in the commit
hashes?

Anyway, I've applied the patch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
