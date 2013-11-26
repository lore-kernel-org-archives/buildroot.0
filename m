From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Nov 2013 22:45:00 +0100
Subject: [Buildroot] Kernel and Uboot
In-Reply-To: <OF2C4FAABF.33F2B611-ON85257C2E.0063CAF1-85257C2E.00641111@LocalDomain>
References: <OF2C4FAABF.33F2B611-ON85257C2E.0063CAF1-85257C2E.00641111@LocalDomain>
Message-ID: <5295165C.7020708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/11/13 19:13, Naitik Amin wrote:
> Hi there,
>
> I am looking to submit my extracted kernel and uboot into my source
> control. Is there a config option in BR that I can use to point to a
> folder that contains the kernel and uboot ? I am constantly changing
> kernel and everytime, I do that I have to unzip, make changes and zip.
> Also its hard to track the changes.

  Take a look at LINUX_OVERRIDE_SRCDIR. It's not currently documented in 
the buildroot manual, but you can read the help text of the "location of 
a package override file" in the "Build options" menu.

A package override file is a short makefile that contains variable 
definitions of the form <pkg>_OVERRIDE_SRCDIR, which allows to tell 
Buildroot to use an existing directory as the source directory for a 
particular package. See the Buildroot documentation for more details on 
this feature.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
