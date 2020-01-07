From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 7 Jan 2020 21:27:47 +0100
Subject: [Buildroot] [PATCH v2,
 2/2] package/leveldb: fix static build with -latomic
In-Reply-To: <20191227094000.374160-2-fontaine.fabrice@gmail.com>
References: <20191227094000.374160-1-fontaine.fabrice@gmail.com>
 <20191227094000.374160-2-fontaine.fabrice@gmail.com>
Message-ID: <20200107212747.63e8269b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 27 Dec 2019 10:40:00 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop workaround and use an upstreamable solution to link with -latomic
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/01d5a50581ac9e9b46f40e6f9665f74897db5e6f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...keLists.txt-check-for-atomic-library.patch | 49 +++++++++++++++++++
>  package/leveldb/leveldb.mk                    |  4 --
>  2 files changed, 49 insertions(+), 4 deletions(-)
>  create mode 100644 package/leveldb/0003-CMakeLists.txt-check-for-atomic-library.patch

Applied to master, thanks. Seems like a good approach that we should
probably use on other CMake-based packages.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
