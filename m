From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 22:06:02 +0200
Subject: [Buildroot] [PATCHv2] package/openssh: allow separate selection
 of client, server, keyutils
In-Reply-To: <20200504105552.15843-1-patrickdepinguin@gmail.com>
References: <20200504105552.15843-1-patrickdepinguin@gmail.com>
Message-ID: <20200509220602.595b66fa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  4 May 2020 12:55:52 +0200
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> The openssh package comprises three separate entities: the SSH client, SSH
> server, and some SSH key utilities. One may want the client but not the
> server, the server but not the client, or maybe only the key utilities.
> 
> Add separate options for each entity and update the files installed on
> target accordingly.
> 
> On an ARM Cortex-A53 configuration, size of stripped binaries are:
> 
> Client programs: 2213118 bytes (2161 KB)
> usr/bin/ssh,657180
> usr/bin/scp,99836
> usr/bin/ssh-add,312800
> usr/bin/ssh-agent,296428
> usr/libexec/ssh-keysign,398908
> usr/libexec/ssh-pkcs11-helper,292316
> usr/bin/sftp,144992
> usr/bin/ssh-copy-id,10658
> 
> Server programs: 806840 bytes (787 KB)
> usr/libexec/sftp-server,112140
> usr/sbin/sshd,694168
> etc/init.d/S50sshd,532
> 
> Key utilities: 789648 bytes (771 KB)
> usr/bin/ssh-keygen,398924
> usr/bin/ssh-keyscan,390724
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  package/openssh/Config.in  | 23 +++++++++++++++++++++++
>  package/openssh/openssh.mk | 36 ++++++++++++++++++++++++++++++++----
>  2 files changed, 55 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
