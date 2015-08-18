From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 21:05:52 +0200
Subject: [Buildroot] [PATCH] webkitgtk24: fix MIPS64 n64 ABI detection
In-Reply-To: <1439920042-58593-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1439920042-58593-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150818210552.35243fc2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 18 Aug 2015 18:47:22 +0100, Vicente Olivert Riera wrote:
> webkitgtk24 is failing to compile for MIPS64 n64 because the ABI is not
> detected correctly. It causes failures like these ones:
> 
> ./Source/JavaScriptCore/runtime/JSCJSValueInlines.h:201:53: error: cast
> from 'JSC::JSCell*' to 'int32_t {aka int}' loses precision
> [-fpermissive]
> 
> [snip]
> 
> ./Source/WTF/wtf/StdLibExtras.h:137:5: error: static assertion failed:
> bitwise_cast size of FromType and ToType must be equal!
> 
> Bug report:
> 
>   https://bugs.webkit.org/show_bug.cgi?id=145113
> 
> Upstream patch:
> 
>   http://trac.webkit.org/changeset/185863
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/0d5/0d56a5bf6e92e7344dcee7acb85e176198f703e7/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  ...m.h-use-_ABI64-instead-of-_MIPS_SIM_ABI64.patch |   46 ++++++++++++++++++++
>  1 files changed, 46 insertions(+), 0 deletions(-)
>  create mode 100644 package/webkitgtk24/0002-WTF-Platform.h-use-_ABI64-instead-of-_MIPS_SIM_ABI64.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
