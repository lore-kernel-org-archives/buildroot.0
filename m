From: Erik Andersen <andersen@codepoet.org>
Date: Mon, 2 Oct 2006 16:19:05 -0600
Subject: [Buildroot] Wrong pathnames in libtool and pkgconfig files
In-Reply-To: <4521820B.8010008@isoar.ca>
References: <4521820B.8010008@isoar.ca>
Message-ID: <20061002221905.GA10942@codepoet.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon Oct 02, 2006 at 05:18:03PM -0400, Andrew E. Mileski wrote:
> I'm repeatedly having problems with pathnames in *.la and *.pc files,
> since packages are built for / but installed in $(STAGING_DIR).  This
> breaks packages that rely on these files being accurate.
> 
> So far I've resorted to sed'in them, which mostly works:
>     sed -i filename -e 's#/usr#$(STAGING_DIR)/usr#g'
> but is sure to cause problems if not prevented from being repeated.
> 
> This effects all packages built using libtool and pkgconfig.
> 
> Is there a more correct way to handle this?

Ugh.  I'd never considered this, but yeah you are right.  I do
not know of any way to teach libtool about a cross compiling
setup, so unless someone else has a better idea I think your
idea to use sed is the best thing we have going.

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
