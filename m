From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 21:52:00 +0200
Subject: [Buildroot] [PATCH] package/gnuradio: fix build with boost
 1.73.0
In-Reply-To: <20200619044120.1879706-1-gwenj@trabucayre.com>
References: <20200619044120.1879706-1-gwenj@trabucayre.com>
Message-ID: <20200620215200.6c0525e3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 19 Jun 2020 06:41:20 +0200
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Since commit:
> 194997a3c86eba25dd0e93fd86038881cf010fe0 "package/boost: bump version to 1.73.0"
> gnuradio fail to build with error like:
> 
> autobuild/instance-2/output-1/build/gnuradio-3.8.1.0/gnuradio-runtime/lib/block.cc: In constructor 'gr::block::block(const string&, gr::io_signature::sptr, gr::io_signature::sptr)':
> autobuild/instance-2/output-1/build/gnuradio-3.8.1.0/gnuradio-runtime/lib/block.cc:64:78: error: '_1' was not declared in this scope
>      set_msg_handler(d_system_port, boost::bind(&block::system_handler, this, _1));
> 
> This is due to a missing namespace.
> 
> backport Pull Request https://github.com/gnuradio/gnuradio/pull/3566
> 
> Fix:
> - http://autobuild.buildroot.net/results/234f5f472bb4618b8e7375ba7025d759fa60dc0e/
> - http://autobuild.buildroot.net/results/fa695835d7499fcf2aed505df60541fb821dad8d/
> - http://autobuild.buildroot.net/results/f999fb4a31597a26b0e80cdf008d528b997f12e9/
> - http://autobuild.buildroot.net/results/54571b286b9ee9d940f80ebe7c23f7c1f15cacc2/
> - http://autobuild.buildroot.net/results/91dbee7fc4cbccf82b58ebe74f9e09960fd8a48c/
> - http://autobuild.buildroot.net/results/7139ef951d0c2f4d3f6d5a68f673adceda5f1dd6/
> - http://autobuild.buildroot.net/results/f7aa8b06ffb11072456b550250ba3ef8f0e18dcc/
> - http://autobuild.buildroot.net/results/8677cefcd63c091a040e6ebc3eb54c04ff493371/
> - http://autobuild.buildroot.net/results/cf6e222252263fea6da9a5c9b3ca7841d7bf7102/
> - http://autobuild.buildroot.net/results/eea8055999e8336ff3f8b25db60d066a52a5dacf/
> - http://autobuild.buildroot.net/results/55e5a75f82a4e241a36caebb0f1b9cd7560da78e/
> 
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  ...aceholders_with_their_full_namespace.patch | 1025 +++++++++++++++++
>  1 file changed, 1025 insertions(+)
>  create mode 100644 package/gnuradio/0002-boost_qualify_placeholders_with_their_full_namespace.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
