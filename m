From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Apr 2015 22:31:25 +0200
Subject: [Buildroot] [PATCH 1/2 v4] system: remove DES password encoding
In-Reply-To: <840cc743b5a06c6b600d067bfb11d2eafe373b45.1427223149.git.yann.morin.1998@free.fr>
References: <cover.1427223149.git.yann.morin.1998@free.fr>
 <840cc743b5a06c6b600d067bfb11d2eafe373b45.1427223149.git.yann.morin.1998@free.fr>
Message-ID: <20150410223125.21fd8e67@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 24 Mar 2015 19:54:15 +0100, Yann E. MORIN wrote:
> DES is long dead, it is insecure as hell, and virtually all known
> crypt(3) implementations now all support at least md5.
> 
> Besides, the character-space of DES-encoded passwords are a sub-set
> of the character-space for a clear-text password, so we can't easily
> differentiate between the two. Since we're going to change the root
> password prompt to support settign encoded passwords (as well as

I've fixed settign -> setting.

> clear-text passwords), we can't keep DES or we'd be unable to decide
> whether we'd need to encode the password or not.
> 
> Remove DES encoding altogether (and add a legacy entry). The default is
> still md5, and thus there's no backward-compatibility 'select' to add.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Lorenzo Catucci <lorenzo@sancho.ccd.uniroma2.it>
> ---
>  Config.in.legacy | 7 +++++++
>  system/Config.in | 9 ---------
>  2 files changed, 7 insertions(+), 9 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
