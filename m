From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 10:50:33 +0100
Subject: [Buildroot] [PATCH 1/1] libgeotiff: fix build without C++
In-Reply-To: <20190203223524.19304-1-fontaine.fabrice@gmail.com>
References: <20190203223524.19304-1-fontaine.fabrice@gmail.com>
Message-ID: <20190204105033.00be968e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  3 Feb 2019 23:35:24 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Do not check for C++ compiler as libgeotiff is written in C otherwise
> build will fail on toolchains without a working C++ compiler:
> 
> checking how to run the C++ preprocessor... /lib/cpp
> configure: error: in
> `/data/buildroot/buildroot-test/instance-1/output/build/libgeotiff-1.4.2':
> configure: error: C++ preprocessor "/lib/cpp" fails sanity check
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/72f1c5c1b8fc337a1cff4b280abe99afd65f945b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ibgeotiff-configure.ac-do-not-check-for-C.patch | 65 ++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 package/libgeotiff/0003-libgeotiff-configure.ac-do-not-check-for-C.patch

Applied to master, thanks. Please use "package/<foo>" as package prefix
for commit titles.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
