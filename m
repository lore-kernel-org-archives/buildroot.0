From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Nov 2017 21:21:03 +0100
Subject: [Buildroot] [PATCH 1/1] add qmake.conf fixup for sunxi-mali
 platforms
In-Reply-To: <002cc8ca-ccf5-7610-905a-735e0740d942@micronovasrl.com>
References: <1510066081-35701-1-git-send-email-giulio.benetti@micronovasrl.com>
 <002cc8ca-ccf5-7610-905a-735e0740d942@micronovasrl.com>
Message-ID: <fd2c8e8f-ebe0-79a7-df05-a4c2bc01ba11@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-11-17 19:58, Giulio Benetti wrote:
> This patch is buggy.
> The same for Gary Bisson patch.
> Must put "EGLFS_DEVICE_INTEGRATION = eglfs_mali"
> before:
> 
> include(../common/linux_device_post.conf)
> load(qt_config)
> 
> otherwise qmake ignores it.
> I thought to use sed to append EGLFS_DEVICE_INTEGRATION = eglfs_mali/viv just
> after include(arch.conf).

 Yes, with sed is a good idea. Preferably by renaming qmake.conf to
qmake.conf.in and always using sed to generate the actual qmake.conf file. Add a
line

EGLFS_DEVICE_INTEGRATION = @EGLFS_DEVICE@

at the appropriate place. The sed then either replaces @EGLFS_DEVICE@ with the
proper string, or deletes the line.

 Regards,
 Arnout

> 
> What do you think?
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
