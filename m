From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 23:07:48 +0100
Subject: [Buildroot] [PATCH] ghostscript: drop the ijs subfolder to fix
 build
In-Reply-To: <1490132895-7625-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490132895-7625-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170321230748.1dc6c624@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Mar 2017 22:48:15 +0100, Thomas Petazzoni wrote:
> The ijs/ subfolder contains a bogus ltmain.sh file, which is actually a
> broken symbolic link. Due to this, our logic to patch ltmain.sh files
> fail with some patch versions:
> 
>   >>> ghostscript 9.21 Patching libtool  
>   File /home/buildroot/build/instance-0/output/build/ghostscript-9.21/ijs/ltmain.sh is not a regular file -- refusing to patch
> 
> Since we are anyway not using the ijs support (--without-ijs is passed),
> do like we do for all other sub-components of ghostscript: get rid of
> the ijs/ subfolder completely.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/ca683d69b7fb564788c8877c3bb6466390e976a8/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/ghostscript/ghostscript.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
