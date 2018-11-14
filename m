From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Nov 2018 09:14:57 +0100
Subject: [Buildroot] [PATCH v2] configs/{at91,
 atmel}*_dev*: drop Dropbear as it duplicates OpenSSH
In-Reply-To: <20181030213845.20161-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 30 Oct 2018 22:38:45 +0100")
References: <20181030213845.20161-1-thomas.petazzoni@bootlin.com>
Message-ID: <87va50ulby.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The "development" defconfigs for Atmel platforms enable both OpenSSH
 > and Dropbear, which doesn't make a lot of sense, as only one SSH
 > server can start on port 22.

 > This commit therefore drops BR2_PACKAGE_DROPBEAR=y from those
 > defconfigs, keeping OpenSSH as an SSH server/client, as was requested
 > by Atmel/Microchip folks in the review of an earlier version of this
 > patch [1]. Since those defconfigs are "development" defconfigs, they
 > are not meant to be minimal, and already provide an arbitrary set of
 > packages, so using openssh is just as good as using dropbear in this
 > case.

 > [1] https://patchwork.ozlabs.org/patch/989516/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
 > Cc: Joshua Henderson <joshua.henderson@microchip.com>
 > Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> ---
 > Changes since v1:
 >  - Keep OpenSSH and drop Dropbear, as suggested by Nicolas Ferre from
 >    Microchip.

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
