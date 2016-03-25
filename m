From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Mar 2016 16:30:33 +0100
Subject: [Buildroot] [PATCH 1/2] package/qwt : prepared package for
 other versions of Qt.
In-Reply-To: <56F54F63.1040001@yahoo.fr>
References: <1458850791-4205-1-git-send-email-davepiq@yahoo.fr>
 <20160325104839.20bcbe13@free-electrons.com>
 <56F54F63.1040001@yahoo.fr>
Message-ID: <20160325163033.260a4d11@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 25 Mar 2016 15:46:59 +0100, David Picard wrote:

> I get an error like :
> make[1]: *** no rule to make target "qt5", needed by 
> "<BASEDIR>/build/qwt-6.1.2/.stamp_configured". Stopping.
> 
> Wouldn't it be because of line 15 in package/qwt/qwt.mk ?
> https://git.buildroot.net/buildroot/tree/package/qwt/qwt.mk?id=a976ee0dc834c56e67e1c832ded00ce23b5ccdb0
> 
> I changed it from :
> QWT_DEPENDENCIES += qt5
> to :
> QWT_DEPENDENCIES += qt5base

Correct. Can you send a new patch to fix this?

> and then I could build on. It seems like "qt5" is not a valid target 
> name. By the way, where can you find what are the valid values ?

The possible values are the list of all packages in Buildroot. Whenever
you have a .mk file that calls one of the generic-package,
autotools-package, *-package macro, then there is a make target with
the same name.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
