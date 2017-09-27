From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 27 Sep 2017 17:19:28 -0300 (BRT)
Subject: [Buildroot] [PATCH 2/2] dash: enable line editting if libedit
 is selected.
In-Reply-To: <20170927211805.62bb4cfb@windsurf.lan>
References: <1506530514-27185-1-git-send-email-casantos@datacom.ind.br>
 <1506530514-27185-2-git-send-email-casantos@datacom.ind.br>
 <20170927211805.62bb4cfb@windsurf.lan>
Message-ID: <816883822.11304783.1506543568981.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org
> Sent: Wednesday, September 27, 2017 4:18:05 PM
> Subject: Re: [Buildroot] [PATCH 2/2] dash: enable line editting if libedit is selected.

> Hello,
> 
> On Wed, 27 Sep 2017 13:41:54 -0300, Carlos Santos wrote:
> 
>> +# Enable line editing, Emacs style
>> +define DASH_INSTALL_PROFILE
>> +	echo 'set -E' > $(TARGET_DIR)/etc/profile.d/dash.sh
>> +endef
> 
> This really looks like a "personal preference" configuration, that is
> more relevant in a custom rootfs overlay, no?

This is the default behavior of BusyBox's shell, which is used in 98.73%
of the Buldroot installations, according to my statistics factory, so I
think we should use it by default.

>> +ifeq ($(BR2_PACKAGE_LIBEDIT),y)
>> +DASH_DEPENDENCIES += libedit
>> +DASH_CONF_OPTS += --with-libedit
>> +DASH_POST_INSTALL_TARGET_HOOKS += DASH_INSTALL_PROFILE
> 
> What about --without-libedit in an else case ?

In the case else there is no libedit to which not to link. :-)

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
