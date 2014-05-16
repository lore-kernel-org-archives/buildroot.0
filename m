From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 16 May 2014 22:36:07 +0200
Subject: [Buildroot] [PATCH 1/4] acpid: replace "echo -e" with printf
In-Reply-To: <1400063214-29462-2-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Wed, 14 May 2014 12:26:51 +0200")
References: <1400063214-29462-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1400063214-29462-2-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <87vbt5piko.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > printf is POSIX-compliant, echo -e is not.
 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > ---
 >  package/acpid/acpid.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
 > index 1f4ec31..4a61f16 100644
 > --- a/package/acpid/acpid.mk
 > +++ b/package/acpid/acpid.mk
 > @@ -17,7 +17,7 @@ endef
 
 >  define ACPID_SET_EVENTS
 >  	mkdir -p $(TARGET_DIR)/etc/acpi/events
 > -	/bin/echo -e "event=button[ /]power\naction=/sbin/poweroff" \
 > +	printf "event=button[ /]power\naction=/sbin/poweroff" \
 >> $(TARGET_DIR)/etc/acpi/events/powerbtn

These are not 100% identical (printf doesn't add a trailing
newline). Have you tested if the newline isn't needed?

-- 
Bye, Peter Korsgaard
