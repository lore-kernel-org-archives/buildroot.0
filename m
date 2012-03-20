From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Mar 2012 10:15:19 +0100
Subject: [Buildroot] [PATCH 4/6] Rework of the init system
In-Reply-To: <4F68458C.5070605@free-electrons.com> (Maxime Ripard's message of
 "Tue, 20 Mar 2012 09:53:32 +0100")
References: <cover.1332172636.git.maxime.ripard@free-electrons.com>
 <a9e780200fae5528ff46ffb3ff5351fc1a57ff84.1332172636.git.maxime.ripard@free-electrons.com>
 <201203200045.18897.arnout@mind.be>
 <4F68458C.5070605@free-electrons.com>
Message-ID: <874ntjljko.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

Hi,

 Maxime> Well, while the select on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV is
 Maxime> indeed a good idea, like you said, we are still to depends on WCHAR and
 Maxime> LARGEFILE support. So from the user point of view, we are still left
 Maxime> without an option, and no way of getting how to select it (and we
 Maxime> definitely don't want to select LARGEFILE and WCHAR)

 Maxime> Peter, do you have an idea about that ?

Just add a comment like we do for BR2_PACKAGE_XSERVER_xorg

 >> Clearly, adding a select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS here is
 >> a bad idea.  I also don't like much to add a dependency on it
 >> either.  So instead, I propose to move sysvinit and systemd out
 >> of the BR2_PACKAGE_BUSYBOX_SHOW_OTHERS condition (in package/Config.in).
 >> They anyway can't be selected or deselected by the user, since their
 >> selection is fully determined by the BR2_INIT_* option.

 Maxime> I agree here.
 Maxime> Peter, are you ok with this change ?

Yes.

-- 
Bye, Peter Korsgaard
