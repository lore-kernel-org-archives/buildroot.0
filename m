From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 00:57:38 +0200
Subject: [Buildroot] [PATCH 1/1] rust: make sure the cxx compiler is
 also set for the target
In-Reply-To: <F8479AD1-B731-4235-A6C6-A517165DD553@storagecraft.com>
References: <20180228173852.66069-1-charles.hardin@storagecraft.com>
 <20180402004857.7e7e46c1@windsurf>
 <F8479AD1-B731-4235-A6C6-A517165DD553@storagecraft.com>
Message-ID: <20180402005738.1d603538@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for the quick feedback!

On Sun, 1 Apr 2018 22:52:42 +0000, Charles Hardin wrote:
> We have a problem where we build on a HOST with x86_64 and RUST
> doesn?t realize the difference between the host tool chain and the buildroot
> toolchain.
> 
> In the old days - we had to patch rust to make a ?x86_64-buildroot-linux-gnu?
> target that would be recognized, but the latest patches removed that around
> rust 1.9 or so.
> 
> This was literally just looking at the logs and seeing the ?cc? was the buildroot
> cc and the the cxx was ?c++?, so it is just what we hacked together to get
> things to work.
> 
> But - definitely need to set ?cxx? in some appropriate fashion for rust to get
> compiled correctly.

Setting cxx looks definitely OK in your patch. It's the
RUSTC_HOST_NAME != RUSTC_TARGET_NAME that looks wrong.

Could you provide some specific examples (with defconfigs to reproduce)
for the two problems:

 - Lack of cxx variable

 - Case of RUSTC_HOST_NAME == RUSTC_TARGET_NAME

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
