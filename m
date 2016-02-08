From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Feb 2016 17:57:03 +0100
Subject: [Buildroot] [PATCH 1/1] skeleton: Rename /etc/profile.d/umask
 to umask.sh
In-Reply-To: <2274825.xfSUNdnLFA@hardbit>
References: <1454946165-8192-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <20160208172509.2e68a8ba@free-electrons.com>
 <2274825.xfSUNdnLFA@hardbit>
Message-ID: <20160208175703.5be67c72@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 08 Feb 2016 17:45:10 +0100, Thomas Claveirole wrote:

> Beware of backup files.  Such directories often end-up with ~-
> terminated files (e.g., foobar~ after one edited foobar) and this 
> often cause hard-to-detect bugs because of obsolete files being 
> sourced.
> 
> If not relying on a common suffix, maybe you should use the same rules 
> as Debian's run-parts?  These are:
> 
> If  neither  the --lsbsysinit option nor the --regex option is given 
> then the names must consist entirely of ASCII upper- and lower-case 
> letters, ASCII digits,  ASCII  underscores,  and ASCII minus-hyphens.

Sounds like a good idea. So I guess it should match [A-Za-z0-9_-]*,
correct ? Isn't "." part of the allowed characters ?

In any case, patches are welcome :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
