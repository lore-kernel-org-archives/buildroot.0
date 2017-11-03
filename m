From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Nov 2017 18:50:01 +0100
Subject: [Buildroot] [PATCH 1/1] boost: fix fiber module without flag
In-Reply-To: <20171103132750.19364-1-aduskett@gmail.com>
References: <20171103132750.19364-1-aduskett@gmail.com>
Message-ID: <20171103185001.3144471e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Nov 2017 09:27:50 -0400, Adam Duskett wrote:
> BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FILESYSTEM),,fiber) needs to be
> BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FIBER),,fiber) which was
> causing the following build errors:
> http://autobuild.buildroot.net/results/c8b/c8b58bf37b565e7a4dd7959e0d9c1cec993758ba/build-end.log
> http://autobuild.buildroot.net/results/df6/df6f9d51ee766a6f8fca986cdc7476d148dad53e/build-end.log
> http://autobuild.buildroot.net/results/fec/fecc16df052ac5b14d3b15e174c7026dfcc8fd33/build-end.log
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/boost/boost.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, after improving the commit log. See
https://git.buildroot.org/buildroot/commit/?id=1e559557ac713707c6160da3facf251476f99925
for the commit log I pushed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
