From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 22:55:42 +0200
Subject: [Buildroot] [PATCH v2] package/gnutls: disable for static build
In-Reply-To: <20170525163443.5234-1-romain.naour@gmail.com>
References: <20170525163443.5234-1-romain.naour@gmail.com>
Message-ID: <20170529225542.31554bd8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 May 2017 18:34:43 +0200, Romain Naour wrote:

> +	--disable-static \

I understand the reasoning behind this change, but we don't do this in
any other package.

By passing --disable-static you are in fact making
BR2_STATIC_SHARED_LIBS act like BR2_SHARED_LIBS, so perhaps we should
rather depend on BR2_SHARED_LIBS.

But well, for now, we handle everywhere this static linking issue by
doing !BR2_STATIC_LIBS, which I believe is good enough.

So I've dropped the --disable-static part and applied to master. Sadly,
I just realized after pushing that I forgot to adjust the commit log
accordingly. Too bad :-/

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
