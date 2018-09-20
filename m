From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 21:01:09 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] brltty: use gcc instead of ld to link shared objects
In-Reply-To: <20180920172809.19993-1-fontaine.fabrice@gmail.com>
References: <20180920172809.19993-1-fontaine.fabrice@gmail.com>
Message-ID: <20180920210109.179978c4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Sep 2018 19:28:09 +0200, Fabrice Fontaine wrote:
> Bump to version 5.6 has reintroduced the issue fixed by patch 854093 on
> version 5.5.
> 
> Indeed, third patch was merged upstream but it was then reverted:
> https://github.com/brltty/brltty/commit/9e7d62c869d3c1cbe12dda8b0291a4692c193416
> 
> Moreover, since commit 3a2e3f6fa5ef0a210ffeba5ed05c79965d0cc3c7, MKOBJ
> was renamed into MKREL. So, instead of patching again brltty, overwrite
> MKREL to use "gcc -shared -o" instead of "ld -r -o".

Are you really sure gcc -shared -o does the same thing as ld -r -o ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
