From: Ralph Siemsen <ralphs@netwinder.org>
Date: Fri, 13 Jul 2007 11:23:16 -0400
Subject: [Buildroot] [CFT,PATCH] bump openssh version
In-Reply-To: <20070707100037.GL4096@aon.at>
References: <20070707100037.GL4096@aon.at>
Message-ID: <20070713152316.GB26801@marvin.netwinder.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 07, 2007 at 12:00:38PM +0200, Bernhard Fischer wrote:
> Hi,
> 
> Can you please test the attached patch which bumps the version of ssh
> and report back?
> 
> TIA,

Patch required minor massaging against current SVN to apply.
(Seems there was some cleaning of *_SITE and *_VERSION variables).

Builds ok for powerpc cross-compiler target.

Very quick testing, the executables do run on the target, and
I can establish ssh connections and transfer files with scp.

However one oddity, if I run with no arguments or --version,
I get a segmentation fault.  I haven't looked into this...

[root at mybox /tmp]# ./ssh
usage: ssh [-1246AaCfgkMNnqsTtVvXxY] [-b bind_address] [-c cipher_spec]
           [-D [bind_address:]port] [-e escape_char] [-F configfile]
           [-i identity_file] [-L [bind_address:]port:host:hostport]
           [-l login_name] [-m mac_spec] [-O ctl_cmd] [-o option] [-p port]
           [-R [bind_address:]port:host:hostport] [-S ctl_path]
           [-w local_tun[:remote_tun]] [user@]hostname [command]
Segmentation fault
[root at mybox /tmp]# ./scp
usage: scp [-1246BCpqrv] [-c cipher] [-F ssh_config] [-i identity_file]
           [-l limit] [-o ssh_option] [-P port] [-S program]
           [[user@]host1:]file1 [...] [[user@]host2:]file2
Segmentation fault


The binaries from the "previous" version work fine though:

[root at mybox /tmp]# /usr/bin/scp
usage: scp [-1246BCpqrv] [-c cipher] [-F ssh_config] [-i identity_file]
           [-l limit] [-o ssh_option] [-P port] [-S program]
           [[user@]host1:]file1 [...] [[user@]host2:]file2
[root at mybox /tmp]# /usr/sbin/ssh
usage: ssh [-1246AaCfghkMNnqsTtVvXxY] [-b bind_address] [-c cipher_spec]
           [-D port] [-e escape_char] [-F configfile] [-i identity_file]
           [-L port:host:hostport] [-l login_name] [-m mac_spec] [-o option]
           [-p port] [-R port:host:hostport] [-S ctl] [user@]hostname [command]

-R.
