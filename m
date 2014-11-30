From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Nov 2014 15:15:15 +0100
Subject: [Buildroot] [PATCH] package/mutt: specify the mailpath
In-Reply-To: <1417258556-16797-1-git-send-email-yann.morin.1998@free.fr>
References: <1417258556-16797-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20141130151515.3af7e775@free-electrons.com>
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
> ---
>  package/mutt/mutt.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

At this point, I'm not sure if this is still material for master
(2014.11) or for next.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
