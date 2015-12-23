From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Dec 2015 17:28:27 +0100
Subject: [Buildroot] [PATCH 1/1] qt5/qt5webchannel: add qwebchannel.js
 installation choice
In-Reply-To: <eef8db72-7643-4c20-8dd4-f24d61dbb50d@MAIL-SINTERS-01.sinters-int.fr>
References: <1450872768-27153-1-git-send-email-corjon.j@ecagroup.com>
 <20151223170231.1754085d@free-electrons.com>
 <eef8db72-7643-4c20-8dd4-f24d61dbb50d@MAIL-SINTERS-01.sinters-int.fr>
Message-ID: <20151223172827.25bfa9c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Dec 2015 16:24:20 +0000, Julien CORJON wrote:

> I should be agree with this, but in that case the javascript file should 
> be installed in a website hosting path. For my application this one is 
> in /usr/local/myApp/www for others it can be in an apache, lighttpd, 
> monkey, etc directory.
> 
> I'm not a web hosting expert, so if there is an generic path for that we 
> can remove that customisation and let the specific applications make a 
> symbolic link if they don't comply with the generic path.

Do like we do for all other Javascript packages (see jquery* packages):

define JQUERY_INSTALL_TARGET_CMDS
        $(INSTALL) -m 0644 -D $(@D)/$(JQUERY_SOURCE) \
                $(TARGET_DIR)/var/www/jquery.js
endef

define JQUERY_VALIDATION_INSTALL_TARGET_CMDS
        $(INSTALL) -m 0644 -D $(@D)/dist/jquery.validate.min.js \
                $(TARGET_DIR)/var/www/jquery.validate.js
endef

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
