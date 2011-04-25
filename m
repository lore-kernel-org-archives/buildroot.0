From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 25 Apr 2011 01:16:18 -0400
Subject: [Buildroot] [PATCH] Install module-init-tools into /sbin
In-Reply-To: <8181b3e96a35f372c8b36ec2dfb1eb2a00ee18ea.1303655867.git.smiley73@users.sourceforge.net>
References: <8181b3e96a35f372c8b36ec2dfb1eb2a00ee18ea.1303655867.git.smiley73@users.sourceforge.net>
Message-ID: <BANLkTikChmpqda8rsYVEuRNfhx5STRs0Pg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Apr 24, 2011 at 10:38 AM,  <heiko@zuerker.org> wrote:
> - ? ? ? --program-transform-name=''
> + ? ? ? --program-transform-name='' \
> + ? ? ? --prefix=/usr \
> + ? ? ? --exec-prefix=

empty exec-prefix is a bit odd ... it should be just "/".  the
--prefix is also redundant as the common build code already sets
--prefix=/usr.
-mike
