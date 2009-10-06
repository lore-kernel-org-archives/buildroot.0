From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Tue, 6 Oct 2009 17:13:33 -0400
Subject: [Buildroot] [PATCH 1/6] atmel mirrors are only needed for
	atmeltargets
In-Reply-To: <87fx9w1bbc.fsf@macbook.be.48ers.dk>
References: <cover.1254853146.git.rep.dot.nop@gmail.com><cover.1254853146.git.rep.dot.nop@gmail.com><1a6b4f990a536bfd23ae1e57a2cd11527761f8ec.1254853146.git.rep.dot.nop@gmail.com>
	<87fx9w1bbc.fsf@macbook.be.48ers.dk>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901DB7951@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, October 06, 2009 2:07 PM, Peter Korsgaard wrote:
> Bernhard>  	  Usually, just add your country code like XX here:
> Bernhard>  	  http://ftp.XX.debian.org
> Bernhard> -
> Bernhard> +if BR2_TARGET_ATMEL
> Bernhard>  source	"target/device/Atmel/Config.in.mirrors"
> Bernhard> -
>
> Committed, thanks!

Hello Peter,

Shouldn't there be a whitespace line before the 'if' and after the 'endif'?
The end of Config.in.mirrors now looks like this:

config BR2_DEBIAN_MIRROR
	string "Debian Software mirror"
	default "http://ftp.debian.org"
	help
	  Debian has multiple software mirrors scattered around the world.
	  The following allows you to select your preferred mirror.

	  Usually, just add your country code like XX here:
	  http://ftp.XX.debian.org
if BR2_TARGET_ATMEL
source	"target/device/Atmel/Config.in.mirrors"
endif
endmenu

At first glance it looks like everything at the end goes with
'config BR2_DEBIAN_MIRROR'.

Regards,
Hartley
