From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Feb 2016 22:58:56 +0100
Subject: [Buildroot] [PATCH v1 1/1] coreutils: allow selection of
	installed programs
In-Reply-To: <20160224214832.GA3449@free.fr> (Yann E. MORIN's message of "Wed, 
 24 Feb 2016 22:48:32 +0100")
References: <1454498088-20233-1-git-send-email-romain.izard.pro@gmail.com>
 <877fhxaf7l.fsf@dell.be.48ers.dk>
 <CAGkQfmNkVYVb9jP8LgyhfotmQ6rbgR3yNwQN=6Qgb57s6AVA+Q@mail.gmail.com>
 <56CE1E61.7000008@zacarias.com.ar> <20160224214832.GA3449@free.fr>
Message-ID: <87r3g1zs67.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

>> How about adding a more lightweight option to the coreutils package to
 >> disable the single-binary mode?

 > Yes, that is a great ides, maybe a choice like:

 >     choice
 >         bool "Single-binary mode"
 >         default BR2_PKG_COREUTILS_SINGLE_SYMLINKS

 >     config BR2_PKG_COREUTILS_SINGLE_NONE
 >         bool "none"

 >     config BR2_PKG_COREUTILS_SINGLE_SYMLINKS
 >         bool "symlinks"

 >     config BR2_PKG_COREUTILS_SINGLE_SHEBANGS
 >         bool "shebangs"

 >     endchoice

 > And the corresponding code in the .mk file, of course.

Didn't we just discuss on IRC that shebangs didn't have any advantages
over symlinks? If so, I would prefer to keep things simple and only have
a choice between symlinks (default) or classical multiple binaries.

-- 
Venlig hilsen,
Peter Korsgaard 
