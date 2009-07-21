From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 22 Jul 2009 00:03:32 +0200
Subject: [Buildroot] [git commit] Fix memstat's install
In-Reply-To: <874ot5er9g.fsf@macbook.be.48ers.dk>
References: <20090721104808.7013677806@busybox.osuosl.org>
	<874ot5er9g.fsf@macbook.be.48ers.dk>
Message-ID: <20090721220332.GJ14135@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 21, 2009 at 10:05:15PM +0200, Peter Korsgaard wrote:
>>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:
>
>Hi,
>
>A bit more detailed changelog would be good.

Well, it does just that: Fix memstat's install stage (aka PR473) :)

> Bernhard>  $(MEMSTAT_DIR)/memstat: $(MEMSTAT_DIR)/.configured
> Bernhard> -	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) $(@D)/memstat.c -o $@
> Bernhard> +	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
> Bernhard> +		$(CFLAGS_WHOLE_PROGRAM) $(@D)/memstat.c -o $@
>
>What is this WHOLE_PROGRAM thing?

gcc --help=optimizers | grep whole-program
> 
> Bernhard>  $(TARGET_DIR)/usr/bin/memstat: $(MEMSTAT_DIR)/memstat
> Bernhard>  	[ -e $(TARGET_DIR)/etc/memstat.conf ] || \
> Bernhard> -		$(INSTALL) -m 0644 -D $(^D)/memstat.conf $(TARGET_DIR)/etc
> Bernhard> +		$(INSTALL) -m 0644 -D $(^D)/memstat.conf \
> Bernhard> +			$(TARGET_DIR)/etc/memstat.conf
> Bernhard>  	$(INSTALL) -m 0755 -D $^ $@
> Bernhard>  	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
> 
> Bernhard> -memstat: uclibc $(TARGET_DIR)/usr/bin/memstat
> Bernhard> +memstat: $(TARGET_DIR)/usr/bin/memstat
>
>And why this unrelated change?

trivial cleanup while at it.
>
>Please post patches to the list before committing, thanks.

I accidentally committed it to the wrong repo, my apologies.
