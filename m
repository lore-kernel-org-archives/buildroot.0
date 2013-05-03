From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 03 May 2013 19:13:13 +0200
Subject: [Buildroot] [PATCH 1/2] Refactoring Freescale's iMX software
 revision levels
In-Reply-To: <42565.217.149.209.147.1367582464.squirrel@webmail.internl.net>
References: <1367569664-3307-1-git-send-email-h.fijnvandraat@inter.nl.net>
 <42565.217.149.209.147.1367582464.squirrel@webmail.internl.net>
Message-ID: <5183F029.1000907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/05/13 14:01, H.Fijnvandraat at inter.nl.net wrote:
> Sorry,
>
> But I have to withdraw these patches.
>
> Due to the sequence in which the .mk files are included IMX_VERSION_LEVEL
> is defined when imx-lib.mk is processed, while it is already needed for
> firmware-imx (and  gpu-viv-bin-mx6q if it would be introduced)
>
> Placing it in firmware-imx would do for now, but then no dependencies can
> be placed alphabetically before it later.
>
> It appears we need some other mechanism to rule them all.

  Ah, yes stupid of me. Normally the order of assignments doesn't matter, 
but the generic-target contains an 'ifndef $(2)_VERSION'.

  So the only solution is to collect the imx packages in an imx 
subdirectory, like qt5. I've told Henk earlier that we try to avoid 
creating subdirectories in the package directory, but perhaps this is a 
good reason to do it. What do the others think?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
