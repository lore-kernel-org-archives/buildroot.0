From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 Jan 2021 11:37:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/erlang-jiffy: needs -fPIC
In-Reply-To: <20210101100153.GI2902@scaer>
References: <20201224101440.3427472-1-fontaine.fabrice@gmail.com>
 <20201228225325.4f973ae1@windsurf.home>
 <CAPi7W81Un5M_bA7_EqbZeFPdiKKP7+v1pjzheAa-FKGVHvu3ng@mail.gmail.com>
 <20201229104342.1eaa49a3@windsurf.home>
 <CAPi7W80-5tr3My7i44W_i0ZLsgF8exY6PNGTiE6ra9iVEr3anQ@mail.gmail.com>
 <20210101100153.GI2902@scaer>
Message-ID: <20210101113728.4af33692@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 1 Jan 2021 11:01:53 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> The thing with LTO, is that all files should (but in practice: must) be
> compiled with the same set of options; from the gcc man page:
> 
>     It is recommended that you compile all the files participating in
>     the same link with the same options and also specify those options
>     at link time.
> 
> and later:
> 
>     There are some code generation flags preserved by GCC when generating
>     bytecodes, as they need to be used during the final link. Currently,
>     the following options and their settings are taken from the first
>     object file that explicitly specifies them: -fPIC, [...]
> 
> So, if one file is compiled with -fPIC, then this is recorded in the .o
> for that file, which gcc notices later when doing the link, and thus all
> files must be -fPIC.
> 
> This can be a file compiled by the package itself, or it may come from
> an external (staging) static library.

Ah, this is indeed an interesting explanation, which could explain why
adding it just to LDFLAGS solves the problem.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
