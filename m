From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Aug 2016 11:37:04 +0200
Subject: [Buildroot] BuildRoot cannot build powerpc64
In-Reply-To: <1b65f937-d2ee-312c-964d-e6b9da957463@mind.be> (Arnout
 Vandecappelle's message of "Wed, 24 Aug 2016 03:01:00 +0200")
References: <F9C551623D2CBB4C9488801D14F864C6EE8B1000@ex-mb1.corp.adtran.com>
 <57b3aeb6944cf_7ec33f915a8b1b9c298e6@ultri3.mail>
 <F9C551623D2CBB4C9488801D14F864C6EE8B17ED@ex-mb1.corp.adtran.com>
 <20160817193721.0cc1466d@free-electrons.com>
 <532ce6e0-de27-9a2a-f062-179a4fa3248e@mind.be>
 <20160818231850.4072ddf2@free-electrons.com>
 <1b65f937-d2ee-312c-964d-e6b9da957463@mind.be>
Message-ID: <878tvmh5j3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >>> Actually also some other options are more fitting in the toolchain menu IMHO,
 >>> like debug/optimization options and SSP.
 >> 
 >> I personally don't like this, and instead would like to keep separated
 >> the options that affect the build of all components (SSP or not,
 >> debug/optimization, shared/static) from the options that configure the
 >> toolchain itself.

 >  OK, fair enough.

 >  Actually, I noticed now that SSP in the build menu already depends on the
 > toolchain choices. So perhaps we should move the build options below the
 > toolchain, and make the static/shared libs options depend on the toolchain as well.

Yes, perhaps that is less confusing. It isn't perfect as the build
options are more general than toolchain, but the current setup where
people have to jump back/forth between the build options and toolchain
menus also isn't very nice.

 >  That leaves us just with the awkward headers-same-as-kernel forward dependency.

Yeah :/

-- 
Bye, Peter Korsgaard
