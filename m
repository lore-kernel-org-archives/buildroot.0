From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 29 Dec 2020 11:14:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/erlang-jiffy: needs -fPIC
In-Reply-To: <20201229104342.1eaa49a3@windsurf.home>
References: <20201224101440.3427472-1-fontaine.fabrice@gmail.com>
 <20201228225325.4f973ae1@windsurf.home>
 <CAPi7W81Un5M_bA7_EqbZeFPdiKKP7+v1pjzheAa-FKGVHvu3ng@mail.gmail.com>
 <20201229104342.1eaa49a3@windsurf.home>
Message-ID: <CAPi7W80-5tr3My7i44W_i0ZLsgF8exY6PNGTiE6ra9iVEr3anQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mar. 29 d?c. 2020 ? 10:43, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Tue, 29 Dec 2020 10:39:27 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > This build failure is raised because of the -flto flag which is added
> > since version 1.0.0 and
> > https://github.com/davisp/jiffy/commit/feaf10f2d50e454f55a9d6b20c289031b0980503
> > It seems that -flto can't be used without -fPIC.
>
> This seems super odd. I'm not sure what would be the relationship
> between LTO and PIC...
Indeed but the build failure is fixed if I remove -flto from CFLAGS.
I'll try to understand why ...
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
