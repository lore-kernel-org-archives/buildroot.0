From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Thu, 09 May 2013 00:32:43 +0200
Subject: [Buildroot] [PATCH] toolchain/crosstool-NG: do not depend on
	the top-level Buildroot's .config
In-Reply-To: <1363644183-29242-1-git-send-email-yann.morin.1998@free.fr>
References: <1363644183-29242-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <8003334.zUx8i8rUNE@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Monday 18 March 2013 23:03:03 Yann E. MORIN wrote:
> Previously, the crosstool-NG backend did depend on the top-level
> Buildroot's .config to detect changes in the toolchain options,
> using a tentatively-clever heuristic, which also included the full
> Buildroot's version string to push down to set the components' versions
> strings.
> 
> In doing so, any commit in the Buildroot tree would imply a complete
> rebuild of the toolchain, even in the case the toolchain options did
> not change, thus being a large annoyance (to say the least).
> 
> As Buildroot never guaranteed that toolchain options would be detected,
> even less handled, and that the internal backend does neither detect nor
> act on toolchain options changes, and delegate that to the user, there
> is no point in individualising the crosstool-NG backend's behaviour.
> 
> This reasoning also applies to the depdency on the crosstool-NG's bundled
> .config file, too.
> 
> So, just drop the not-so-clever heuristic, and just build the toolchain
> once, leaving to the user the responsibility to explictly ask Buildroot
> to rebuild the toolchain.
Hmmm... I didn't followed all debate, and I am sorry if this suggestion has 
already been submitted but, why not depend on 
build/buildroot-config/br2/toolchain/ctng* ?

BR,

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
