From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Mar 2020 08:40:17 +0200
Subject: [Buildroot] [PATCH 1/1] Revert "package/opencv3: bump to
 version 4.2.0"
In-Reply-To: <20200310223132.668486-1-fontaine.fabrice@gmail.com>
References: <20200310223132.668486-1-fontaine.fabrice@gmail.com>
Message-ID: <20200330084017.781ec6f3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Mar 2020 23:31:32 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This reverts commit 5e51bb2756ee5063eff9a45a46033a449e2a6195.
> Indeed, version 4.x is not backward with opencv 3.x, most of the C API
> has been removed as stated in https://opencv.org/opencv-4-0.

Note that this doesn't say that "most of the C API has been removed".
It says "A lot of C API from OpenCV 1.x has been removed.". The 1.x is
important!

It means that programs that are breaking are using really legacy OpenCV
APIs.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
