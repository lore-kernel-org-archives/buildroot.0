From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun, 17 Nov 2019 06:32:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/sysrepo: fix host/staging
 install steps
In-Reply-To: <CAEyMn7Yr=-pOuOZqV7Og5txrA_u-Z2JpxnSuxcWaEMTErV24dA@mail.gmail.com>
References: <20191103060113.4884-1-heiko.thiery@gmail.com>
 <20191108225833.6d81ea18@windsurf>
 <CAEyMn7Yg83V6bQoCG3-JH0ScRm=3qAxVLM3fKA_k1naKjFQqJw@mail.gmail.com>
 <20191111145304.00972312@windsurf.home>
 <CAEyMn7Zm+7k+Mwugu-oxRGUjfsyV3btam3DCdR+8mrenzdCzug@mail.gmail.com>
 <20191111152732.43c195c1@windsurf.home>
 <CAEyMn7bWYSitctm2hA6h-BTByHwOuYRyEUkVK-d6a2SsmDeiQQ@mail.gmail.com>
 <20191111154027.0e7bb998@windsurf.home>
 <CAEyMn7aeP+6eeW4+EDtVeB6+m9Dmsc-BUY0TTmsAC3rLdA7hFg@mail.gmail.com>
 <20191111155902.2751963d@windsurf.home>
 <CAEyMn7arpqUFV9trzwjMnwL6mK+eEYMenkpLhzpAPWBcD5XSCg@mail.gmail.com>
 <20191111161247.51724528@windsurf.home>
 <CAEyMn7aXzyzZJ4dgozKiBqSGpC+J_aFdS9Df3vSyVMjmJSdTxw@mail.gmail.com>
 <CAEyMn7Yr=-pOuOZqV7Og5txrA_u-Z2JpxnSuxcWaEMTErV24dA@mail.gmail.com>
Message-ID: <CAEyMn7Z--VTYcs+HVnUFo0RxW7OUVrX2uzma5A9S=LAEVJLR5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Di., 12. Nov. 2019 um 08:53 Uhr schrieb Heiko Thiery
<heiko.thiery@gmail.com>:
>
> Am Mo., 11. Nov. 2019 um 20:22 Uhr schrieb Heiko Thiery
> <heiko.thiery@gmail.com>:
> >
> >
> > Thomas Petazzoni <thomas.petazzoni@bootlin.com> schrieb am Mo., 11. Nov. 2019, 16:12:
> >>
> >> On Mon, 11 Nov 2019 16:04:15 +0100
> >> Heiko Thiery <heiko.thiery@gmail.com> wrote:
> >>
> >> > Installing the sysrepo database to the target directory
> >>
> >> And how do you do that? When does it happen?
> >>
> >> Thomas
> >> --
> >> Thomas Petazzoni, CTO, Bootlin
> >> Embedded Linux and Kernel engineering
> >> https://bootlin.com
> >
> >
> > When setting the REPOSITORY_LOC=$(TARGET_DIR)/etc/sysrepo in the host confguration the syrepo database
> > is created correctly in the install step into the target dir. But then in all install steps (host, staging and target) the files
> > are created in the target dir. Therefore I do not allow to use the sysrepo buildsystem install in host and staging step.
> > The files that are incluenced form this REPOSITORY_LOC setting will en in "etc/sysrepo/yang/" and "etc/sysrepo/data".
>
> So if it is no problem that the host install and staging install
> copies files to the target directory the simplest solution is just
> to set the  REPOSITORY_LOC=$(TARGET_DIR)/etc/sysrepo in the host configuration.

Is there a chance to get the patch into next? As I wrote in the last
mail the minimum fix should be to set the
REPOSITORY_LOC=$(TARGET_DIR)/etc/sysrepo for the host config.

--
Heiko
