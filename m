From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 20 Mar 2016 19:42:50 +0100
Subject: [Buildroot] [PATCH 11/14] imx-uuc: add new package
In-Reply-To: <CAAMH-ysjac4kMCZvcfZNhjx3QMehtfLTrJGJBUB8+muVMKp9kg@mail.gmail.com>
 (Gary Bisson's message of "Sat, 19 Mar 2016 13:48:27 +0100")
References: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
 <1458140214-22303-12-git-send-email-gary.bisson@boundarydevices.com>
 <87egb6zw33.fsf@dell.be.48ers.dk>
 <CAAMH-ysjac4kMCZvcfZNhjx3QMehtfLTrJGJBUB8+muVMKp9kg@mail.gmail.com>
Message-ID: <871t75yor9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <gary.bisson@boundarydevices.com> writes:

Hi,

 >> I see it also creates a 1MB fat filesystem image using mkfs.vfat. It is
 >> not clear to me what that is for, but if it is needed then the package
 >> should select BR2_PACKAGE_HOST_DOSFSTOOLS.

 > It says in their commit log the reason is to avoid Windows popup
 > format dialog when the board is enumerated.
 > https://github.com/Freescale/meta-fsl-arm/commit/24be3bf0

Ok. If that is important enough then host-dosfstools should be added to
the dependencies.

 >> I'm not really sure installing linuxrc makes any sense. Perhaps we
 >> should just install an init script to run it at startup?

 > I hesitated and decided to leave as linuxrc since the file includes
 > sys/proc/devtempfs mounting and should really be used as init process.

Yes, but what I meant was that it would be nicer to use the normal
Buildroot init (which takes care of sys/proc/devtmpfs/..) and then just
add an init script to run uuc.

 > I'll work on the package again next week, the rest of the series is
 > not dependent on it anyway.

Great, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
