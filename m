From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jul 2012 11:19:10 +0200
Subject: [Buildroot] Building u-boot inside buildroot
In-Reply-To: <648F84CCD71C458D8FBBF53B5FFF8E34@M58p>
References: <648F84CCD71C458D8FBBF53B5FFF8E34@M58p>
Message-ID: <20120731111910.1f1e36a8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 31 Jul 2012 11:04:59 +0200,
"Herr post" <post61@gmx.de> a ?crit :

> I installed buildroot as my embedded linux environment. For first time I can
> build u-boot. But if i change a c-file and try to recompile u-boot. It
> doesn,t work. Buildroot doesn,t notice this changing and does nothing.

That's expected. Buildroot keeps stamp files (hidden files) in the
build directory of each component, so that it doesn't restart the
configuration/compilation/installation of every component every time
you run 'make'.

Moreover, making changes to the build directories created by Buildroot
is a *very* bad idea: those build directories are destroyed when you
restart the build from scratch (doing a Buildroot 'make clean'). So
unless you're doing some quick experiments just to verify something,
you shouldn't be touching any files in output/.

If you want to make quick experiments in
output/build/uboot-<version>/, and then get Buildroot to rebuild it,
you can run 'make uboot-rebuild'. But again, be careful about making
source code changes in output/ : those will be lost.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
