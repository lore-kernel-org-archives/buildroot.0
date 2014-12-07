From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 00:05:23 +0100
Subject: [Buildroot] [PATCH] package/mutt: specify the mailpath
In-Reply-To: <1417258556-16797-1-git-send-email-yann.morin.1998@free.fr>
References: <1417258556-16797-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20141208000523.77fa34f2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 29 Nov 2014 11:55:56 +0100, Yann E. MORIN wrote:
> mutt's ./configure looks for different paths for where to look for
> incoming mails.
> 
> This is absolutely worng in the case of cross-compilation, because the
> path it may find on the host may not exist on the target.
> 
> Not only that, but some host may not even have any of the paths
> ./configure looks for.
> 
> Fix that by specifying the mailpath, and set it to the value documented
> in the FHS [0]
> 
> Since Buildroot only guarantees /tmp to be writable, make /var/mail a
> symlink to /tmp .
> 
> [0] http://refspecs.linuxfoundation.org/FHS_2.3/fhs-2.3.html#VARMAILUSERMAILBOXFILES
> 
> Reported-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
