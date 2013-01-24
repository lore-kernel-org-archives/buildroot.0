From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Jan 2013 20:19:18 +0100
Subject: [Buildroot] [RFC v1 01/14] Add a new "src" directory in the
 output directory
In-Reply-To: <1663985.KsIK240cT1@sagittae>
References: <1358713538-4364-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1358713538-4364-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <1663985.KsIK240cT1@sagittae>
Message-ID: <51018936.8000706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/21/13 06:38, J?r?me Pouiller wrote:
>> >  +SRC_DIR:=$(BASE_DIR)/src
> IMHO, $(SRC_DIR) should be in $(TOPDIR) to be shared between different
> configurations. In add $(SRC_DIR) have to customizable in case I would like to
> clearly separate two projects.
>
> I think, my workspace would look like this:
>    br/srcs-projet1
>    br/srcs-projet2
>    br/output-project1-configA
>    br/output-project1-configB
>    br/output-project2-configA
>    br/output-project2-configB
>
> Finally SRC_DIR should be handled like DL_DIR.

  I agree that that would be a good idea.

  However, what if the patches are different for two configurations? They 
can be different because:

- there is a configuration option for custom patches, like 
BR2_LINUX_KERNEL_PATCH

- there are patches applied depending on configuration options, like 
BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH

- there are manual modifications applied depending on some configuration 
option, like BZIP2_NOLARGEFILE_FIX_MAKEFILE

- override.mk appends to the FOO_PATCH variable

- BR2_EXTRA_PACKAGE_PATCH_DIRS (not committed yet, 
http://patchwork.ozlabs.org/patch/204216/ )

  So in practice, I'm afraid it's not feasible.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
