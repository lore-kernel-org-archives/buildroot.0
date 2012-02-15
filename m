From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Feb 2012 21:55:08 +0100
Subject: [Buildroot] Illegal instruction Built bcc
In-Reply-To: <4F3BF8DC.6080608@labri.fr>
References: <4F3BF8DC.6080608@labri.fr>
Message-ID: <201202152155.08608.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 15 February 2012 19:26:36 Jigar SOLANKI wrote:
> Hi all,
> 
> I'm trying to compile and run :
> 
> #include <stdlib.h>
> 
> int main(){
> 	return 0
> }
> 
> on a Leon3/Sparc+Linux architecture.
> 
> When I compile it with the toolchains binaries provided by Gaisler, it
> works well (sparc-linux-gcc) it works well
> Whereas when I compile it with a toolchain that I have built using the
> BCC sources, I get an illegal instruction when trying to run it.
> 
> 
> Where does that come from please ?

 Most likely you configured buildroot for a subarchitecture that is not
supported by your platform.  You can run the working cross-compiler with
the -v option; in the long list of configure options you'll see something
like '--with-cpu=sparcsfleon'.  That is the subarchitecture you should
use for buildroot too.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120215/26966dd3/attachment-0001.html>
