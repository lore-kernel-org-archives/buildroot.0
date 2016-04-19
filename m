From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 21:16:02 +0200
Subject: [Buildroot] [PATCH 2/3] c-icap: bump to version 0.4.2
In-Reply-To: <3280a03616963d1b2a5bfa3120390bcd59bee470.1461089746.git.baruch@tkos.co.il>
References: <f4a2d607557dd8a5b7fdc322f0ae8ef083890076.1461089746.git.baruch@tkos.co.il>
 <3280a03616963d1b2a5bfa3120390bcd59bee470.1461089746.git.baruch@tkos.co.il>
Message-ID: <20160419211602.7bca70f5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Apr 2016 21:15:45 +0300, Baruch Siach wrote:

> +C_ICAP_CONF_ENV = ac_cv_10031b_ipc_sem=yes ac_cv_fcntl=yes

These look a bit special/weird, especially ac_cv_fcntl=yes. Normally
for functions, the cache variable is named ac_cv_func_<function>, and
the checks don't need to pre-seed cache variable values.

Can you add a comment on top of this line that explains why those two
values need to be passed? Or at least, it should be explained in the
commit log (but a comment in the code is better IMO).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
