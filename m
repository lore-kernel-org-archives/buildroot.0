From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Oct 2017 23:25:46 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/prosody: new package
In-Reply-To: <1506809583-5300-1-git-send-email-nidujay@gmail.com>
References: <1505132302-20308-1-git-send-email-nidujay@gmail.com>
 <1506809583-5300-1-git-send-email-nidujay@gmail.com>
Message-ID: <20171012232546.17fea5cb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Oct 2017 09:13:03 +1100, Dushara Jayasinghe wrote:
> As stated by the upstream developers, Prosody only supports
> lua-5.1 or luajit (which is a lua-5.1 interpreter):
> 
> > Response from zash at zash.se:
> >  
> >> I pegged the package to lua 5,1 based on the contents of the
> >> INSTALL file. Is this a hard requirement?  
> >
> > Up until Prosody 0.9 Lua 5.1 is required. However LuaJIT
> > implements Lua 5.1 so it works.  
> 
> The license terms are not very consistent: the source files all
> state to be "MIT/X11 licensed" and defer to the COPYING file for
> details, but that file only has the text for the MIT license.
> Thus, we believe the license to be MIT/X11, as stated in the source
> files.
> 
> This installs the base system with certificates for two domains:
> localhost and example.com
> 
> The default runtime configuration is tweaked during installation
> to properly setup logging and pid-file directories.
> 
> Prosody doesn't like being executed as root, and thus the daemon
> is executed as the user prosody. The startup script creates the
> pid file write location with appropriate permissions.
> 
> Signed-off-by: Dushara Jayasinghe <nidujay@gmail.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> Chanes v2 -> v3:
>   - Create prosody group for patch file
>   - Use pidfile in service termination
>   - Remove superfluous _SOURCE line (Suggested by Yann E. Morin)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
