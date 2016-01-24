From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jan 2016 16:51:33 +0100
Subject: [Buildroot] [PATCH v4 2/4] linux-pam: Enable NIS support if
 yp-tools selected
In-Reply-To: <alpine.DEB.2.11.1601241734061.4122@tanhuma.tkos.co.il>
References: <1453647303-3965-1-git-send-email-yba@tkos.co.il>
 <1453647303-3965-3-git-send-email-yba@tkos.co.il>
 <20160124160949.00b03374@free-electrons.com>
 <alpine.DEB.2.11.1601241734061.4122@tanhuma.tkos.co.il>
Message-ID: <20160124165133.5bdb131d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jan 2016 17:36:26 +0200 (IST), Jonathan Ben Avraham wrote:

> Is this a rule defined in the documentation? I didn't notice it. What is 
> the reasoning behind the rule?

Patches are applied in order. If we apply just your PATCH 2/4 without
applying 3/4, then this change will be an orphan change, since
BR2_PACKAGE_YP_TOOLS does not exist.

What you're doing is like adding code calling a function foo() in PATCH
2/4, and then adding the implementation of foo() in PATCH 3/4.

Granted, it's not that bad because if BR2_PACKAGE_YP_TOOLS doesn't
exist, then its value is empty, and your PATCH 2/4 doesn't do anything,
so it doesn't break anything. But it's just some dead code.

Note that these rules are nothing Buildroot specific. If you want to
contribute to any other open-source project like the Linux kernel,
U-Boot or other things, they will ask your patch series to comply with
those exact same rules.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
