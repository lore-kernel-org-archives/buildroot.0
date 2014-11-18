From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 14:25:58 +0100
Subject: [Buildroot] [PATCH] rapidjson: bump to latest GitHub master
In-Reply-To: <1416284633-16290-1-git-send-email-eeppeliteloop@gmail.com>
References: <1416284633-16290-1-git-send-email-eeppeliteloop@gmail.com>
Message-ID: <20141118142558.0a692289@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Philippe Proulx,

On Mon, 17 Nov 2014 23:23:53 -0500, Philippe Proulx wrote:
> RapidJSON is now hosted on GitHub and its latest version
> includes many fixes and features added since 2012.
> 
> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
> ---
>  package/rapidjson/rapidjson.mk | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)

Applied to next, thanks. One question below, though.

>  define RAPIDJSON_INSTALL_STAGING_CMDS
>  	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/rapidjson
>  	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/rapidjson/internal
> +	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/rapidjson/error
> +	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/rapidjson/msinttypes
>  	$(INSTALL) -m 0644 $(@D)/include/rapidjson/*.h \
>  		$(STAGING_DIR)/usr/include/rapidjson
>  	$(INSTALL) -m 0644 $(@D)/include/rapidjson/internal/*.h \
>  		$(STAGING_DIR)/usr/include/rapidjson/internal
> +	$(INSTALL) -m 0644 $(@D)/include/rapidjson/error/*.h \
> +		$(STAGING_DIR)/usr/include/rapidjson/error
> +	$(INSTALL) -m 0644 $(@D)/include/rapidjson/msinttypes/*.h \
> +		$(STAGING_DIR)/usr/include/rapidjson/msinttypes
>  endef

Do you know why we're doing all this dance instead of just copying the
entire $(@D)/include/* tree ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
