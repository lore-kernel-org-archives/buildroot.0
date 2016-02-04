From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 4 Feb 2016 22:32:45 +0100
Subject: [Buildroot] [PATCH v2 1/2] qt5tools: new package
In-Reply-To: <20160204221333.00873039@free-electrons.com>
References: <1454536870-4977-1-git-send-email-ps.report@gmx.net>
 <20160203234438.08f631d1@free-electrons.com>
 <20160204212039.461849f4@gmx.net>
 <20160204213823.463b5e1f@free-electrons.com>
 <20160204220705.0f227f46@gmx.net>
 <20160204221333.00873039@free-electrons.com>
Message-ID: <20160204223245.243b9c96@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Thu, 4 Feb 2016 22:13:33 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Thu, 4 Feb 2016 22:07:05 +0100, Peter Seiderer wrote:
> 
> > > This does not really answer the question. The question is really
> > > whether pixeltools uses only the Qt5 PNG functions, or directly the
> > > libpng functions.
> > 
> > Sorry for not being precise here, pixeltools uses only Qt5 PNG functions
> > (via QPixmap.save(name, "PNG"))...
> 
> OK, then the dependency on libpng is indeed not needed.
> 
> 
> > > Having host binaries in $(STAGING_DIR) is really not good. So yes,
> > > maybe QT_INSTALL_BINS should point to $(HOST_DIR)/usr/bin/.
> > 
> > Will take a look and try to change QT_INSTALL_BINS, hope it breaks no
> > other usage...
> 
> That's also what I'm a bit afraid of, but the only way to know is to
> actually test.

Found a better way, simple use QT_HOST_BINS instead of QT_INSTALL_BINS
in my example...will send an updated patch soon...

Regards,
Peter

> 
> Best regards,
> 
> Thomas
