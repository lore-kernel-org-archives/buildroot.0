From: Alex Suykov <alex.suykov@gmail.com>
Date: Thu, 24 Dec 2015 20:42:56 +0200
Subject: [Buildroot] [PATCH 1/2 v3] vboot-utils: new package
In-Reply-To: <20151224123633.6740e4d3@free-electrons.com>
References: <cover.1447689401.git.alex.suykov@gmail.com>
 <4c9ac9c66d52a2760002718d0827b1c146633aa1.1447714688.git.alex.suykov@gmail.com>
 <20151224123633.6740e4d3@free-electrons.com>
Message-ID: <20151224184256.GA7322@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thu, Dec 24, 2015 at 12:36:33PM +0100, Thomas Petazzoni wrote:

> I wanted to apply this patch, but it fails to build. It forgets to link
> with the OpenSSL library that has been built in $(HOST_DIR)/usr/lib.
> Can you have a look? To reproduce, make sure you don't have the
> openssl-dev package installed on your system.

Well it fails for me even with the system openssl installed.
That's because of pkg-config actually, and fixing pkg-config brought up
some more issues.

Sending v4, checked against current master.
