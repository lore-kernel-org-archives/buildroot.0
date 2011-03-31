From: Sergio Monteiro Basto <sergio@sergiomb.no-ip.org>
Date: Thu, 31 Mar 2011 22:38:22 +0100
Subject: [Buildroot] [PATCH 4/5] webkit: bump to version 1.2.7
In-Reply-To: <1299764675-23308-4-git-send-email-gustavo@zacarias.com.ar>
References: <1299764675-23308-1-git-send-email-gustavo@zacarias.com.ar>
	<1299764675-23308-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1301607502.26380.10.camel@segulix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 
About webkit, I found that we still can't compile it 
with uClibc 0.9.32-rc3 and Thread library implementation, linuxthreads
(stable/old) 

giving this error: 
JavaScriptCore/runtime/Collector.cpp: In function 'void*
JSC::currentThreadStackBase()':
JavaScriptCore/runtime/Collector.cpp:667: error: 'pthread_getattr_np'
was not declared in this scope
  CXX    JavaScriptCore/runtime/libJavaScriptCore_la-DateConstructor.lo

http://git.buildroot.net/buildroot/tree/package/webkit/webkit-pthread_getattr_np.patch
webkit-pthread_getattr_np.patch, is for uClibc <= 0.9.31, but should be
also applied if Thread library implementation is linuxthreads
(stable/old) on 0.9.32.

if I change for Native POSIX Threading (NPTL)
BR2_PTHREADS_NATIVE=y
I could compile webkit successfully  

hope that helps something,

On Thu, 2011-03-10@10:44 -0300, Gustavo Zacarias wrote: 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/webkit/webkit.mk |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
> index 6ab609b..f764eea 100644
> --- a/package/webkit/webkit.mk
> +++ b/package/webkit/webkit.mk
> @@ -4,7 +4,7 @@
>  #
>  #############################################################
>  
> -WEBKIT_VERSION = 1.2.6
> +WEBKIT_VERSION = 1.2.7
>  WEBKIT_SITE = http://www.webkitgtk.org
>  WEBKIT_INSTALL_STAGING = YES
>  WEBKIT_DEPENDENCIES = host-flex host-gperf icu libcurl libxml2 libxslt \

-- 
S?rgio M. B.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3309 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110331/5c250bef/attachment.bin>
