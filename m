From: Paul Jones <paul.jones@iwtech.com.au>
Date: Tue, 30 Mar 2010 07:36:57 +1100
Subject: [Buildroot] [PATCH] Bump libdrm to 2.4.14
In-Reply-To: <87bpe7chkp.fsf@macbook.be.48ers.dk>
References: <1269849170-13244-1-git-send-email-paul@pauljones.id.au>
	<87bpe7chkp.fsf@macbook.be.48ers.dk>
Message-ID: <4BB10F69.9070107@iwtech.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/03/2010 1:45 AM, Peter Korsgaard wrote:
>>>>>> "Paul" == Paul Jones<paul@pauljones.id.au>  writes:
>>>>>>              
>   Paul>  Also adds proper dependency information to stop build errors.
>   Paul>  Signed-off-by: Paul Jones<paul@pauljones.id.au>
>   Paul>  ---
>   Paul>   package/libdrm/Config.in |    6 ++++++
>   Paul>   package/libdrm/libdrm.mk |    4 +++-
>   Paul>   2 files changed, 9 insertions(+), 1 deletions(-)
>
>   Paul>  diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
>   Paul>  index 3d8a731..e1d35ad 100644
>   Paul>  --- a/package/libdrm/Config.in
>   Paul>  +++ b/package/libdrm/Config.in
>   Paul>  @@ -1,5 +1,11 @@
>   Paul>   config BR2_PACKAGE_LIBDRM
>   Paul>   	bool "libdrm"
>   Paul>  +	select BR2_PACKAGE_XPROTO_GLPROTO
>   Paul>  +	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
>   Paul>  +	select BR2_PACKAGE_XLIB_LIBXXF86VM
>   Paul>  +	select BR2_PACKAGE_XLIB_LIBXMU
>   Paul>  +	select BR2_PACKAGE_XPROTO_DRI2PROTO
>   Paul>  +	select BR2_PACKAGE_PTHREAD_STUBS
>
> That won't work unless we make libdrm depend on the X stuff, as those
> packages are only available when BR2_PACKAGE_XORG7 is enabled - E.G.:
>
> make: *** No rule to make target `xproto_glproto', needed by `libdrm-depends'.  Stop.
>
> Care to fix?
>    
I should have put a "depends on BR2_PACKAGE_XORG7" in there, as that's 
the first thing that's listed under dependencies on the libdrm website. 
There was something in my configuration that selected libdrm when I 
enabled X so I'll dig around and see if I can make it work better.
