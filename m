From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Jan 2019 17:33:29 +0100
Subject: [Buildroot] [PATCH next v6 07/10] core: implement per-package
 SDK and target
In-Reply-To: <CAAXf6LXy7kQN4SGVx8LjSKxzBTwwzeDKKfo86dO12FZn8FEkdQ@mail.gmail.com>
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-8-thomas.petazzoni@bootlin.com>
 <1f520844-5501-a60b-cf66-5bae57b9f420@andin.de>
 <20181205173103.1eb30a7b@windsurf>
 <672791f3-4383-cad2-f31c-5362b94b94fb@andin.de>
 <8a886731-26ee-ba33-f303-81d5bd0e7954@andin.de>
 <20181226183422.76c6ff6c@windsurf.home>
 <CAAXf6LVJ6-H-pBA8C9i8LJxmQ=8ufdvOC3uHG5-cqz-WPyt=sg@mail.gmail.com>
 <30afb67d-f31d-4986-8490-2e97f5808eda@mind.be>
 <CAAXf6LVho4978cn=nkFMReanH4o5Z0D81OW5a-k_xWHRP77DQg@mail.gmail.com>
 <7c0307f9-5370-215b-7230-0f83da461c82@mind.be>
 <CAAXf6LXy7kQN4SGVx8LjSKxzBTwwzeDKKfo86dO12FZn8FEkdQ@mail.gmail.com>
Message-ID: <20190114173329.52892eb3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Jan 2019 17:01:44 +0100, Thomas De Schampheleire wrote:

> It seems the code already calls patchelf twice:
> 
>         if ${PATCHELF} --print-rpath "${file}" > /dev/null 2>&1; then
>             # make files writable if necessary
>             changed=$(chmod -c u+w "${file}")
>             # call patchelf to sanitize the rpath
>             ${PATCHELF} --make-rpath-relative "${rootdir}"
> ${sanitize_extra_args[@]} "${file}"
> 
> so by saving the string returned in the first call, we can actually do
> a better transformation ourselves.

My latest iteration (v7) is already saving the string to do some
transformation:

  http://patchwork.ozlabs.org/patch/1019149/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
