From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sat, 01 Aug 2015 08:37:25 +0200
Subject: [Buildroot] [PATCH v7 1/1] package/swupdate: new package
In-Reply-To: <55BBE9BA.1060603@openwide.fr>
References: <1437160940-11930-1-git-send-email-joerg.krause@embedded.rocks>
 <55B7B009.1080202@openwide.fr> <1438373661.26917.11.camel@embedded.rocks>
 <55BBE9BA.1060603@openwide.fr>
Message-ID: <1438411045.3049.5.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fr, 2015-07-31 at 23:33 +0200, Romain Naour wrote:
> Hi J?rg,
> 
> IIUC, the swupdate-menuconfig will not display some options if 
> corresponding
> dependencies are not meet. This is great!

You understand correctly :-)

> 
> But what do you think about a comment in the swupdate Kconfig ?
> Something like (untested):
> 
> config DOWNLOAD
> 	bool "Enable image downloading"
> 	default n
> 	depends on HAVE_LIBCURL
> 	help
> 	  Enable update from image URL using libcurl. Files are 
> downloaded
> 	  completely before installation begins.
> 
> comment "image downloading needs libcurl"
> 	depends on !HAVE_LIBCURL

Yes, this would be helpful indeed and I already thought about this,
too. I will help to add this to upstream.

Best regards
J?rg Krause
