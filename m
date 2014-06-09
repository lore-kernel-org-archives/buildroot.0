From: Will Wagner <will_wagner@carallon.com>
Date: Mon, 09 Jun 2014 17:58:29 +0100
Subject: [Buildroot] Qt5Declarative examples
Message-ID: <5395E7B5.1050604@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Just started taking a look at Qt5Declarative and noticed that examples 
aren't being built/installed.

Having looked at the .mk files it is easy to conditionally build the 
examples depending on qt5base config option about examples, but I'm 
unsure how best to do the install target step.

In Qt5Base it just does:
cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/* 
$(TARGET_DIR)/usr/lib/qt/examples
to install examples from staging.

This would also work for Qt5Declarative but it seems like a poor 
solution to just copy and paste the same code.

Can anyone think of a better way of doing this? Perhaps define something 
in qt5.mk and use that in both qt5base and qt5declarative?

If I can come up with anything neat I'll submit a patch.

Regards
Will
-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7471 9224
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
