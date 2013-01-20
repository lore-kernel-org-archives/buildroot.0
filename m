From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 20 Jan 2013 21:22:36 +0100
Subject: [Buildroot] [PATCH 1/2] xapp_xinit: only makes sense if there
	is an X server
In-Reply-To: <1358677875-29889-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sun, 20 Jan 2013 11:31:14 +0100")
References: <1358677875-29889-1-git-send-email-arnout@mind.be>
Message-ID: <87vcard2pf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Arnout> ---
 Arnout>  package/x11r7/xapp_xinit/Config.in |    2 ++
 Arnout>  1 file changed, 2 insertions(+)

 Arnout> diff --git a/package/x11r7/xapp_xinit/Config.in b/package/x11r7/xapp_xinit/Config.in
 Arnout> index 9ac2817..30981c3 100644
 Arnout> --- a/package/x11r7/xapp_xinit/Config.in
 Arnout> +++ b/package/x11r7/xapp_xinit/Config.in
 Arnout> @@ -1,5 +1,7 @@
 Arnout>  config BR2_PACKAGE_XAPP_XINIT
 Arnout>  	bool "xinit"
 Arnout> +	# Runtime dependency: can't start an X server unless there is one
 Arnout> +	depends on BR2_PACKAGE_XSERVER_XORG_SERVER

XAPP_XDM selects XINIT, so I also added the dependency here and
committed both patches, thanks.

-- 
Bye, Peter Korsgaard
