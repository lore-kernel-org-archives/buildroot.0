From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Aug 2012 11:00:34 +0200
Subject: [Buildroot] [PATCH] package/cURL: fix static link whith openSSL
In-Reply-To: <1345667823-16633-1-git-send-email-yann.morin.1998@free.fr>
References: <1345667823-16633-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20120823110034.1f0b01d8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 22 Aug 2012 22:37:03 +0200,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> When openSSL is selected, cURL is configured to use it.
> 
> But in this case, the libcurl.pc file /forgets/ to require link
> against -ldl.
> 
> This can happen, for example, when BR2_PREFER_STATIC_LIB is not set,
> but an executable wants to be linked statically (for various reasons
> which are irrelevant here).
> 
> Fix that by conditionally append -ldl to the Libs.Private section of
> the installed libcurl.pc if openSSL is enabled.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Shouldn't this rather be fixed through a patch that gets submitted to
the upstream curl project?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
