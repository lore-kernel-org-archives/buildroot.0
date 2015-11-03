From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 4 Nov 2015 00:09:16 +0100
Subject: [Buildroot] [git commit] toolchain/external: use generic
 extract commands (!blackfin case)
In-Reply-To: <20151103223523.8760E81E5E@busybox.osuosl.org>
References: <20151103223523.8760E81E5E@busybox.osuosl.org>
Message-ID: <56393E9C.1030005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Post-merge review, never a good idea :-)

On 03-11-15 22:30, Thomas Petazzoni wrote:
> +define TOOLCHAIN_EXTERNAL_MOVE
>  	mkdir -p $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
> -	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_SOURCE)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) | \
> -		$(TAR) --strip-components=1 --exclude='usr/lib/locale/*' -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
> -	$(TOOLCHAIN_EXTERNAL_FIXUP_CMDS)
> +	mv $(@D)/* $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/

 This will make the following fail:

make toolchain-external-dirclean; make

 Patch follows.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
