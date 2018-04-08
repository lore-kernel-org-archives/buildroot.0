From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Apr 2018 21:43:26 +0200
Subject: [Buildroot] [git commit] qt5base: correct eglfs support in
 qmake.conf.in
In-Reply-To: <20180404213959.A267084076@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Wed, 4 Apr 2018 23:35:22 +0200")
References: <20180404213959.A267084076@busybox.osuosl.org>
Message-ID: <87fu45a3hd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=81fb33af2a6e4f4d379da3372b2a607b7ae1a21f
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Setting EGLFS_DEVICE_INTEGRATION at the end of qmake.conf like is done
 > by commit 0c219ddb8a doesn't work correctly: it has to be set before the
 > include(../common/linux_device_post.conf)

 > Instead of appending to the file, change it into a qmake.conf.in
 > template file that contains a placeholder for the
 > EGLFS_DEVICE_INTEGRATION assignment and update it with sed. Since the
 > sed always has to be executed, this removes the need for a separate
 > QT5BASE_CONFIGURE_QMAKE_CONFIG definition.

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
 > [Arnout: simplify the replacement, move sunxi-mali support to a
 >  separate patch]
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
