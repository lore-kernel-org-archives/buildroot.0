From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 1 Mar 2017 20:07:59 +0100
Subject: [Buildroot] [PATCH 1/1] csky: Add new architecture
In-Reply-To: <1488357224-5141-1-git-send-email-ren_guo@c-sky.com>
References: <1488357224-5141-1-git-send-email-ren_guo@c-sky.com>
Message-ID: <1b4215f6-b664-8778-9ffb-e9b9739743d5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-03-17 14:14, Thomas Petazzoni wrote:
> However, since initially you will not support the "internal toolchain
> backend" (i.e when Buildroot builds the toolchain from scratch), then
> you should change the definition of BR2_TOOLCHAIN_BUILDROOT with:
>
> 	depends on !BR2_csky
>
> So that on the csky architecture, only the external toolchain option is
> available.

 If the toolchain you pull from github is more or less stable, you could also
opt to add it to toolchain/toolchain-external, so it is easier to fetch it.

 BTW, note that you will need to depend on BR2_HOSTARCH = "x86_64" for these
external toolchains.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
