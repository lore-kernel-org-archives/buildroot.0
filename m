From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Jan 2013 13:06:18 +0100
Subject: [Buildroot] Dropbear/SFTP
In-Reply-To: <002401cded96$e8b13fa0$ba13bee0$@co.uk>
References: <002401cded96$e8b13fa0$ba13bee0$@co.uk>
Message-ID: <20130108130618.4991dff7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ted Wood,

On Tue, 8 Jan 2013 11:54:25 -0000, Ted Wood wrote:
> I am attempting to remotely debug application code on  my i586 system from
> Eclipse.
> 
> I can login using SSH, however it stops saying that there is no SFTP server
> running on my target.
> 
> I've tried installing open-ssh, I presume I need to initaiate the SFTP
> server somehow, but I'm not sure how.

The subject of your e-mail suggests you've tried using Dropbear.
However, as you've probably noticed, Dropbear doesn't implement the
SFTP protocol, so it is not possible to use Dropbear as a SFTP server.

For now, the only option in Buildroot to get a SFTP server is to use
OpenSSH. Just enable the package, disable Dropbear, and do a full
rebuild of your Buildroot configuration. The Buildroot OpenSSH package
automatically installs an init script that will start OpenSSH at boot
time. Nothing special should be necessary.

If you're interested, notice that we are currently developing a Eclipse
plugin for Buildroot, which will help to build, remote execute and
remote debug applications in the context of Buildroot. The
documentation has not yet been fully written, but if you're interested,
please let me know so that we can give you the initial starting points.
We are very interested in getting some user feedback about those
developments.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
