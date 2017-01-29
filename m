From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Jan 2017 23:13:08 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/pkgconf: variable pkgdatadir
	also needs sysroot prefixing, wayland patch III
In-Reply-To: <20170128205624.10334844@free-electrons.com> (Thomas Petazzoni's
 message of "Sat, 28 Jan 2017 20:56:24 +1300")
References: <20161227150008.3277-1-bernd.kuhls@t-online.de>
 <20161227150008.3277-3-bernd.kuhls@t-online.de>
 <20170128205624.10334844@free-electrons.com>
Message-ID: <87lgtta51n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > Peter, Gustavo, you are the pkg-config tweaks gurus. Could you comment
 > on the following patch?

It's another case of build/runtime dirs confusion, so unless some
package uses it for a runtime path it should be ok.

On my PC the only .pc files using pkgdatadir are from icu and wayland,
and I did a test build of icu without problems, so lets see what the
autobuilders say - Committed, thanks.

-- 
Bye, Peter Korsgaard
