From: Jonas Keidel <jonas@jonas-keidel.de>
Date: Fri, 29 Jun 2012 13:23:07 +0200
Subject: [Buildroot] [git commit] mii-diag: link statically if
	configured to do so
In-Reply-To: <20120629121602.1b0fecd6@skate>
References: <20120627200833.E3F7C8E0E8@busybox.osuosl.org>
 <20120629121602.1b0fecd6@skate>
Message-ID: <e29221888928059fc500d696902bc763@jonas-keidel.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> +MII_DIAG_MAKE_OPT = $(TARGET_CONFIGURE_OPTS)
>> +
>> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
>> +MII_DIAG_MAKE_OPT += CFLAGS="$(TARGET_CFLAGS) -static"
>> +endif
>
> I am not fully sure I like this. Do we want to have the same stuff in
> all packages, or should we think about doing this globally in some 
> way?

I think the best way is to do it globally because I noticed that many 
packages don't build statically if it is set in the global config.
