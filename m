From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 21:50:14 +0200
Subject: [Buildroot] [PATCH v3,1/1] boost: context needs C++11
In-Reply-To: <20180821212547.14690-1-fontaine.fabrice@gmail.com>
References: <20180821212547.14690-1-fontaine.fabrice@gmail.com>
Message-ID: <20181010215014.34129a2b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Aug 2018 23:25:47 +0200, Fabrice Fontaine wrote:
> Without std=c++11, mutex is not always correctly detected with gcc 4.7,
> 4.8 or even 5.x. As a result, boost_thread is wrongly selected by
> boost_context.
> 
> mutex is available on gcc 4.7.x, the issue is that boost does not
> correctly detect it because -std=c++11 was missing.
> Keep thread select for gcc version lower or equal to 4.6. mutex is
> available since gcc 4.4 (with std=c++0x) but common buildroot practice
> for C++11 packages is to have a dependency on gcc 4.7, 4.8 or 4.9
> depending on the requested C++11 features.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/fb046c04fe18bec973d120e4ab33971f32ba5769
>  - http://autobuild.buildroot.net/results/99f1a255b78a973faeb8bf3b94d78efc54426a8b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3 (after review of Thomas Petazzoni):
>  - Merge both patches
>  - Update commit message

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
