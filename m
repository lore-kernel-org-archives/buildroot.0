From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 30 Sep 2011 23:48:22 +0200
Subject: [Buildroot] [PATCH 4/4] Add the libplayer package
In-Reply-To: <20110930214449.5139eb84@skate>
References: <cover.1317210509.git.maxime.ripard@free-electrons.com>
 <fe12fce8c39412837610eba989ec416ec7049e35.1317210509.git.maxime.ripard@free-electrons.com>
 <20110930214449.5139eb84@skate>
Message-ID: <4E863926.50903@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 30/09/2011 21:44, Thomas Petazzoni a ?crit :
> Le Wed, 28 Sep 2011 13:48:34 +0200,
> Maxime Ripard<maxime.ripard@free-electrons.com>  a ?crit :
>> +config BR2_PACKAGE_LIBPLAYER_MPLAYER
>> +	depends on BR2_PACKAGE_MPLAYER
>> +	bool "Libplayer mplayer backend"
>> +
>> +config BR2_PACKAGE_LIBPLAYER_GSTREAMER
>> +	depends on BR2_PACKAGE_GSTREAMER
>> +	bool "Libplayer GStreamer backend"
>
> What happens if we select none of those backends ?

Hmmm, good question. I'll check.

>> +define LIBPLAYER_CONFIGURE_CMDS
>> +	(cd $(@D)&&  rm -rf config.cache&&  \
>> +	$(TARGET_CONFIGURE_OPTS) \
>> +	$(TARGET_CONFIGURE_ARGS) \
>> +	$(LIBPLAYER_CONF_ENV) \
>
> LIBPLAYER_CONF_ENV is not defined anywhere.

Ah, you're right, I missed that one.

>
>> +	./configure \
>> +		--prefix=/usr \
>> +		--cross-compile \
>> +		$(SHARED_STATIC_LIBS_OPTS) \
>> +		$(QUIET) $(LIBPLAYER_CONF_OPT) \
>> +	)
>
> This looks like a normal ./configure invocation. Why don't you use the
> default foo_CONFIGURE_CMDS provided by the autotargets infrastructure ?

The configure script breaks if we pass --target or --host, I did this to 
avoid it.

>> +ifeq ($(BR2_PACKAGE_LIBPLAYER_PYTHON),y)
>
> This option is not defined in your Config.in.

Ah, yup.

I'll resend the whole patchset once it will be updated.

Maxime
