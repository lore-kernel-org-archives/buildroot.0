From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jul 2015 10:36:37 +0200
Subject: [Buildroot] [PATCH 1/1] qt5: bump version to 5.5.0
In-Reply-To: <5a1a63ea-a740-40ec-8696-acd74824601a@MAIL-SINTERS-01.sinters-int.fr>
References: <d9e13733-fe52-48db-8c21-dd519b338d51@MAIL-SINTERS-01.sinters-int.fr>
 <20150703093918.4d26fb87@free-electrons.com>
 <5a1a63ea-a740-40ec-8696-acd74824601a@MAIL-SINTERS-01.sinters-int.fr>
Message-ID: <20150703103637.63ac3011@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien,

On Fri, 3 Jul 2015 08:30:21 +0000, Julien CORJON wrote:

> > Also, please use git send-email to send your patch. Your patch has been
> > modified by your e-mail client. If your company doesn't provide you
> > with the right tools to do your work, then blame your company and use a
> > personal e-mail address instead to send the patches.
> >
> > See http://patchwork.ozlabs.org/patch/490931/ to have a look at your
> > patch, you'll see that it's pretty broken.
> >
> > Also, your 3 patches don't appear in the same thread, probably also due
> > to how you send them. Please use git send-email, once again.
> 
> I used git send-email as explained in BR manual. But my company use an 
> outlook with only OutlookWebAccess activated... I'm currently working 
> with them to activate, at least, SMTP protocol

So even if you're using git send-email, your mail server does some
stupid thing with the e-mail. At least here, your e-mail does not apply
properly to the latest Buildroot master.


> To my understand QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES should not be 
> useful anymore.
> 
> As explained here https://codereview.qt-project.org/#/c/107548/ :
>    eglfs does not depend on the device makespecs anymore when it comes 
> to these device integration backends (hooks). Instead, backends are 
> autodetected by configure. The name of the preferred plugin is still set 
> in the device makespecs. This is optional. When not set and there is 
> more than one plugin present in the system, the environment variable 
> QT_QPA_EGLFS_INTEGRATION will have to be set at runtime. In the absence 
> of that, the order is undefined.

[...]

> On qt5base compilation, configure try to compile a test program for 
> vivante, mali, brcm chipset. The result of the compilation of these test 
> program select the specifics eglfs plugins to build.
> 
> At the end Qt5EglDeviceIntegration is linked to the prefered eglfs 
> backend (see mkspecs/devices/plateform/qmake.conf) and can be override 
> with QT_QPA_EGLFS_INTEGRATION environment variable at runtime.

Makes sense, thanks for the explanation. Maybe you can copy/paste some
of this into your commit log, to explain the removal of this part of
the .mk file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
