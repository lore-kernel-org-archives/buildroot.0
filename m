From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Aug 2013 16:06:57 +0200
Subject: [Buildroot] libffi target header installation problem
In-Reply-To: <277645944.5505869.1377525879032.JavaMail.root@openwide.fr>
References: <20130826154420.72868235@skate>
 <277645944.5505869.1377525879032.JavaMail.root@openwide.fr>
Message-ID: <20130826160657.59266f0b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nicolas M?n?gale,

On Mon, 26 Aug 2013 16:04:39 +0200 (CEST), Nicolas M?n?gale wrote:

> Well I had, for a specific reason, two folder for two different versions of libffi into $(STAGING_DIR)/usr/lib/:
> libffi-3.0.11 and libffi-3.0.10 
> This mv command was failing saying:
> "will not overwrite just-created <filename> with <sameFilename>"
> because it was trying to overwrite the .h it just moved. 

Ok, that's what can happen if you bump Buildroot and then restart the
build without doing a "make clean". We generally don't support this
kind of use case, but I agree that in this case it doesn't hurt to
specify explicitly the version, so you can certainly send a patch for
this.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
