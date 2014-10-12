From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 15:43:40 +0200
Subject: [Buildroot] [PATCH 2/2] package/systemd: check
	BR2_TARGET_GENERIC_GETTY
In-Reply-To: <1412863083-24764-2-git-send-email-dywi@mailerd.de>
 (=?utf-8?Q?=22Andr=C3=A9?=
 Erdmann"'s message of "Thu, 9 Oct 2014 15:58:03 +0200")
References: <1412863083-24764-1-git-send-email-dywi@mailerd.de>
 <1412863083-24764-2-git-send-email-dywi@mailerd.de>
Message-ID: <87wq85xv1v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andr?" == Andr? Erdmann <dywi@mailerd.de> writes:

 > Do not create a [serial-]getty link if BR2_TARGET_GENERIC_GETTY is not set.
 > Might be useful for custom setups (rootfs overlay).

 > Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
 > ---
 >  package/systemd/systemd.mk | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
 > index fec96d0..3034b76 100644
 > --- a/package/systemd/systemd.mk
 > +++ b/package/systemd/systemd.mk
 > @@ -187,6 +187,7 @@ define SYSTEMD_DISABLE_SERVICE_TTY1
 >  	rm -f $(TARGET_DIR)/etc/systemd/system/getty.target.wants/getty at tty1.service
 >  endef
 
 > +ifeq ($(BR2_TARGET_GENERIC_GETTY),y)

I would prefer to use BR2_TARGET_GENERIC_GETTY_PORT as that is what is
used below.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
