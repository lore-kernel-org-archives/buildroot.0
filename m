From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 21:20:24 +0100
Subject: [Buildroot] [PATCH 00/23] xtensa overlay application rework
In-Reply-To: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
References: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20170314212024.0585e0e8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Mar 2017 11:30:29 -0700, Max Filippov wrote:

> This series cleans up xtensa overlay application code, making
> it uniform across its users in the toolchain, reducing the number of
> configuration variables and making it possible to use compressed
> overlays and download overlays from network.
> This is a subset of a series initially submitted by Yann E. MORIN
> in 2015, I've forward-ported the original submission, addressed the
> posted comments and added overlay application to linux and U-Boot.

A big question is: why do we have this weird overlay mechanism,
specifically for this CPU architecture? Why don't they use patches like
everybody else?

It has always bothered me that we had this mechanism, and I'd like to
challenge the fact that we need this, and see if a better solution is
possible.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
