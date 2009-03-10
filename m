From: Robert Urban <urban@unix-beratung.de>
Date: Tue, 10 Mar 2009 10:36:32 +0100
Subject: [Buildroot] problems configuring libcurl
In-Reply-To: <87tz61aigp.fsf@macbook.be.48ers.dk>
References: <49B5BA80.5090103@unix-beratung.de>
	<87tz61aigp.fsf@macbook.be.48ers.dk>
Message-ID: <49B634A0.30600@unix-beratung.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Peter Korsgaard wrote:
>>>>>> "Robert" == Robert Urban <urban@unix-beratung.de> writes:
> 
>  Robert> Hi Folks,
>  Robert> i've enabled libcurl in svn-buildroot, but the configure-run fails with:
> 
>  Robert> configure: Added
>  Robert> /big/home/urban/Build/Buildroot/svn/buildroot/build_i586/staging_dir/usr/lib
>  Robert> to LD_LIBRARY_PATH
>  Robert> checking for inflateEnd in -lz... grep: error while loading shared
>  Robert> libraries: libc.so.0: cannot open shared object file: No such
>  Robert> file or directory
> 
> Are you building for the same architecture as your host? Are you also
> building grep? It seems like configure somehow picked up the target
> version of grep.

erm, yes and no.  The host is i686, target is i586.  I'm not building grep
explicitly.  It is, however, configured in busybox.  I don't think the
configure picked up the target grep. This is the error I get if I try to run
the target grep on the host:

-snip-
project_build_i586/robix/root/bin/grep
bash: project_build_i586/robix/root/bin/grep: /lib/ld-uClibc.so.0: bad ELF
interpreter: No such file or directory
-snip-

> Please post your .config

.config can be found at:

	http://www.spielwiese.de/rob/Buildroot/config

cheers,

Rob Urban
