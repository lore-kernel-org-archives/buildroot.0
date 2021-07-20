From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 23:43:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/libcap: fix build with gcc 4.8
In-Reply-To: <20210720210134.90010-1-fontaine.fabrice@gmail.com>
References: <20210720210134.90010-1-fontaine.fabrice@gmail.com>
Message-ID: <20210720234318.0b48a884@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 20 Jul 2021 23:01:34 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with gcc 4.8 which is raised since bump
> to version 2.51 in commit bef89e381d0d698053a026d6a8cb0ded260bd074:
> 
> uns_test.c: In function 'main':
> uns_test.c:118:5: error: 'for' loop initial declarations are only allowed in C99 mode
>      for (int i=0; i<2; i++) {
>      ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9e67bdd540bb7779a13e27c55114a561c12b289a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...0001-Permit-compilation-with-std-c89.patch | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 package/libcap/0001-Permit-compilation-with-std-c89.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
