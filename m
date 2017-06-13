From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Jun 2017 00:11:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/mcelog: fix legal-info
In-Reply-To: <20170612210449.1f5e4bf9@windsurf.lan> (Thomas Petazzoni's
 message of "Mon, 12 Jun 2017 21:04:49 +0200")
References: <20170612041512.9374-1-bernd.kuhls@t-online.de>
 <CA+NV+V=d7D+-zZKO4NYVpGrsY2Uz0pqhrLqYPwGA2rXJZSq11g@mail.gmail.com>
 <20170612210449.1f5e4bf9@windsurf.lan>
Message-ID: <87vanza686.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Potentially, it will also help in keeping license string of packages
 >> up-to-date if it gets changed. What do you think ?

 > Yocto/OE also has a hash for license files, specifically to check if
 > the license file is changed.

Exactly. I think it makes sense to do so. We provide legal info, and
besides validating that the license files still exist we don't have any
checks in place to ensure we catch license changes.

 > However, I'm not sure if the .hash file is the appropriate location. In
 > the .hash file, we have the hash of the downloaded files (in the ones
 > in DL_DIR). Hashes for files inside the tarball is a quite different
 > thing.

I don't see it as a big issue. If we want hashes for license files then
they need to be stored somewhere, so storing them together with the
download hashes sounds OK to me.

 > Also, I'm a bit worried about the additional complexity and maintenance
 > burden.

I don't think it will add any significant maintenance burden. The
license files very rarely changes, so normally you don't need to update
them (and when you do you want to get notified of it).

-- 
Bye, Peter Korsgaard
