From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 09:27:48 +0200
Subject: [Buildroot] [PATCH] eudev: improve S10udev script for startup
In-Reply-To: <1413098527-17162-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 12 Oct 2014 09:22:07 +0200")
References: <1413098527-17162-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y4sl693f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > From: Paul Cercueil <paul@crapouillou.net>
 > This commit adjusts the S10udev script by:

 >  * Using the --action=add option to udevadm trigger. By default, only
 >    the "change" events are handled by 'udevadm trigger', which means
 >    it doesn't handle all the "device add" events that occured during
 >    the boot time, before eudev was started.

 >  * Adds a call to 'udevadm settle' to make sure we wait for udev to
 >    handle all the events that occured before eudev was started.

 > Both of these change match what the Ubuntu and Debian udev startup
 > scripts are doing.

 > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
