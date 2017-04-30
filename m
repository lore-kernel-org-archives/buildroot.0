From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Apr 2017 23:02:35 +0200
Subject: [Buildroot] [PATCH v2] package/expedite: fix build issue with
 gcc < 5
In-Reply-To: <20170430102528.11476-1-romain.naour@gmail.com>
References: <20170430102528.11476-1-romain.naour@gmail.com>
Message-ID: <20170430230235.70b7ffc5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Apr 2017 12:25:28 +0200, Romain Naour wrote:
> The code use for loop initial declarations which are only allowed in
> C99 mode which is not the default C standard with gcc < 5.
> 
> This way of writing for loop was added by the latest commit and it is
> not consistent with the rest of the code.
> So revert to the C89 for loop syntax.
> 
> Reported upstream:
> https://phab.enlightenment.org/T5440
> 
> Fixes:
> http://autobuild.buildroot.net/results/ed8/ed840755e8e486e48eab8c13a8bb5e9a448199ce
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../0001-fix-build-failure-with-gcc-5.patch        | 289 +++++++++++++++++++++
>  1 file changed, 289 insertions(+)
>  create mode 100644 package/expedite/0001-fix-build-failure-with-gcc-5.patch

I'm not sure why you gave up on the -std=c99 solution, but OK, I've
applied this patch. We'll see what upstream suggests.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
