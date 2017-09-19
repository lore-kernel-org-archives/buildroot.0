From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Sep 2017 14:01:30 +0200
Subject: [Buildroot] [PATCH] cmake: explicitly disable openssl support
	for host-cmake
In-Reply-To: <20170918173848.13742-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 18 Sep 2017 19:38:48 +0200")
References: <20170918173848.13742-1-peter@korsgaard.com>
Message-ID: <87a81q3nj9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > host-cmake will optionally link with openssl for the embedded copy of
 > libarchive if available, leaking host dependencies and possibly causing
 > build issues in case of compatibility issues - E.G. the host-cmake version
 > we have in 2017.02.x doesn't build against openssl-1.1.0+:

 > https://github.com/libarchive/libarchive/issues/810

 > The openssl support in libarchive is unlikely to be needed, so explicitly
 > disable it.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
