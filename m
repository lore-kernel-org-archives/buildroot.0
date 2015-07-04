From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 14:08:19 +0200
Subject: [Buildroot] [PATCH] system: allow/disallow root login,
 accept encoded passwords
In-Reply-To: <1435867205-27764-1-git-send-email-yann.morin.1998@free.fr>
References: <1435867205-27764-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150704140819.207a544f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu,  2 Jul 2015 22:00:05 +0200, Yann E. MORIN wrote:
> From: Lorenzo Catucci <lorenzo@sancho.ccd.uniroma2.it>
> 
> Currently, there are only two possibilities regarding the root account:
>   - it is enabled with no password (the default)
>   - it is enabled, using a clear-text, user-provided password
> 
> This is deemed insufficient in many cases, especially when the .config
> file has to be published (e.g. for the GPL compliance, or any other
> reason.).
> 
> Fix that in two ways:
> 
>   - add a boolean option that allows/disallows root login altogether,
>     which defaults to 'y' to keep backward compatibility;
> 
>   - accept already-encoded passwords, which we recognise as starting
>     with either of $1$, $5$ or $6$ (resp. for md5, sha256 or sha512).
> 
> Signed-off-by: Lorenzo M. Catucci <lorenzo@sancho.ccd.uniroma2.it>
> [yann.morin.1998 at free.fr:
>   - don't add a choice to select between clear-text/encoded password,
>     use a single prompt;
>   - differentiate in the password hook itself;
>   - rewrite parts of the help entry;
>   - rewrite and expand the commit log
> ]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Tested-by: "Lorenzo M. Catucci" <lorenzo@sancho.ccd.uniroma2.it>
> Acked-by: "Lorenzo M. Catucci" <lorenzo@sancho.ccd.uniroma2.it>
> Tested-by: Gergely Imreh <imrehg@gmail.com>
> 
> ---
> Changes v6 -> v7:
>   - expand help entry, clarify prompt  (Arnout, Lorenzo)
>   - only depend on host-mkpasswd when needed  (Arnout, Lorenzo)

Applied, thanks. This is typically the kind of patch for which if we
had a test infrastructure in place, I would request to have some
additional tests in the test infra.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
