From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 16 Mar 2012 22:43:06 +0100
Subject: [Buildroot] [PATCH] boost: Add coment when C++ is missing
In-Reply-To: <201203032100.05495.thammi@chaossource.net> (Stephan Thamm's
 message of "Sat, 3 Mar 2012 21:00:05 +0100")
References: <201203021952.03453.thammi@chaossource.net>
 <201203031512.11130.arnout@mind.be>
 <201203032100.05495.thammi@chaossource.net>
Message-ID: <87wr6knrx1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephan" == Stephan Thamm <thammi@chaossource.net> writes:

 Stephan> Signed-off-by: Stephan Thamm <thammi@chaossource.net>

Thanks, committed with a small fix.

Your mailer had converted tabs to spaces, so I had to apply
manually. Consider using 'git send-email' next time to not have those
problems.

 Stephan> ---
 Stephan>  package/boost/Config.in |    3 +++
 Stephan>  1 files changed, 3 insertions(+), 0 deletions(-)

 Stephan> diff --git a/package/boost/Config.in b/package/boost/Config.in
 Stephan> index 7598d02..eac91dc 100644
 Stephan> --- a/package/boost/Config.in
 Stephan> +++ b/package/boost/Config.in
 Stephan> @@ -8,6 +8,9 @@ config BR2_PACKAGE_BOOST
 
 Stephan>           http://www.boost.org/
 
 Stephan> +comment "boost requires a toolchain with C++ support enabled"
 Stephan> +       depends on !BR2_INSTALL_LIBSTDCPP
 Stephan> +
 Stephan>  if BR2_PACKAGE_BOOST

The comment has to go above the main BR2_PACKAGE_BOOST, otherwise
menuconfig won't indent the BR2_PACKAGE_BOOST_* options under boost.

-- 
Bye, Peter Korsgaard
