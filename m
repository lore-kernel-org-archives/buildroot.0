From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 25 Sep 2012 18:00:54 -0300
Subject: [Buildroot] [PATCH 1/2] pkgconf: new package
In-Reply-To: <506219E1.5070508@mind.be>
References: <1348600115-27059-1-git-send-email-gustavo@zacarias.com.ar>
 <506219E1.5070508@mind.be>
Message-ID: <50621B86.7040307@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/25/12 17:53, Arnout Vandecappelle wrote:

>  Since we anyway need a wrapper, wouldn't it be more consistent
> to set PKG_CONFIG_PATH there instead?

Yes, it's possible, i can't think of any gain by doing so, but then i
can't think of any loss either.

>  As long as pkg-config exists, I would wrap this in a
> ifeq ($(BR2_PACKAGE_PKG_CONFIG),)

See next point...

>  If for whatever reason, host-pkg-config is also built, the script
> will be overwritten.  So to be safe, I'd remove host-pkg-config as well
> (as a third patch).

Yes, the idea is to remove pkg-config, but i don't think this is a final
patch yet, it's more like a "let people test it and see if nothing
breaks" (things didn't break for a couple of projects i've run with the
patchset, but that may not be the case for everyone else).

>  Although this is just copy-pasted from pkg-config.mk, that's no reason
> to break the buildroot conventions :-)
> 
> PKG_CONFIG_HOST_BINARY = $(HOST_DIR)/usr/bin/pkg-config

Yeah, it was a copy, again, not a final patchset :)
Regards.
