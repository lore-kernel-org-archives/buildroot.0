From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 13:55:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/apitrace: needs dynamic library
In-Reply-To: <20191224093212.585613-1-fontaine.fabrice@gmail.com>
References: <20191224093212.585613-1-fontaine.fabrice@gmail.com>
Message-ID: <20191224135510.24661eec@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 24 Dec 2019 10:32:12 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> apitrace uses dlfcn.h in lib/os/os_backtrace.cpp if _Unwind_Backtrace
> symbol is found in unwind.h. dlfcn.h is also used in 9 other source
> files
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4d60477cc46e4071dd3da21abfe7082e0d12cee2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/apitrace/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
