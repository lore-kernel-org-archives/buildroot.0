From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Nov 2017 22:35:08 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/feh: Fix build issue with
 some older cross-compilers
In-Reply-To: <20171115213303.i5uyauphzo6pplyv@x230>
References: <20171115132754.9755-1-petr.vorel@gmail.com>
 <20171115220935.03b64e14@windsurf.lan>
 <20171115213303.i5uyauphzo6pplyv@x230>
Message-ID: <20171115223508.249b809c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Nov 2017 22:33:04 +0100, Petr Vorel wrote:

> > std=gnu11 was only added in gcc 4.7, so using this would break the
> > build with gcc < 4.7. According to the error message, only C99 is
> > needed, so could you try instead -std=c99, which is available since at
> > least gcc 4.2 ?  
> 
> Would it be -std=gnu99 sufficient for buildroot? Or it's a problem for some compilers?
> If yes, I'll patch the sources as it depends on alphasort(), which is not available on c99.

gnu99 is available since gcc 4.2 as well, see
https://gcc.gnu.org/onlinedocs/gcc-4.2.0/gcc/Standards.html#Standards,
so gnu99 should be fine.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
