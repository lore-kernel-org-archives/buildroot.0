From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 18:42:20 +0100
Subject: [Buildroot] [PATCH] package/openntpd: needs host-bison
In-Reply-To: <878sb1qle4.fsf@tarshish> (Baruch Siach's message of "Mon, 16 Nov
 2020 19:09:07 +0200")
References: <b1b574df250b1e34cd750b809a8409b9b182f51e.1605525509.git.baruch@tkos.co.il>
 <87a6vh5l6m.fsf@dell.be.48ers.dk> <878sb1qle4.fsf@tarshish>
Message-ID: <875z655hc3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> > +OPENNTPD_DEPENDENCIES = host-bison
 >> 
 >> Can we not use $(BR2_BISON_HOST_DEPENDENCY) instead?

 > We surly can. But for some reason no other package under package/ uses
 > BR2_BISON_HOST_DEPENDENCY. Plain host-bison is used there instead. Only
 > Barebox, U-Boot and the kernel use it. Why is that?

Your tree is not uptodate, we also have it in linux-backports ;)

But yes, it is a bit odd that we are not using it more often. Probably
it is mostly just because it is fairly new (~2 years) and not really
documented anywhere.

Yann, you added it, anything to add?


 > Commit b01100cc901a83 ("linux: kconfig may need host-{flex, bison} to
 > build the configurators") mentions kconfig. Is that related?

 > I guess that BR2_BISON_HOST_DEPENDENCY is more susceptible to
 > incompatibility due to different host installed bison versions (and same
 > for flex).

Correct, similar to the other components where we can use what is
available on the host if new enough. For bison/flex, I would imagine
that the version incompatibilities are fairly small (even though we do
have some patches for building with bison 3.7.1).

-- 
Bye, Peter Korsgaard
