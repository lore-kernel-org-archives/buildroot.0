From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Aug 2018 11:36:02 +0200
Subject: [Buildroot] [PATCH] dropbear: Fix host key loading with 521 bit
 ecdsa keys
In-Reply-To: <20180503114701.9452-1-stefan.sorensen@spectralink.com> ("Stefan
 =?utf-8?Q?S=C3=B8rensen=22's?= message of "Thu, 3 May 2018 13:46:59 +0200")
References: <20180503114701.9452-1-stefan.sorensen@spectralink.com>
Message-ID: <871sak9mnx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stefan" == Stefan S?rensen <stefan.sorensen@spectralink.com> writes:

 > Dropbear 2018.76 changed the default ecdsa host key size form 521 to 256
 > bits, but this breaks systems with an existing 521 bit key, blocking ssh
 > logins.

 > Apply the upstream fix from https://secure.ucc.asn.au/hg/dropbear/rev/0dc3103a5900 :

 >   Only advertise a single server ecdsa key when -R (generate as required) is
 >   specified. Fixes -R now that default ecdsa key size has changed.

 > Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
