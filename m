From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Mar 2010 22:30:47 +0100
Subject: [Buildroot] make distclean leaves ~200 files under
 package/config/
In-Reply-To: <hnoqma$lhv$1@dough.gmane.org>
References: <hnoqma$lhv$1@dough.gmane.org>
Message-ID: <20100316223047.44094042@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 16 Mar 2010 20:46:02 +0000 (UTC)
Grant Edwards <grant.b.edwards@gmail.com> wrote:

> After doing a "make distclean", there a couple hundred files under
> package/config that seeming shouldn't be there:
> 
>   package/config/conf
>   package/config/mconf.o
>   package/config/.depend
>   package/config/zconf.tab.o
>   package/config/conf.o
>   package/config/kxgettext.o
>   package/config/buildroot-config  [contains 190+ files]
>   package/config/lxdialog/yesno.o
>   package/config/lxdialog/textbox.o
>   package/config/lxdialog/inputbox.o
>   package/config/lxdialog/checklist.o
>   package/config/lxdialog/menubox.o
>   package/config/lxdialog/util.o
> 
> Shouldn't "make distclean" get rid of those?

In fact, those should be moved somewhere into the $(O) directory
(output/ by default).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
