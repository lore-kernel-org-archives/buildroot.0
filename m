From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 22:52:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/minidlna: fix static linking
 with OpenSSL enabled
In-Reply-To: <20141207211025.GC10809@free.fr>
References: <1417289292-7006-1-git-send-email-bernd.kuhls@t-online.de>
 <20141207211025.GC10809@free.fr>
Message-ID: <20141207225254.3cc97f02@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 7 Dec 2014 22:10:25 +0100, Yann E. MORIN wrote:

> I'm not too fond of the way this is handled. I'd prefer we get something
> like:
> 
>     MINIDLNA_LIBS = -lavformat -lavcodec -lavutil -logg
>     MINIDLAN_LIBS += $(if $(BR2_PACKAGE_OPENSSL),-lssl -lcrypto)
>     MINIDLAN_LIBS += -lz -lpthread -lm
> 
>     MINIDLNA_CONF_ENV = LIBS='$(MINIDLNA_LIBS)'

Agreed, with maybe "$(MINIDLNA_LIBS)" instead of simple quotes.

A further possible improvement would be to switch to use pkg-config
instead, so that this becomes more maintainable :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
