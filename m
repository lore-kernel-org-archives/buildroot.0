From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 09 Feb 2011 18:50:17 -0300
Subject: [Buildroot] [PATCH 02/13] util-linux: convert to autotargets
 and bump to 2.18
In-Reply-To: <87bp2kkhhl.fsf@macbook.be.48ers.dk>
References: <1294431182-27793-1-git-send-email-gustavo@zacarias.com.ar>	<1294431182-27793-2-git-send-email-gustavo@zacarias.com.ar>
	<87bp2kkhhl.fsf@macbook.be.48ers.dk>
Message-ID: <4D530C19.3050407@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/09/2011 06:47 PM, Peter Korsgaard wrote:

> I think it would be good to mention to the user that he's not getting
> mount+fsck if he doesn't enable LARGEFILE, E.G.:
> 
> +comment "mount and fsck requires a toolchain with LARGEFILE support"
> +       depends on BR2_PACKAGE_UTIL_LINUX && !BR2_LARGEFILE

I'll look into it.


> It unfortunately doesn't build here if I enable largefile support. It
> dies with:
> 
> make[8]: *** No rule to make target `-luuid', needed by `libblkid.la'.  Stop.
> make[8]: *** Waiting for unfinished jobs....
>   CC     crc32.lo
>   CC     md5.lo
> make[7]: *** [all-recursive] Error 1
> make[6]: *** [../../../shlibs/blkid/src/libblkid.la] Error 2
> 
> It also seems like we always need host-pkg-config as a dep.
> 
> Could you take a look at it?

Did you apply the previous e2fsprogs patch? It's required for it to
export libbklid :)
Regards.
