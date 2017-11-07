From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 7 Nov 2017 11:53:38 -0700 (MST)
Subject: [Buildroot] [git commit] qt5base: add qmake.conf fixup for i.MX
 platforms
In-Reply-To: <20171106173439.E5B41810DB@busybox.osuosl.org>
References: <20171106173439.E5B41810DB@busybox.osuosl.org>
Message-ID: <1510080818847-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

unfortunately it doesn't work.
The problem is that you can't put at the end of file
EGLFS_DEVICE_INTEGRATION = eglfs_viv
It must stay before:

include(../common/linux_device_post.conf)
load(qt_config)

I did the same for eglfs_mali and failed,
so I've retried putting it there, and it works.

Cheers



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
