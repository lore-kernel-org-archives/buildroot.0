From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Oct 2014 12:41:01 +0200
Subject: [Buildroot] [PATCH 1/2] automake: update gtk-doc.m4 to serial 2
In-Reply-To: <1412936897-8478-1-git-send-email-gustavo@zacarias.com.ar>
References: <1412936897-8478-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141010124101.0388b2b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 10 Oct 2014 07:28:16 -0300, Gustavo Zacarias wrote:

> -HOST_AUTOMAKE_DEPENDENCIES = host-autoconf
> +HOST_AUTOMAKE_DEPENDENCIES = host-autoconf host-pkgconf

I'm not sure exactly, but shouldn't depending on host-pkgconf be the
responsibility of each individual package that uses the gtk-doc.m4
stuff?

Even though I agree pkgconf is fairly quick to build, I find it odd to
have host-automake depend on host-pkgconf if it's only a very limited
number of packages that actually use the gtk-doc.m4 stuff that need the
host-pkgconf dependency.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
