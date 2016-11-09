From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 11:22:14 +0100
Subject: [Buildroot] [Question] Downgrade package application.
In-Reply-To: <CADZ=QZmHuyjuctpfxNLn_up=41HXc_8Y+BtDx+4EScrRda04QA@mail.gmail.com>
References: <CADZ=QZmHuyjuctpfxNLn_up=41HXc_8Y+BtDx+4EScrRda04QA@mail.gmail.com>
Message-ID: <20161109112214.5838dd7b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 9 Nov 2016 18:04:20 +0800, Yu-Ting Kao wrote:

> I have a patch for new feature on a package, but it works on lower
> version. How can I build lower version in buildroot ? Are there any
> menuconfig I can choose ?

No. For the vast majority of the packages, we only allow building a
single version, as we can't test all combinations of all package
versions.

So if you need a lower version than the one in Buildroot:

 1/ Short-term, you can just modify the .mk file, so that it uses
    whichever version you need.

 2/ Long-term, you should really upgrade to the latest version. If this
    latest version is causing issues for you, then work with the
    upstream project to fix them. Staying on an older version is
    definitely not a good idea.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
