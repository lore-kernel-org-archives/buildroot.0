From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Aug 2018 22:32:45 +0200
Subject: [Buildroot] [PATCH 1/1] boost: context needs thread without
 C++11 mutex
In-Reply-To: <20180818194725.5342-1-fontaine.fabrice@gmail.com>
References: <20180818194725.5342-1-fontaine.fabrice@gmail.com>
Message-ID: <20180818223245.1122b875@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Aug 2018 21:47:25 +0200, Fabrice Fontaine wrote:
> Extract from output/build/boost-1.67.0/libs/context/build/Jamfile.v2:
> 
> explicit cxx11_hdr_mutex_check ;
> local cxx11_mutex = [ check-target-builds
>       cxx11_hdr_mutex_check "C++11 mutex"
>     :
>     : <library>/boost/thread//boost_thread
>   ] ;
> 
> So select boost_thread if gcc <= 4.7
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/fb046c04fe18bec973d120e4ab33971f32ba5769
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
