From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 23:43:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/darkhttpd: fix build with gcc
 4.8
In-Reply-To: <20210720205408.84155-1-fontaine.fabrice@gmail.com>
References: <20210720205408.84155-1-fontaine.fabrice@gmail.com>
Message-ID: <20210720234311.3b4b0aa7@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 20 Jul 2021 22:54:08 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure which is raised since bump to version
> 0.13 in commit 88705a8c248e566f2c9ca71a8ee5353b33e368c2:
> 
> darkhttpd.c:966:5: error: 'for' loop initial declarations are only allowed in C99 mode
>      for (int i = 0, j = 0; i < input_length;) {
>      ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ffc/ffcb627c44d2b7202d641129b67af2dc7865c618/build-end.log
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...vars-outside-of-for-loop-for-std-c90.patch | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/darkhttpd/0001-Declare-vars-outside-of-for-loop-for-std-c90.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
