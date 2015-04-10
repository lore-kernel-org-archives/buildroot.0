From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Apr 2015 11:23:26 +0200
Subject: [Buildroot] [PATCH v2 1/3] doxygen: new package
In-Reply-To: <CAMpxmJU_wsEqkm0UPA2eMGVcts3giLLdAxyKLR=0KRjyLMJqcw@mail.gmail.com>
References: <1428653766-22734-1-git-send-email-bgolaszewski@baylibre.com>
 <1428653766-22734-2-git-send-email-bgolaszewski@baylibre.com>
 <CAMpxmJU_wsEqkm0UPA2eMGVcts3giLLdAxyKLR=0KRjyLMJqcw@mail.gmail.com>
Message-ID: <20150410112326.53cb8726@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bartosz Golaszewski,

On Fri, 10 Apr 2015 11:20:52 +0200, Bartosz Golaszewski wrote:

> Sorry, for that - I eventually forgot to change host-autotools-package
> to host-generic-package. Surprisingly it works.

This is not surprising: host-autotools-package allows you to override
<pkg>_CONFIGURE_CMDS, <pkg>_BUILD_CMDS and <pkg>_INSTALL_*_CMDS.

Also, in your v3, remove the parenthesis:

	($(MAKE) -C $(@D))

should be just:

	$(MAKE) -C $(@D)

And add a comment in the .mk file to explain why we're not using
host-autotools-package even if there is a ./configure script being
called.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
