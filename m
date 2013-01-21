From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 21 Jan 2013 08:14:24 +0100
Subject: [Buildroot] [PATCH 1/2] xapp_xinit: only makes sense if there
	is an X server
In-Reply-To: <87vcard2pf.fsf@dell.be.48ers.dk>
References: <1358677875-29889-1-git-send-email-arnout@mind.be>
 <87vcard2pf.fsf@dell.be.48ers.dk>
Message-ID: <50FCEAD0.4090809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/20/13 21:22, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>  writes:
>
>   Arnout>  From: "Arnout Vandecappelle (Essensium/Mind)"<arnout@mind.be>
>   Arnout>  Signed-off-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
>   Arnout>  ---
>   Arnout>   package/x11r7/xapp_xinit/Config.in |    2 ++
>   Arnout>   1 file changed, 2 insertions(+)
>
>   Arnout>  diff --git a/package/x11r7/xapp_xinit/Config.in b/package/x11r7/xapp_xinit/Config.in
>   Arnout>  index 9ac2817..30981c3 100644
>   Arnout>  --- a/package/x11r7/xapp_xinit/Config.in
>   Arnout>  +++ b/package/x11r7/xapp_xinit/Config.in
>   Arnout>  @@ -1,5 +1,7 @@
>   Arnout>   config BR2_PACKAGE_XAPP_XINIT
>   Arnout>   	bool "xinit"
>   Arnout>  +	# Runtime dependency: can't start an X server unless there is one
>   Arnout>  +	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
>
> XAPP_XDM selects XINIT, so I also added the dependency here and
> committed both patches, thanks.

  And xdm obviously doesn't make much sense without an X server...

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
