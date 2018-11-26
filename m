From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 18:57:34 +0100
Subject: [Buildroot] [PATCH 1/1] usb_modeswitch: disable parallel build
In-Reply-To: <20181122180746.24616-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 22 Nov 2018 19:07:46 +0100")
References: <20181122180746.24616-1-fontaine.fabrice@gmail.com>
Message-ID: <87r2f7u3g1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build of package will sometime fails because of the following issue:
 > install-static target has two dependencies: dispatcher-static and
 > install-common

 > Because dispatcher-static is not a file but only a target, it will
 > always be called to build usb_modeswitch_dispatcher.
 > So, even if install-common depends on usb_modeswitch_dispatcher, in some
 > rare cases, install-static won't be able to install
 > usb_modeswitch_dispatcher because it is being rebuild by
 > dispatcher-static

 > To fix this issue, disable parallel build

 > Fixes:
 >  - http://autobuild.buildroot.org/results/8297be35725b816ff5afaf909605ceb41223efb6

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
