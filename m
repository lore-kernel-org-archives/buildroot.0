From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jan 2020 17:14:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/opencv3: add protobuf option
In-Reply-To: <20200111150143.1253117-1-fontaine.fabrice@gmail.com>
References: <20200111150143.1253117-1-fontaine.fabrice@gmail.com>
Message-ID: <20200111171444.49006f09@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Jan 2020 16:01:43 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Currently, protobuf is built unconditionnally since version 3.3.0 and
> https://github.com/opencv/opencv/commit/1c4c58d1b5b7430463281e8c8072e04245f561b0

If I understand correctly, what you meant is:

Since version 3.3.0 and its commit
https://github.com/opencv/opencv/commit/1c4c58d1b5b7430463281e8c8072e04245f561b0,
opencv3 bundles its own copy of protobuf. Instead of using the bundled
protobuf library, this commit disables building protobuf
(BUILD_PROTOBUF=OFF) and instead uses the protobuf Buildroot package
(using the WITH_PROTOBUF=ON/OFF option).

Is that correct ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
