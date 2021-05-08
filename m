From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 May 2021 18:23:48 +0200
Subject: [Buildroot] [PATCH] package/cryptsetup: disable tmpfiles.d for
 host build
In-Reply-To: <20210507152159.542208-1-john@metanate.com> (John Keeping's
 message of "Fri, 7 May 2021 16:21:59 +0100")
References: <20210507152159.542208-1-john@metanate.com>
Message-ID: <87v97turcb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "John" == John Keeping <john@metanate.com> writes:

 > When building host-cryptsetup, if tmpfiles.d support is enabled then the
 > install step tries to install /usr/lib/tmpfiles.d/cryptsetup.conf
 > globally on the host system.

 > Even if the tmpfiles.d config were installed correctly in the host
 > directory, nothing would ever run these rules, so disable this feature
 > via configure.

 > Signed-off-by: John Keeping <john@metanate.com>

Committed, thanks.

I see we also don't pass that configure flag for the target variant?

-- 
Bye, Peter Korsgaard
