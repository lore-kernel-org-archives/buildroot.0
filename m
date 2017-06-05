From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 14:54:49 +0200
Subject: [Buildroot] [PATCH] package/sunxy-mali: fix conflicting types
 for GLintptr and GLsizeiptr
In-Reply-To: <20170605104837.15929-1-romain.naour@gmail.com>
References: <20170605104837.15929-1-romain.naour@gmail.com>
Message-ID: <20170605145449.0d323734@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Typo in commit title: sunxy -> sunxi

On Mon,  5 Jun 2017 12:48:37 +0200, Romain Naour wrote:

> +-typedef int * GLintptr;
> +-typedef int *  GLsizeiptr;
> ++typedef khronos_intptr_t GLintptr;
> ++typedef khronos_ssize_t  GLsizeiptr;

You're only fixing those types, but there are a few other types that
are different between gl.h and gl2.h.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
