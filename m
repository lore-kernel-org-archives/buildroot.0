From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 21:30:57 +0100
Subject: [Buildroot] [PATCH 1/6] toolchain: add option for toolchains
 affected by GCC PR libstdc++/64735
In-Reply-To: <20170209174759.15819-2-joerg.krause@embedded.rocks>
References: <20170209174759.15819-1-joerg.krause@embedded.rocks>
 <20170209174759.15819-2-joerg.krause@embedded.rocks>
Message-ID: <20170209213057.33fa79ba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Feb 2017 18:47:54 +0100, J?rg Krause wrote:

> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=64735

I've taken a part of your commit log, and added it as a comment here.

> +config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> +	bool

Instead of having this option selected by the architecture code, I've
added the relevant "default y" and "depends on" here. I believe it's
not worth spreading these selects all over the place.

Now that I write this, I realize I've written the logic in the wrong
way, I'll fix that up now.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
