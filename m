From: Lorenzo M. Catucci <lorenzo@sancho.ccd.uniroma2.it>
Date: Tue, 24 Mar 2015 22:20:52 +0100
Subject: [Buildroot] [PATCH 2/2 v4] system: allow/disallow root login,
 accept encoded passwords
In-Reply-To: <a13aae8e9670b5cb069379dee94735deb3663f21.1427223149.git.yann.morin.1998@free.fr>
References: <cover.1427223149.git.yann.morin.1998@free.fr>
 <a13aae8e9670b5cb069379dee94735deb3663f21.1427223149.git.yann.morin.1998@free.fr>
Message-ID: <5511D534.7050105@sancho.ccd.uniroma2.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you, Yann!

On 24/03/2015 19:54, Yann E. MORIN wrote:
> From: Lorenzo Catucci <lorenzo@sancho.ccd.uniroma2.it>
> 
> Currently, there is only three possibilities regarding the root account:
>   - it is enabled with no password (the default)
>   - it is enabled, using a clear-text, user-provided password
>   - it is disabled if the user sets the clear-text password to '*'
> 
> This is deemed insufficient in many cases, especially when the .config
> file has to be published (e.g. for the GPL compliance, or any other
> reason.).
> 
> Fix that in two ways:
> 
>   - add a bolean option that allows/diesaloows root login altogether,
>     which defaults to 'y' to keep backward compatibility;
> 
>   - accept already-encoded passwords, which we recognise as starting
>     with either of $1$, $5$ or $6$ (resp. for md5, sha256 or sha512).
>     For backward-compatibility, we stil accept '*' to disable the
>     account.
> 

Works very well for me, especially since my primary need was a config option
disabling root login; still, you summarized very well the reason I'd rather
use a decent sha-512 encoded root password if I were to distribute my
applicance's config file.

Thank you once more, yours

	lorenzo


-- 
+-------------------------+----------------------------------------------+
| Lorenzo M. Catucci      | Centro di Calcolo e Documentazione           |
| catucci at ccd.uniroma2.it | Universit? degli Studi di Roma "Tor Vergata" |
|                         | Via O. Raimondo 18 ** I-00173 ROMA ** ITALY  |
| Tel. +39 06 7259 2255   | Fax. +39 06 7259 2125                        |
+-------------------------+----------------------------------------------+
