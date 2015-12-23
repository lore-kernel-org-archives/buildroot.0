From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Dec 2015 23:34:53 +0100
Subject: [Buildroot] [PATCH v4 1/3] chocolate-doom: new package
In-Reply-To: <1446839279-9021-1-git-send-email-rprebello@gmail.com>
References: <1446839279-9021-1-git-send-email-rprebello@gmail.com>
Message-ID: <20151223233453.0e71a3b6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rodrigo Rebello,

On Fri,  6 Nov 2015 17:47:57 -0200, Rodrigo Rebello wrote:
> Chocolate Doom is a set of conservative source ports for Doom, Heretic,
> Hexen and Strife, with a philosophy of preserving the look, feel, and
> bugs of the vanilla versions of each.
> 
> http://www.chocolate-doom.org
> 
> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>

I've applied, thanks! I'd like to say that I really appreciated the
fact that all three patches had already been submitted and accepted
upstream. It really gives more confidence in accepting them as a
temporary solution until upstream does a new release.

I have one comment though.

> +ifeq ($(BR2_STATIC_LIBS),y)
> +# SDL_mixer uses symbols from SDL, but ends up after it on the link
> +# cmdline. Fix it by forcing the SDL libs at the very end.
> +CHOCOLATE_DOOM_CONF_ENV = LIBS="`$(STAGING_DIR)/usr/bin/sdl-config --static-libs`"
> +endif

It would be great if this was fixed properly in the chocolate-doom
build system. An obvious suggestion is to use pkg-config, which handles
static linking scenarios a lot better.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
