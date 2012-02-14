From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Feb 2012 00:46:57 +0100
Subject: [Buildroot] [PATCH v3-resend 2/2] new program:
	usb_modeswitch_data
In-Reply-To: <CAC78GpeY=K+DFxVn_USw=G3c+jAB_Fa0+MtVGTvsBhQiGt3Mwg@mail.gmail.com>
References: <1329073793-524-1-git-send-email-jwoltz@gmail.com>
 <CAAXf6LVC7C3mWLhvkFWONt3=4M=29wysdbGiw7nkRdmgSnBGWw@mail.gmail.com>
 <CAC78GpeY=K+DFxVn_USw=G3c+jAB_Fa0+MtVGTvsBhQiGt3Mwg@mail.gmail.com>
Message-ID: <201202150046.57364.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 13 February 2012 17:59:46 J.C. Woltz wrote:
> The script that get
> called from udev when it detects a device,
> usr/sbin/usb_modeswitch_dispatcher, uses tclsh. Specifically
> #!/usr/bin/tclsh
> 
> Three questions:
> 1. Should usb_modeswitch_data depend on tcl? (BR2_PACKAGE_TCL)
 Certainly.  Or rather, it should select it :-)

> 2. The tcl package creates a usr/bin/tclsh8.4 but not a usr/bin/tclsh.
> Should the BR2_PACKAGE_TCL when BR2_PACKAGE_TCL_SHLIB_ONLY is not
> selected, create a symlink?
 I guess it should...

> 3. How do I tell usb_modeswitch_data to depend on BR2_PACKAGE_TCL but
> to exclude BR2_PACKAGE_TCL_SHLIB_ONLY?
 Good question...  You can make the usb_modeswitch_data package depend
on !BR2_PACKAGE_TCL_SHLIB_ONLY.  Or you could define a new 
BR2_PACKAGE_TCL_TCLSH config, and make BR2_PACKAGE_TCL_SHLIB_ONLY
depend on !BR2_PACKAGE_TCL_TCLSH.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120215/24c5e138/attachment.html>
