From: Steve Goldberg <indeliblesteve@hotmail.com>
Date: Tue, 31 Jul 2012 09:47:12 -0700
Subject: [Buildroot] Manual password entry for DOWNLOAD_SCP scheme
In-Reply-To: <CAAXf6LVtNQuR0Loh0pTibdjQrnb-TkaMzjU0K3HOAxX5LkHGHA@mail.gmail.com>
References: <BLU145-W509744A25C67F5562EF92D6C50@phx.gbl>,
 <CAAXf6LUXNqAHCCLkkNDRO8AA79fzpp9xmQhBDZJWBXF0aNae5g@mail.gmail.com>,
 <BLU145-W160B8971C18907119E0961D6C50@phx.gbl>,
 <BLU145-W4DD32AE633EE92CAAD36DD6C50@phx.gbl>,
 <CAAXf6LVtNQuR0Loh0pTibdjQrnb-TkaMzjU0K3HOAxX5LkHGHA@mail.gmail.com>
Message-ID: <BLU145-W165CC15ECB60DF7B9E7E75D6C50@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Please keep the buildroot mailing list in copy of all mails.

Sorry.  Will try and remember, reply all.
> > This is a summary of the ti-tools.mk.
> >
> > XDC_VERSION=3_16_01_27
> > XDC_SITE=scp://host:/home/steve/TI_Tools
> > XDC_SOURCE=xdctools_setuplinux_$(XDC_VERSION).bin
> >
> > $(DL_DIR)/$(XDC_SOURCE) :
> >         $(call DOWNLOAD_SCP,$(XDC_SITE)/$(XDC_SOURCE))
> 
> Note that you should call DOWNLOAD instead of DOWNLOAD_SCP directly.
> This will make sure to respect the primary site and other mechanisms
> that are in place.
I tried this initially but I got "Unsupported scheme `scp'."  When I use DOWNLOAD_SCP directly, it worked.  I think it's because I've placed the package in 'toolchain' not in the 'package' directory as it is technically a toolchain not a target package.
Steve Goldberg 		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120731/905f1dd7/attachment.html>
