From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 16:56:42 +0200
Subject: [Buildroot] [PATCH v3 2/5] system: convert "system.mk" recipes
 to "target-finalize" hooks
In-Reply-To: <1403871359-18849-3-git-send-email-fabio.porcedda@telit.com>
References: <1403871359-18849-1-git-send-email-fabio.porcedda@telit.com>
 <1403871359-18849-3-git-send-email-fabio.porcedda@telit.com>
Message-ID: <20140629165642.055f2e88@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Fri, 27 Jun 2014 14:15:56 +0200, Fabio Porcedda wrote:

>  ifneq ($(TARGET_GENERIC_ROOT_PASSWD),)
> -target-root-passwd: host-mkpasswd
> +TARGETS += host-mkpasswd

Actually, I was wondering how this could work in the context of
top-level parallel build, but looking more closely, target-finalize has
$(TARGETS) in its dependencies, so we indeed have the guarantee that
host-mkpasswd will be built before the SYSTEM_ROOT_PASSWD hook is
executed.

So in fact, I don't have any comment about PATCH 2 :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
