From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Sep 2017 21:12:10 +0200
Subject: [Buildroot] [PATCH v2] coreutils: use single binary in symlink
 method, with merged usr
In-Reply-To: <1506536724-10603-1-git-send-email-casantos@datacom.ind.br>
References: <1506529411-26172-1-git-send-email-casantos@datacom.ind.br>
 <1506536724-10603-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20170927211210.11b92316@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Sep 2017 15:25:24 -0300, Carlos Santos wrote:
> The symlink method is faster, since there is no shell fork/exec, and
> provides extra space savings. Keep using the shebang method without
> merged usr, because it makes easier to move binaries into other
> directories.

I'm not sure why we would want to make a difference between merged /usr
and non-merged /usr. Is the shebang method really useful/interesting?
Busybox is using symlinks, and that is just fine. Why not do the same
for coreutils?

In addition, having too many differences between merged /usr and
non-merged /usr is a test/maintenance burden.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
