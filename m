From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Apr 2017 14:38:59 +0200
Subject: [Buildroot] [RFC 4/4] board/acmesystems/aria-g25: set
 BR2_GENIMAGE_CFG_FILES
In-Reply-To: <59b34755-2637-5330-84ab-9d47e177bd0a@andin.de>
References: <20170329145120.11863-1-etienne.phelip@savoirfairelinux.com>
 <20170329145120.11863-5-etienne.phelip@savoirfairelinux.com>
 <ccc877c5-1ea5-e2d6-1739-c913f4d6d0a7@mind.be>
 <f2428cf7-660e-f22d-0e5e-4b22e1abf870@andin.de>
 <4d773ae6-949d-800e-938b-f9780b25c2e9@mind.be>
 <6948dd58-dd05-8b72-6249-7c230035c62c@andin.de>
 <b10839b0-389e-f445-ab41-269480c387e3@mind.be>
 <59b34755-2637-5330-84ab-9d47e177bd0a@andin.de>
Message-ID: <ffca4464-9f76-2430-b578-e6ce3354ebf5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-04-17 08:38, Andreas Naumann wrote:
> Hi,
> 
> Am 03.04.2017 um 15:54 schrieb Arnout Vandecappelle:
[snip]
>>  Coming back to the BR2_GENIMAGE_CFG_FILES option: actually it would make a
>> whole lot more sense if the genimage were executed under fakeroot, because then
>> we no longer need to generate the .ext2 subimage.
>>
>>  Still, there is hardly any advantage over having this as an explicit option
>> rather than configuring
>>
>> BR2_ROOTFS_POST_FAKEROOT_SCRIPT="support/scripts/genimage.sh"
>> BR2_ROOTFS_POST_SCRIPT_ARGS="-c path/to/my/genimage.cfg"
> 
> In fact, this is almost what i do right now. Just a rootfs.tar is created and
> subsequently processed by genimage (I have a small patch that allows genimage to
> be fed with a tar in additin to the input dir).

 I do think it's nicer to run it under fakeroot, rather than creating a tarball
that's not going to be used in the end. Especially because it ties in nicely
with any rootfs fixups that need to be done, e.g. splitting over several
filesystems.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
