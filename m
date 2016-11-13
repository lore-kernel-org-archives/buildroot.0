From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2016 18:16:35 +0100
Subject: [Buildroot] [PATCH for-master] package/quota: disable for musl
 toolchains
In-Reply-To: <1478903113-15617-1-git-send-email-romain.naour@gmail.com>
References: <1478903113-15617-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161113181635.6ca3d037@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Nov 2016 23:25:13 +0100, Romain Naour wrote:
> Quota doesn't build with musl toolchains without fixing several usual
> musl issues like:
>   - missing headers
>   - replacing all variables type like __uint64_t all over the code
>   - removing __P()
> 
> These changes are easy to fix but requires a lot of change in the code.
> Upstream started to fix some of them, so it would be possible to build
> Quota with musl with the next version bump.

Well, in fact, really not many changes were needed to make quota build
with the musl C library, so I did them, and committed:

  https://git.buildroot.org/buildroot/commit/?id=9317b9542bd3971bc340808ca8efadee36f5b263

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
