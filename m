From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 05 Jun 2012 01:58:08 +0200
Subject: [Buildroot] [PATCH 03/10] libxmlrpc: new package
In-Reply-To: <d6e101fca46d16dbd2ebd312240f6b7de6bda48a.1338653505.git.thomas.petazzoni@free-electrons.com>
References: <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
 <d6e101fca46d16dbd2ebd312240f6b7de6bda48a.1338653505.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4FCD4B90.3020007@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/02/12 18:13, Thomas Petazzoni wrote:
> +LIBXMLRPC_VERSION = 1.18.05
> +LIBXMLRPC_SOURCE = xmlrpc-c-$(LIBXMLRPC_VERSION).tgz
> +LIBXMLRPC_SITE ="http://xmlrpc-c.svn.sourceforge.net/viewvc/xmlrpc-c/advanced/?view=tar&pathrev=1716"

  It's a bit strange to use a three-year-old unstable version...
 From the website:

    Latest Tarballs
Series        Number
Development    unnumbered
Advanced    1.30.06
Stable        1.25.16
Super Stable    1.16.41

[snip]
> +# Override the download step since we don't have the normal
> +# site/source split (where site is the URL of the directory and source
> +# is the name of the tarball file).
> +$(LIBXMLRPC_DIR)/.stamp_downloaded:
> +    $(Q)$(call MESSAGE,"Downloading")
> +    $(call DOWNLOAD,$(LIBXMLRPC_SITE),$(LIBXMLRPC_SOURCE))
> +    $(Q)mkdir -p $(@D)
> +    $(Q)touch $@

  A simpler solution would be to just use the svn download method, from
https://xmlrpc-c.svn.sourceforge.net/svnroot/xmlrpc-c/stable/


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
