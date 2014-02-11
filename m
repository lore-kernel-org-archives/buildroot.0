From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Feb 2014 16:47:50 +0100
Subject: [Buildroot] [PATCH] sdl: fix autoreconf timing issue
In-Reply-To: <1392109955-742-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1392109955-742-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140211164750.0e57be5c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Tue, 11 Feb 2014 10:12:35 +0100, Maxime Hadjinlian wrote:

> If your machine was under heavy load, the time difference between the
> two files would have been greater and then *maybe* picked up by
> autoconf. And then the configure file was re-generated.
> 
> When the 0001 patch was introduced, SDL package did *NOT* run it's
> autogen.sh, which is why it touches also the configure.
> This came later, causing this behavior.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/d1c/d1c36f634dbf6b6e5d18444c2a23dfd129202b80/
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Wow, amazing problem. Thanks a lot for getting to the bottom of it. The
solution is indeed simple, but the investigation definitely wasn't
(I've followed your conversation with Yann on IRC yesterday evening,
and I remember quickly discussing the issue with you during the
Buildroot Developer Days). Congrats!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
