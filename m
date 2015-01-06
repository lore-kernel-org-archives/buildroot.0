From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jan 2015 09:28:36 +0100
Subject: [Buildroot] Need iconv(): fatal error: iconv.h: No such file or
 directory
In-Reply-To: <3f160793d89243dd860bee8dd5e7acc4@exch13-mail05.win.slac.stanford.edu>
References: <3f160793d89243dd860bee8dd5e7acc4@exch13-mail05.win.slac.stanford.edu>
Message-ID: <20150106092836.134b13fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Williams Jr., Ernest L.,

On Tue, 6 Jan 2015 06:17:26 +0000, Williams Jr., Ernest L. wrote:

> I am working with a package that needs  iconv()
> 
> How can I get this in buildroot?
> 
> Here is my error:
> fatal error: iconv.h: No such file or directory

iconv is either provided by your toolchain (if it has locale support),
or by libiconv. So, your package should do in its Config.in file:

	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE

and in the .mk file:

ifeq ($(BR2_PACKAGE_LIBICONV),y)
<pkg>_DEPENDENCIES += libiconv
endif

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
