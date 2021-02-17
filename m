From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 08:15:34 +0100
Subject: [Buildroot] [PATCH] package/ebtables: install symlink to
 ebtables-legacy
In-Reply-To: <20210216115802.32317-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Tue, 16 Feb 2021 12:58:01 +0100")
References: <20210216115802.32317-1-patrickdepinguin@gmail.com>
Message-ID: <8735xv5fmx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Since the upgrade of ebtables from 2.0.10-4 to 2.0.11, there no longer is an
 > 'ebtables' binary. It has been renamed to 'ebtables-legacy' and moved from
 > '/sbin' to '/usr/sbin'. This change is part of the upstream change to
 > integrate the functionality of ebtables (and arptables) in the iptables
 > package, using the nf_tables kernel backend [1].

 > Unfortunately, the renaming (and move) of the original 'ebtables' binary
 > breaks existing scripts that are calling 'ebtables' or '/sbin/ebtables'.
 > Therefore, add a symlink from the original path to 'ebtables-legacy'.

 > However, do not provide this symlink if BR2_PACKAGE_IPTABLES_NFTABLES is
 > enabled. In this case, the iptables package will build the new equivalent
 > of ebtables -- a symlink to ebtables-legacy would cause conflicts.

 > [1] https://wiki.nftables.org/wiki-nftables/index.php/Legacy_xtables_tools

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
