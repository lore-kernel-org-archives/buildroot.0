From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Jul 2017 23:12:53 +0200
Subject: [Buildroot] [PATCH] package/linux-tools: add tmon
In-Reply-To: <CAGt4E5s3Yp7zu4vgSCWCZEaRo0W5r5yNSwTrLcM3u07nSteAKQ@mail.gmail.com>
References: <1500415831-17747-1-git-send-email-mmayer@broadcom.com>
 <20170719213905.34cc4c8b@windsurf>
 <CAGt4E5s3Yp7zu4vgSCWCZEaRo0W5r5yNSwTrLcM3u07nSteAKQ@mail.gmail.com>
Message-ID: <ef5184a4-ab70-4772-7950-b1a573e29ea4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19-07-17 22:08, Markus Mayer wrote:
>> It failed to build for me, because the tmon Makefile forces
>> -fstack-protector, which doesn't work with toolchains that lack SSP
>> support. So I've added a small tweak that removes -fstack-protector
>> from tmon's Makefile if the toolchain doesn't have SSP support.
> Yikes! Having to support multiple different toolchains can lead to
> some good fun. Yeah, I kind of took the easy route of just trying a
> single one. Sorry.

 That's why we have utils/test-pkg. For things with a kernel dependency it's a
bit more complicated to set up (you need a different kernel config for different
toolchains, and BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG is not available for
all arches and takes a loooooong time for x86_64). But with e.g. just one for
ARM you already get pretty far.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
