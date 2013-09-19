From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Sep 2013 06:10:52 +0200
Subject: [Buildroot] [PATCH 3 of 4 RFC] manual: add section about
 depending on toolchain options
In-Reply-To: <523A21D5.6040005@mind.be>
References: <patchbomb.1379494893@argentina>
 <89b40887c8268e316399.1379494896@argentina>
 <CAAXf6LXD_7jt42XAG_XgKWKi_+te40hgYNd4mTLbmCDMxfG0QA@mail.gmail.com>
 <20130918183414.45e6a247@skate>
 <CAAXf6LWmH2xtBe_P-P+1HJhndDM1BhHZcgJzu9o7JrfwjtwWVg@mail.gmail.com>
 <20130918194042.302e9afe@skate> <5239E6E5.4000401@zacarias.com.ar>
 <20130918195925.1884c0a7@skate> <5239EB63.2090203@zacarias.com.ar>
 <20130918201812.3e08d883@skate> <523A21D5.6040005@mind.be>
Message-ID: <20130919061052.3679c035@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 18 Sep 2013 23:57:41 +0200, Arnout Vandecappelle wrote:

> > Yes, we probably want to have the choice between building static only,
> > static + shared, or shared only, default to shared only. Currently,
> > when !BR2_PREFER_STATIC_LIB, we build both the shared and static
> > variants, which takes time because it requires building everything
> > twice, once with -fPIC, once without.
> 
>   I don't think the static + shared option really makes sense, does it? 
> The only use case I can think of is when you want a proprietary 
> executable to link statically in order to speed up start time.

Well, there might be cases were you would want to link some of your
applications statically, against some libraries, but not some others.

I've had such a case with a customer project using Buildroot: they have
limited flash space (16 MB, if I recall), in which they were trying to
put many many things. Some shared libraries were used by only one
executable, so linking them statically actually reduced the overall
storage consumption.

But I agree it shouldn't be the default.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
