From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Feb 2012 00:54:05 +0100
Subject: [Buildroot] [RFC PATCH v2 6/6] apply-patches.sh: change archive
	management
In-Reply-To: <1329347399-25541-1-git-send-email-ludovic.desroches@atmel.com>
References: <20120215165405.GJ4723@ldesroches-Latitude-E6320>
 <1329347399-25541-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <201202160054.05996.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 16 February 2012 00:09:59 ludovic.desroches at atmel.com wrote:
> From: Ludovic Desroches <ludovic.desroches@atmel.com>
> 
> The way archives were managed was incorrect because the uncompressed archives
> were sent directly to patch command. It means that alphabetical patch orderwas
> not respected.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> +	elif echo "$i" | grep -q -E "\.tar(\..*)?$|\.tbz2?$|\.tgz$" ; then
> +            unpackedarchivedir="$builddir/.patches-$(basename $i)-unpacked"
> +	    rm -rf "$unpackedarchivedir" 2> /dev/null

 Inconsistent whitespace.

> +	    mkdir "$unpackedarchivedir"
> +	    tar -C "$unpackedarchivedir" --strip-components=1 -xaf "${path}/$i"
> +	    scan_patchdir "$unpackedarchivedir"
>          else
>              apply_patch "$path" "$i" || exit 1
>          fi


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
