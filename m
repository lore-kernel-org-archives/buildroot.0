From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Fri, 31 Jul 2015 16:02:37 +0000
Subject: [Buildroot] [PATCH 1/1 v2] Build El Torito for i386 PC
In-Reply-To: <20150729173643.18dabf28@free-electrons.com>
References: <1438170732.2675.12.camel@intel.com>
 <20150729173643.18dabf28@free-electrons.com>
Message-ID: <1438358553.3808.4.camel@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> And I tested your patch, and it fails to build. So it seems like you
> did not test it properly.

humble apologies, I thought it was fine - clearly I made a mistake
somewhere. 

>  The reason is that the $(GRUB2_IMAGE) used by
> your new post-install hook is not generated until the next post-install
> hook (the existing GRUB2_IMAGE_INSTALLATION function) gets executed. But
> this hook is afterwards.

Moving ELTORITO to after GRUB2_IMAGE_INSTALLATION would have fixed it
also 
then. I originally had my code exactly like this yours then didn't want
to 
pollute GRUB2_IMAGE_INSTALLATION with the GRUB2_IMAGE_INSTALL_ELTORITO
which 
may be empty. 

> 
> So I changed the implementation to simply make the
> GRUB2_IMAGE_INSTALLATION function call GRUB2_IMAGE_INSTALL_ELTORITO.

np, small change. 

Thanks,

Ray K
