From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Nov 2016 22:12:35 +0100
Subject: [Buildroot] [PATCH] dtv-scan-tables: rename file to have only
 ASCII characters
In-Reply-To: <20161114211024.GC3399@free.fr>
References: <1479156903-486-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20161114211024.GC3399@free.fr>
Message-ID: <20161114221235.2f101d88@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Nov 2016 22:10:24 +0100, Yann E. MORIN wrote:

> At first, I was not very happy about this, because the filename is also
> displayed to the user, so it would make sense to keep localised names.
> 
> However, you are right that there is no standard way to encode
> filenames, so this is not very reliable to depend on the filename to
> provide a user-visible representation of the city/country/... Instead,
> the location should be encoded in the file itself, possibly using the
> filename as a ascii-only fallback.

There are already many many other files that should have non-ASCII
characters to accurately represent the name of the city or region, but
that don't have them. From the commit log of the patch I just sent
upstream:

  - pl-Wroclaw should be written pl-Wroc?aw
  - se-Laxsjo should be written se-Laxsj?
  - de-Dusseldorf should be written de-D?sseldorf
  - vn-Thaibinh should be written vn-Th?i_B?nh

> > +	mv $(TARGET_DIR)/usr/share/dvb/dvb-t/pl-Krosno_Sucha* \
> > +		$(TARGET_DIR)/usr/share/dvb/dvb-t/pl-Krosno_Sucha_Gora  
> 
> Can't you do that in a post-extrat or post-patch hook?

Sure, v2 coming.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
