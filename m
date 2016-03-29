From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 29 Mar 2016 12:24:45 +0100
Subject: [Buildroot] [PATCH] toolchain-external: fix getent installation
 with Codescape MIPS toolchains
In-Reply-To: <1459172255-24556-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1459172255-24556-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56FA65FD.7040704@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 28/03/16 14:37, Thomas Petazzoni wrote:
> When a toolchain is glibc based, the getent package assumes that
> $(STAGING_DIR)/usr/bin contains the getent program. Unfortunately, the
> Codescape MIPS toolchains do not conform with this:
> $(STAGING_DIR)/usr/{bin,sbin} are empty, and instead three directories
> are provided: bin-o32, bin-n32 and bin-n64 (ditto for sbin), one for
> each supported MIPS ABI.
> 
> Since this is a toolchain-specific oddity, we handle it by adding a
> post-install fixup hook that creates $(STAGING_DIR)/usr/{bin,sbin} as
> symbolic link to the appropriate directory.
> 
> Fixes:
> 
>    http://autobuild.buildroot.org/results/9c0ee836021553319f166f9de88750535aee0a58/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Regards,

Vincent.
