From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Wed, 15 Feb 2012 17:54:05 +0100
Subject: [Buildroot] [RFC PATCH 6/6] apply-patches.sh: change archive
 management
In-Reply-To: <201202102348.08459.arnout@mind.be>
References: <1328492839-13657-1-git-send-email-ludovic.desroches@atmel.com>
 <76267ac6ba3ddac4379b9896f72875dedd455ebd.1328492511.git.ludovic.desroches@atmel.com>
 <201202102348.08459.arnout@mind.be>
Message-ID: <20120215165405.GJ4723@ldesroches-Latitude-E6320>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 10, 2012 at 11:48:08PM +0100, Arnout Vandecappelle wrote:
>    On Monday 06 February 2012 02:47:19 ludovic.desroches at atmel.com wrote:
> 
>    > scan_patchdir "${path}/$i"
> 
>    > + elif echo "$i" | grep -q -E
>    "tar\.bz$|tbz$|tar.\bz2$|tbz2$|tar\.gz$|tgz$" ; then
> 
>    Wouldn't '\.tar(\..*)?$|\.tbz2?$|\.tgz$' be a better pattern?
> 

Of course.

>    > + unpackedarchivedir="$builddir/.patches-$(basename $i)-unpacked"
> 
>    > + rm -rf "$unpackedarchivedir" 2> /dev/null
> 
>    > + mkdir "$unpackedarchivedir"
> 
>    > + if echo "$i" | grep "tar\.bz$|tbz$|tar\.bz2$|.tbz2$" ; then
> 
>    > + tar_options="-xjf"
> 
>    > + else
> 
>    > + tar_options="-xzf"
> 
>    > + fi
> 
>    You can also use tar -xaf, which selects compression automatically.
> 

Thanks for the tip.

Regards

Ludovic
