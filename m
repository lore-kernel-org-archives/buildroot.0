From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Jul 2009 08:01:12 +0200
Subject: [Buildroot] [git commit] Fix memstat's install
In-Reply-To: <20090721220332.GJ14135@mx.loc> (Bernhard Reutner-Fischer's
	message of "Wed\, 22 Jul 2009 00\:03\:32 +0200")
References: <20090721104808.7013677806@busybox.osuosl.org>
	<874ot5er9g.fsf@macbook.be.48ers.dk> <20090721220332.GJ14135@mx.loc>
Message-ID: <87ocrdcl3r.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 Bernhard> On Tue, Jul 21, 2009 at 10:05:15PM +0200, Peter Korsgaard wrote:

 >> A bit more detailed changelog would be good.

 Bernhard> Well, it does just that: Fix memstat's install stage (aka PR473) :)

For ancient versions of install. I would have preferred a commit
message like:

memstat: workaround issue with older versions of 'install'

Closes #473

Older versions of GNU install have issues with install -D <file>
<dir>/, but works with install -D <file> <dir>/<file>, so use that
instead.


And a corresponding addition to CHANGES

 Bernhard> $(MEMSTAT_DIR)/memstat: $(MEMSTAT_DIR)/.configured
 Bernhard> -	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) $(@D)/memstat.c -o $@
 Bernhard> +	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
 Bernhard> +		$(CFLAGS_WHOLE_PROGRAM) $(@D)/memstat.c -o $@
 >> 
 >> What is this WHOLE_PROGRAM thing?

 Bernhard> gcc --help=optimizers | grep whole-program

Yes, I know the -fwhole-program option, but why is this just not
included in TARGET_CFLAGS?

 >> Please post patches to the list before committing, thanks.

 Bernhard> I accidentally committed it to the wrong repo, my apologies.

Ahh, ok - May I suggest you clone the official repo with git://
instead of ssh:// to not do that mistake in the future?

Thanks.

-- 
Bye, Peter Korsgaard
