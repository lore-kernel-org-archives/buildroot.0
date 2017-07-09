From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Jul 2017 17:24:58 +0200
Subject: [Buildroot] [PATCH v2 4/7] arch/xtensa: accept the overlay to
 be an URL
In-Reply-To: <20170709135718.GD3196@scaer>
References: <1499602921-25097-1-git-send-email-jcmvbkbc@gmail.com>
 <1499602921-25097-5-git-send-email-jcmvbkbc@gmail.com>
 <20170709154853.68622a94@windsurf> <20170709135718.GD3196@scaer>
Message-ID: <20170709172458.04eaf58d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 9 Jul 2017 15:57:18 +0200, Yann E. MORIN wrote:

> > Another issue that I have is that we're not checking its hash, even if
> > the file used in the qemu xtensa defconfigs doesn't have any version
> > information in its name, making it quite likely that the contents of
> > the file will change without us knowing.  
> 
> Hmm... IIRC, in the following patch, we're using the file from a specific
> git sha1, aren't we? In this case, we don't really expect it to change...

Yes, we are fetching from a specific git sha1. And anyway since it's a
custom download, there's no way to store a hash.

> > In any case, I'd like to hear about a direction to solve the
> > per-package DL_DIR issue.  
> 
> I think this will be as simple as using:
> 
>     ARCH_XTENSA_OVERLAY_FILE = $($(PKG)_DL_DIR)/$(notdir $(BR_ARCH_XTENSA_OVERLAY_FILE))
> 
> since this will be expanded in the commands for the .stamp_downloaded
> stamp file.

Indeed, so it's fine for me. I've applied the patches.

> But as you say, this means the file will be duplicated for each
> component that needs the overlay.

Not a big deal IMO. It's a 90 KB file, and it's only for the specific
case of Xtensa, so I don't think it's worth extending the infra to
optimize for this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
