From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 20:19:56 +0100
Subject: [Buildroot] [PATCH v2 1/1] gnuradio: fix compilation with
 cmake-3.5
In-Reply-To: <1458646304-339-1-git-send-email-gwenj@trabucayre.com>
References: <1458646304-339-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20160322201956.2e45ec0e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Mar 2016 12:31:44 +0100, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Volk is a submodule of gnuradio, consequently PROJECT_{BINARY,SOURCE}_DIR must
> be used instead of CMAKE_{BINARY,SOURCE}_DIR.
> 
> Patch backported from https://github.com/gnuradio/volk/pull/65
> 
> fix:
> 
> http://autobuild.buildroot.net/results/9a2c5ba503345d2d295b943776882c33f4f0f1d9/
> http://autobuild.buildroot.net/results/17d1292adaaca5025bffb42191d9b2172246a514/
> http://autobuild.buildroot.net/results/71f97ac20ea41a66daaadea5738b636bc45e805c/
> http://autobuild.buildroot.net/results/0277af68c363af733c3e6f3197d3ef97597c5d7b/
> http://autobuild.buildroot.net/results/ad5bccd2c4496859824f84327038eba5f6206d97/
> http://autobuild.buildroot.net/results/f3dc0c224174cd8beddeaa8ea089320ddff621b5/
> http://autobuild.buildroot.net/results/8b79a1e597d5f3f73d0534e90523692c6b8a18d2/
> http://autobuild.buildroot.net/results/c0ee1bf791618da28e9faec9db30e7114475f211/
> http://autobuild.buildroot.net/results/b44383ca61e1a235ba2be0f2d2e47ced7391798a/
> http://autobuild.buildroot.net/results/ddee04bf8c477fb8ae6fe7f15b112485797dd96e/
> 
> fix partially :
> 
> http://autobuild.buildroot.net/results/33748edd3555296c1d8a8b49c83bca6003781993/
> http://autobuild.buildroot.net/results/eb099fcfc5f98daa9c06e24d45dbc97df19b0d4f/
> http://autobuild.buildroot.net/results/4469c2ba7e4611c7841ebac980a2fb17720b0433/
> http://autobuild.buildroot.net/results/71960b94efdfc3c00990315ceac9b6e871a1f076/
> http://autobuild.buildroot.net/results/a40486033a535dd11a90eceec80b41fd350bb394/
> http://autobuild.buildroot.net/results/415d8475aadfd2bdd8feeac973c11b51b0bd1f80/
> http://autobuild.buildroot.net/results/11024182df6b604d558cba07f2f3898edcdf5a06/
> http://autobuild.buildroot.net/results/c6c1bb98eb42ee1d23183e275ea02343b5753846/
> http://autobuild.buildroot.net/results/046a0ecc4b6b0d6df60b4ce3e279123e1c15123f/
> http://autobuild.buildroot.net/results/6cc844e7bd7761e2238f55989e71520b91dd2a9f/
> http://autobuild.buildroot.net/results/c958d9a11a3ec1c6c3a5792193c3b0df0529c812/
> http://autobuild.buildroot.net/results/c3f186ebfef53e60dc2c4c7c8a27e6b3771f001a/
> http://autobuild.buildroot.net/results/1399e81c32ea60f9ba37e9b5c1e6bf07541fba81/
> http://autobuild.buildroot.net/results/8e038ac8b6e43abc4c7d437f267e497d7f808926/
> http://autobuild.buildroot.net/results/f7b4fb5d8a65ecf45361cded2572eaeba1ea4302/
> http://autobuild.buildroot.net/results/aa08901dfd81f6845dc632462bc32d921130c6b1/
> http://autobuild.buildroot.net/results/30d4322e0a9fc3d8b04c1ad779e63cf17196fd5c/
> http://autobuild.buildroot.net/results/1402de7f2d7ab36bf92cf5abdcb7ae90f0d13604/
> http://autobuild.buildroot.net/results/5b644a88f457a8c5dda7961c8ae8b7299a774e8f/
> http://autobuild.buildroot.net/results/c264cc6a5266b2703e58e0222f5b79d67ca3d450/
> http://autobuild.buildroot.net/results/6b5cbf50a9c7c1f275ad876c77892c72358f23b5/
> http://autobuild.buildroot.net/results/8ee3626e2523032218e17d9e6644403e64768f2d/
> http://autobuild.buildroot.net/results/ae330a15a579b0d26d801ebbeaa1abcd896df177/
> http://autobuild.buildroot.net/results/c814797698adb4bba7044c2edbe0ca3655d94fd5/
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
> Changes v1 -> v2:
>  * add a signed-off; 
>  * format patch with git.
> ---
>  .../0002-fix_cmake_3_5_0_build_failure.patch       | 175 +++++++++++++++++++++
>  1 file changed, 175 insertions(+)
>  create mode 100644 package/gnuradio/0002-fix_cmake_3_5_0_build_failure.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
