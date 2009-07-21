From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 21 Jul 2009 22:05:15 +0200
Subject: [Buildroot] [git commit] Fix memstat's install
In-Reply-To: <20090721104808.7013677806@busybox.osuosl.org> (Bernhard
	Reutner-Fischer's message of "Tue\, 21 Jul 2009 12\:47\:38 +0200")
References: <20090721104808.7013677806@busybox.osuosl.org>
Message-ID: <874ot5er9g.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

Hi,

A bit more detailed changelog would be good.

 Bernhard> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
 Bernhard> ---
 Bernhard>  package/memstat/memstat.mk |    8 +++++---
 Bernhard>  1 files changed, 5 insertions(+), 3 deletions(-)

 Bernhard> diff --git a/package/memstat/memstat.mk b/package/memstat/memstat.mk
 Bernhard> index 7220aee..a54509a 100644
 Bernhard> --- a/package/memstat/memstat.mk
 Bernhard> +++ b/package/memstat/memstat.mk
 Bernhard> @@ -21,15 +21,17 @@ $(MEMSTAT_DIR)/.configured: $(MEMSTAT_DIR)/.unpacked
 Bernhard>  	touch $@
 
 Bernhard>  $(MEMSTAT_DIR)/memstat: $(MEMSTAT_DIR)/.configured
 Bernhard> -	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) $(@D)/memstat.c -o $@
 Bernhard> +	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
 Bernhard> +		$(CFLAGS_WHOLE_PROGRAM) $(@D)/memstat.c -o $@

What is this WHOLE_PROGRAM thing?
 
 Bernhard>  $(TARGET_DIR)/usr/bin/memstat: $(MEMSTAT_DIR)/memstat
 Bernhard>  	[ -e $(TARGET_DIR)/etc/memstat.conf ] || \
 Bernhard> -		$(INSTALL) -m 0644 -D $(^D)/memstat.conf $(TARGET_DIR)/etc
 Bernhard> +		$(INSTALL) -m 0644 -D $(^D)/memstat.conf \
 Bernhard> +			$(TARGET_DIR)/etc/memstat.conf
 Bernhard>  	$(INSTALL) -m 0755 -D $^ $@
 Bernhard>  	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
 
 Bernhard> -memstat: uclibc $(TARGET_DIR)/usr/bin/memstat
 Bernhard> +memstat: $(TARGET_DIR)/usr/bin/memstat

And why this unrelated change?

Please post patches to the list before committing, thanks.

-- 
Bye, Peter Korsgaard
