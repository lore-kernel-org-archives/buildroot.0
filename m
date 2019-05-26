From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2019 19:32:41 +0000
Subject: [Buildroot] [Bug 11906] the new version of mesa3d cannot support
 etnaviv when compiled with --enable-autotools
In-Reply-To: <bug-11906-163@https.bugs.busybox.net/>
References: <bug-11906-163@https.bugs.busybox.net/>
Message-ID: <bug-11906-163-6ilqi5esVD@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11906

--- Comment #2 from romain.naour at gmail.com ---
Hi,

kmsro driver is currently only available for vc4 GPU since Buildroot (2019.05)
currently use autotools build system. See [1].

As you noticed, building kmsro driver for etnaviv require to use the meson
build system. There is an existing patch series in the patchwork doing so [2].
There is even a patch adding the support for kmsro driver for etnaviv [3].

It would be great if you can test this series and send a feedback (Tested-by).
See [4] for further details.

So this is not really a bug, this is a missing feature due to the late
switching to meson build system in mesa3d package.

Best regards,
Romain

[1]
https://git.buildroot.net/buildroot/commit/?id=c19e2f44cccf65f34c416ecda9a9ebd96608891f
[2] http://patchwork.ozlabs.org/project/buildroot/list/?series=106301
[3] http://patchwork.ozlabs.org/patch/1095779
[4] http://nightly.buildroot.org/manual.html#_reviewing_and_testing_patches

-- 
You are receiving this mail because:
You are on the CC list for the bug.
