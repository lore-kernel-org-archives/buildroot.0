From: Joel Carlson <joelsoncarl@gmail.com>
Date: Mon, 11 Jun 2018 13:54:04 -0600
Subject: [Buildroot] [PATCH] flatcc: fix build with gcc 8
In-Reply-To: <0cccebf8e88b355751c465a74916eef6edecb090.1528655298.git.baruch@tkos.co.il>
References: <0cccebf8e88b355751c465a74916eef6edecb090.1528655298.git.baruch@tkos.co.il>
Message-ID: <CAAjKBV8M0WE6VdP06zRSgjXQCiVH+HwgGbNAP8iZxd6U7ttQVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

Thanks for making this - it is a better solution to use the actual
commit from upstream than what I previously submitted.

On Sun, Jun 10, 2018 at 12:28 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> gcc 8 enables a strncpy() warning. This breaks the build of flatcc that
> enables -Werror. Add upstream patch fixing the issue.
>
> Fixes:
> http://autobuild.buildroot.net/results/0e3/0e3a959855fad5899db184f7d2c960c89df03672/
> http://autobuild.buildroot.net/results/d2c/d2c03bc253bdf135b0f31f3d1e6fd33f7d37d64b/
> http://autobuild.buildroot.net/results/163/1636ec6ddad92add95f42451d941156451c6d936/
>
> Cc: Joel Carlson <JoelsonCarl@gmail.com>
> Cc: Mikkel Fahn?e J?rgensen <mikkel@dvide.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Reviewed-by: Joel Carlson <JoelsonCarl@gmail.com>
Tested-by: Joel Carlson <JoelsonCarl@gmail.com>

I did a compile-test with i386 and aarch64 using a buildroot gcc 8.1.0
toolchain.
