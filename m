From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 23:26:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/beecrypt: fix build without C++
In-Reply-To: <20190301201818.24561-1-fontaine.fabrice@gmail.com>
References: <20190301201818.24561-1-fontaine.fabrice@gmail.com>
Message-ID: <20190314232641.6d4cf981@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  1 Mar 2019 21:18:18 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Do not check for C++ compiler as C++ support has been disabled since
> commit dd4d3c18d6753e1224fbe59d91a4b44f39bc38c0 otherwise
> build will fail on toolchains without a working C++ compiler:
> 
> checking how to run the C++ preprocessor... /lib/cpp
> configure: error: in `/data/buildroot/buildroot-test/instance-1/output/build/beecrypt-4.2.1':
> configure: error: C++ preprocessor "/lib/cpp" fails sanity check
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3c79cc68f1b088ad24daf7f9bd70718d702be577
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0003-don-t-check-for-cplusplus-compiler.patch  | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 package/beecrypt/0003-don-t-check-for-cplusplus-compiler.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
