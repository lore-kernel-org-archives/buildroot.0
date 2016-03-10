From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Mar 2016 22:33:26 +0100
Subject: [Buildroot] [PATCH v7 07/18] package/pkgconf: make the
	pkg-config wrapper relocatable
In-Reply-To: <20160310215315.6555ac80@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 10 Mar 2016 21:53:15 +0100")
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
 <1457564339-27294-8-git-send-email-s.martin49@gmail.com>
 <20160310215315.6555ac80@free-electrons.com>
Message-ID: <87fuvykogp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> +STAGING_DIR="$(readlink -f "$(dirname "$0")/../..")/@STAGING_SUBDIR@"

 > I think Peter said on IRC that $0 is not guaranteed to be correct, and
 > that /proc/self/exe should be used instead.

Yes (and that is generally true), but as far as I can see it is
guaranteed for scripts on Linux by the logic in binfmt-script.c


 >> +TARGET_PKG_CONFIG_LIBDIR="$( echo @PKG_CONFIG_LIBDIR@ | sed -e
 >> "s@^@${STAGING_DIR}/@ ; s@:@:${STAGING_DIR}/@g" )"

 > I must say I hate those spaces after ( and before ). Especially when
 > the line just above doesn't have those spaces.

Consistency would be good, yes!

-- 
Bye, Peter Korsgaard
