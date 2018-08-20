From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 23:37:28 +0200
Subject: [Buildroot] [PATCH 2/2] boost: context needs C++11
In-Reply-To: <CAPi7W81tk-yBnm0NzyxZRM_A2kkO_kR7yqZz-VaKP536=F5kuQ@mail.gmail.com>
References: <20180820165555.20492-1-fontaine.fabrice@gmail.com>
 <20180820165555.20492-2-fontaine.fabrice@gmail.com>
 <20180820225058.4d83d48f@windsurf>
 <CAPi7W81tk-yBnm0NzyxZRM_A2kkO_kR7yqZz-VaKP536=F5kuQ@mail.gmail.com>
Message-ID: <20180820233728.6fa1a054@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Mon, 20 Aug 2018 23:33:14 +0200, Fabrice Fontaine wrote:

> > I was about to apply, but... C++11 requires at least gcc 4.8 or 4.9
> >  
> That's not right, C++11 requires at least gcc 4.7 (see libcec, jsoncpp,
> poppler, yaml-cpp, ...)

OK. It in fact depends on which C++11 features you depend on, see
https://gcc.gnu.org/projects/cxx-status.html#cxx11. Some C++11 features
only got added in 4.8.

> > depending on the features being used, and I don't see any dependency on
> > a gcc version in the definition of BR2_PACKAGE_BOOST_CONTEXT.  
> 
> But you're right, we should update first patch to select
> BR2_PACKAGE_BOOST_THREAD if gcc version is lower than 4.7 (and not 4.8). I
> will send a v2.

Well, see above. C++11 support is not as clear-cut as: gcc < 4.7
doesn't have it, gcc >= 4.7 has it.

> > There are
> > also other Boost options that say they are related to C++11.
> >  
> I did not check if we should add -std=c++11 for those other boost options.
> At least, it does not cause any build failures but perhaps some features
> are wrongly disabled with some older versions of gcc.
> 
> >
> > Don't we have a problem with gcc 4.7 or older compilers ?
> >  
> std=c++11 works with gcc 4.7, I did not take time to test with older
> versions.

So what are you going to do ? Add std=c++11 unconditionally, without
knowing if this is going to be accepted by older gcc versions ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
