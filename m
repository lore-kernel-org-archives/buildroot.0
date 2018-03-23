From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 23 Mar 2018 19:08:16 +0100
Subject: [Buildroot] [PATCH v5 1/1] gobject-introspection: new package
In-Reply-To: <CANQCQparY42yn4WHD_7Ti3Sz9GTmwFQS1FfR40cUvYp7PmsBQg@mail.gmail.com>
References: <20180318190131.21404-1-aduskett@gmail.com>
 <20180318190131.21404-5-aduskett@gmail.com>
 <CANQCQparY42yn4WHD_7Ti3Sz9GTmwFQS1FfR40cUvYp7PmsBQg@mail.gmail.com>
Message-ID: <2f6b2001-5b26-76c0-e744-e1bea915007d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-03-18 18:39, Matthew Weber wrote:
> However, the sdk make target and the relocate-sdk.sh would
> need to be updated to handle fixing up the staging directory paths...
> Unsure if the staging fixup would be a good thing though, as other
> files in that folder may not like that (nothing else really should
> have absolute paths, right? so maybe it's transparent).  Another
> approach would be to make the wrappers relative pathed but that gets
> tricky with HOST_DIR and STAGING_DIR having the option of being custom
> locations and not in the same output folder.

 Only HOST_DIR has the option of being in a custom location. STAGING_DIR is
always $(HOST_DIR)/$(GNU_TARGET_NAME)/sysroot.

 And in fact, relocate-sdk.sh is already going through STAGING_DIR: it does a
grep -r on HOST_DIR so it *will* also recurse into STAGING_DIR.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
