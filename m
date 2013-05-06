From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 May 2013 00:21:11 +0200
Subject: [Buildroot] [PATCHv2] python-setuptools: forkbump and add
	workaround for shebangs
In-Reply-To: <1367846122-26209-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 6 May 2013 10:15:22 -0300")
References: <1367846122-26209-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874nef4unc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Switch to distribute fork since it's maintained and fixes a few issues
 Gustavo> while bumping to version 0.6.36.
 Gustavo> There's work upstream in re-merging with setuptools which is now
 Gustavo> supposedly maintained, see
 Gustavo> http://mail.python.org/pipermail/distutils-sig/2013-March/020126.html

 Gustavo> Buildroot python packages should use --single-version-externally-managed
 Gustavo> and --root=/ in the install phase even if they're not setuptools-based.
 Gustavo> This is because the default is to build egg files (zip files) for
 Gustavo> packages to support multiple target versions, and since the packages
 Gustavo> should be handled by buildroot infrastructure that's not needed.
 Gustavo> Also potentially doing double-compression is time-wasting (i.e. egg
 Gustavo> file and target filesystem) when running on slow targets.

Committed, thanks.

-- 
Bye, Peter Korsgaard
