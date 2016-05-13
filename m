From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 22:40:01 +0200
Subject: [Buildroot] [v3] package/quagga: Fix directories and permissions
In-Reply-To: <1463129781-676-1-git-send-email-nroach44@gmail.com>
References: <1463129781-676-1-git-send-email-nroach44@gmail.com>
Message-ID: <20160513224001.2d6075f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 May 2016 16:56:21 +0800, Nathaniel Roach wrote:
> Quagga runs as the "quagga" user, but it also needs to modify files
> in /etc and /var - config files, pid files and vty sockets for vtysh.
> 
> Tell the configure script the right folders to use, create the
> user, fix the permissions, and then let systemd know (if needed).
> 
> Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
> 
> ---
> Changes v1 -> v2:
>  - Minor nits (Thomas)
>  - Add some comments about why permissions are changed as such

Applied to master, thanks. However, I still think that an init script
would be useful: the default for Buildroot is to use the Busybox init,
and as it is today, nothing is starting quagga and making sure
that /var/run/quagga is owned by the quagga user.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
