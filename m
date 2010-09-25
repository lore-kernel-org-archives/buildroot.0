From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 25 Sep 2010 13:52:40 +0200
Subject: [Buildroot] [PATCH 00/01] Just a heads up about libtool 2.4
In-Reply-To: <1285400034-17267-1-git-send-email-Martin.Banky@gmail.com>
References: <1285400034-17267-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1285415560.27944.13.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le samedi 25 septembre 2010 ? 00:33 -0700, Martin Banky a ?crit :
> I've only tested this on my config settings, so far, and it works for me. I'll
> be doing some more testing over the next week or so.
> 
> Martin
> 
> [PATCH 01/01] libtool: bump to 2.4 - now with sysroot support

That's great ! I haven't paid attention to the libtool releases...

But just bumping libtool isn't enough to use the sysroot feature from
our libtool. You've get ride of the -L$(STAGING_DIR)/lib and -L
$(STAGING_DIR)/usr/lib option we add, and also remove the SED pass we
make on the .la files.

And still, you need to autoreconf package you want to use our libtool
version. Otherwise packages are stuck with the shipped libtool script.

Best regards,

--
Lionel
