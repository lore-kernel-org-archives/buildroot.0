From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 21 Oct 2009 11:05:40 +0200
Subject: [Buildroot] [PATCH] gst-plugins-good: make new dependency-less
 plugins configurable
In-Reply-To: <87vdi9qhqe.fsf@macbook.be.48ers.dk>
References: <200910200018.17071.markus.heidelberg@web.de>
	<1256066492-8158-1-git-send-email-s.neumann@raumfeld.com>
	<87vdi9qhqe.fsf@macbook.be.48ers.dk>
Message-ID: <1256115940.11240.5.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2009-10-21 at 10:22 +0200, Peter Korsgaard wrote:
> >>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:
> 
>  Sven> gst-plugins-good gained a number of dependency-less plugins with
>  Sven> the last update. This commit makes them configurable in buildroot.
> 
>  Sven>  GST_PLUGINS_GOOD_CONF_OPT = \
>  Sven>  		$(DISABLE_NLS) \
>  Sven> +		--disable-debug \
>  Sven>  		--disable-examples \
>  Sven> -		--disable-directdraw \

Hmm, perhaps directdraw should become an option as well, but I thought
it's not really interesting for the buildroot target audience.

--disable-debug should perhaps be configurable or depend on
BR2_ENABLE_DEBUG ?


Sven
