From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Apr 2013 23:24:58 +0200
Subject: [Buildroot] [RFC] permit menu customization
In-Reply-To: <1366621622-7953-1-git-send-email-spdawson@gmail.com>
References: <1366621622-7953-1-git-send-email-spdawson@gmail.com>
Message-ID: <5175AAAA.5030503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Simon,


On 22/04/13 11:07, spdawson at gmail.com wrote:
> From: Simon Dawson<spdawson@gmail.com>
>
> This patch is a first attempt at providing a mechanism by which the user
> can specify a local menu configuration file, for extending the Buildroot
> menu system.

  A couple of patches with a similar purpose have been posted in the last 
year or so. However, at the last two buildroot developer meetings we've 
decided that this approach is not the way we want to go. Instead, adding 
custom packages should be done by including them directly at the top of 
packages/Config.in.


> The main use case I have in mind is the selection and configuration of
> local packages.
>
> One problem with what is proposed here is that it is necessary to
> "bootstrap" the system by providing an empty Config.in.user file; ideally,
> this file should be touched somewhere in the top-level Makefile, and added
> to .gitignore, as it is really a build artefact.

  Another buildroot rule is that the build should never modify the 
buildroot directory itself when O= is specified on the command line. So 
the Config.in.user should at least be in the CONFIG_DIR rather than the 
TOPDIR.


  Regards,
  Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
