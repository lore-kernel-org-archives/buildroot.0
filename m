From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 13:21:42 +0100
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <1232968993.2298.63.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Mon\, 26 Jan 2009 12\:23\:13 +0100")
References: <20090125230123.541D376D28@busybox.osuosl.org>
	<87y6wybnd9.fsf@macbook.be.48ers.dk>
	<1232968993.2298.63.camel@elrond.atmel.com>
Message-ID: <87ab9e9s15.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 ulf> Flush configuration cache, needed if config has changed
 >> 
 >> It would be good if we could get the system to automatically detect
 >> this instead of using a manual make target.
 >> 
 >> What is the use case for this? If someone changes the toolchain
 >> config, or is it simply adding/removing packages?

 Ulf> If you build crashes, and you add /delete targets, then
 Ulf> several packages will fail to build because the current
 Ulf> configuration is different from the contents of the cache.

So shouldn't we have something like:

$(PROJECT_BUILD_DIR)/tgt-config.cache: .config
        mkdir -p $(@D)
        rm -f $@
        touch $@

Probably in an ifdef BR2_CONFIG_CACHE.

Totally untested, but wouldn't that work?

-- 
Bye, Peter Korsgaard
