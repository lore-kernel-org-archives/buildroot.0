From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 4 Oct 2015 18:58:36 +0100
Subject: [Buildroot] [PATCH v3 1/1] linux: add config options for
 nfs-utils
In-Reply-To: <1436886176-118956-1-git-send-email-ryan.barnett@rockwellcollins.com>
References: <1436886176-118956-1-git-send-email-ryan.barnett@rockwellcollins.com>
Message-ID: <561168CC.9070106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14-07-15 16:02, Ryan Barnett wrote:
> When nfs-utils packages is selected, automatically enable the kernel
> options for NFSD. This will allow for an NFS server to work by only
> adding /etc/exports to the filesystem.
> 
> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>

 Hi Ryan,

 I've marked your patch as Rejected in patchwork. We don't want to add automatic
kernel config fiddling unless really needed for either building (e.g.
xtables-addons builds a kernel module that requires specific functions) or for
booting (e.g. systemd, ARM ABI).

 In addition, in this particular case, it's possible that someone enables
nfs-utils just to be able to run rpc.statd in a nfs client that requires locking.

 So instead, we think it's better to update the nfs-utils help test to mention
the Kconfig options that have to be enabled to have an NFS server.

 Sorry that it had to come to a v3 and several months later before coming to
such a conclusion.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
