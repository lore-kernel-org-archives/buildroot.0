From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Wed, 22 Mar 2017 11:21:27 +0100
Subject: [Buildroot] [PATCH v5 12/19] infra-libtool: no longer prepend
	STAGING_DIR to libdir
In-Reply-To: <6be103f5-9589-53a9-eab9-2c3edd52cd38@mind.be>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-13-git-send-email-jezz@sysmic.org>
 <6be103f5-9589-53a9-eab9-2c3edd52cd38@mind.be>
Message-ID: <2604949.Y0oF46Lp5o@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Anrout,

On Saturday 18 March 2017 16:37:31 CET Arnout Vandecappelle wrote:
>  Hi Jerome,
> 
> On 20-12-16 14:46, J?r?me Pouiller wrote:
> > Since `$lt_sysroot' is now correctly filled, it is no more necessary to patch
> > `.la' files. Indeed, if $libdir point to `/usr/lib', libtool will also search
> > in `$(lt_sysroot)/usr/lib'
> 
>  Unfortunately, not all packages that use libtool also use automake.

You mean autoconf? Do you have an example of this?

>  So some packages may die because of this.
>
>  That said, we should probably just fix these individual packages.

yes, I think it very unusual.


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
