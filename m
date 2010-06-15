From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jun 2010 11:56:13 +0200
Subject: [Buildroot] [PATCH] Display current action in title bar
In-Reply-To: <1276523235-26299-1-git-send-email-paul@pauljones.id.au>
References: <1276523235-26299-1-git-send-email-paul@pauljones.id.au>
Message-ID: <20100615115613.29b5b01a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Jun 2010 23:47:15 +1000
Paul Jones <paul@pauljones.id.au> wrote:

> -# MESSAGE Macro -- display a message in bold type
> -MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)"
> +# MESSAGE Macro -- display a message in bold type and in the title bar
> +MESSAGE  = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)" \
> +		&& echo -en "\033]2; $($(PKG)_NAME) $($(PKG)_VERSION) $(1) \007"

I've tried this here in my xfterm (XFCE terminal) and it doesn't do
anything. Is my terminal emulator too crappy ?

Anyway, I'm not sure I'd like to see Buildroot hijack the title bar of
my terminal emulator. Or maybe I'm missing the point of your patch ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
