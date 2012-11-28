From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Nov 2012 14:00:30 +0100
Subject: [Buildroot] Qt mouse, keyboard, touchscreen
In-Reply-To: <1354102604.50307.YahooMailNeo@web164602.mail.gq1.yahoo.com>
References: <1353748764.40553.YahooMailNeo@web164602.mail.gq1.yahoo.com>
 <50B09888.9000907@relinux.de>
 <1353916198.97471.YahooMailNeo@web164601.mail.gq1.yahoo.com>
 <50B3210E.2010806@relinux.de>
 <1353917395.39625.YahooMailNeo@web164603.mail.gq1.yahoo.com>
 <50B32588.7010800@relinux.de>
 <1354002375.96935.YahooMailNeo@web164604.mail.gq1.yahoo.com>
 <20121127163037.3f619184@skate>
 <1354102604.50307.YahooMailNeo@web164602.mail.gq1.yahoo.com>
Message-ID: <20121128140030.42c255c9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Zoran Djordjevic,

On Wed, 28 Nov 2012 03:36:44 -0800 (PST), Zoran Djordjevic wrote:
> I've tried patch, you submitted, and then make qt-reconfigure and

qt-reconfigure will not re-extract the source code and apply the
patches, so it is not appropriate. If you want to rebuild a package
from scratch, including extracting the package and applying the
patches, do:

	make qt-dirclean

> receive strange error about include folders. Same error I had 
> earlier when trying with deleting stamp files (when added some
> options regarding Qt in Buildroot's menuconfig), and in that case 
> I had to do make clean all. But if I do so, now, I think I will loose my 
> patched files (am I right ?)

If you made changes to output/build/<something>/, yes, you will loose
your changes. But you shouldn't be making any change in
output/build/<something>/

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
