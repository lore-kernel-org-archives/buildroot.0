From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2014 21:05:24 +0100
Subject: [Buildroot] [PATCH 10/10] hostapd: fix static build failure
In-Reply-To: <1390073027-14239-11-git-send-email-s.martin49@gmail.com>
References: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
 <1390073027-14239-11-git-send-email-s.martin49@gmail.com>
Message-ID: <20140118200524.GF23411@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-01-18 20:23 +0100, Samuel Martin spake thusly:
> When building statically hostapd with openssl support, it is necessary
> to add -lz to LIBS to avoid undefined symbols when linking against
> libcrypto.a.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Shouldn't we fix openssl's libcrypto.pc instead?
Adding -lz to Libs.private should do the trick, I guess, no?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
