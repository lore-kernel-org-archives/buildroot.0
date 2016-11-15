From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Nov 2016 23:33:47 +0100
Subject: [Buildroot] [PATCH v2 1/3] toolchain: workaround musl/kernel
 headers conflict
In-Reply-To: <b08117ad-6edc-245d-0650-0db5eb1775ce@mind.be>
References: <b2085612a223f59a2f7ef18a9bd97603226aa03d.1478784433.git.baruch@tkos.co.il>
 <b08117ad-6edc-245d-0650-0db5eb1775ce@mind.be>
Message-ID: <20161115233347.107fd31d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Nov 2016 22:33:31 +0100, Arnout Vandecappelle wrote:

>  However, if bridge-utils and norm are really the only packages that suffer from
> this problem, is it really worthwhile to apply this workaround?

I'm sure there are more packages that we have patched for this reason,
and possibly other build failures still unfixed that would get fixed
(or at least partially).

*However*, the musl folks have already committed a patch that
apparently resolves the problem:

   http://git.musl-libc.org/cgit/musl/commit/?id=04983f2272382af92eb8f8838964ff944fbb8258

Baruch, could you investigate whether this musl commit fixes the header
conflict problem for bridge-utils and norm?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
