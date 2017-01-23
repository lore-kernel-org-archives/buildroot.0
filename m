From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Jan 2017 23:01:39 +0100
Subject: [Buildroot] [PATCH] go: security bump to version 1.7.4
In-Reply-To: <20170123151746.25228-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 23 Jan 2017 16:17:46 +0100")
References: <20170123151746.25228-1-peter@korsgaard.com>
Message-ID: <871svtjv0c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > On Darwin, user's trust preferences for root certificates were not honored.
 > If the user had a root certificate loaded in their Keychain that was
 > explicitly not trusted, a Go program would still verify a connection using
 > that root certificate.  This is addressed by https://golang.org/cl/33721,
 > tracked in https://golang.org/issue/18141.  Thanks to Xy Ziemba for
 > identifying and reporting this issue.

 > The net/http package's Request.ParseMultipartForm method starts writing to
 > temporary files once the request body size surpasses the given "maxMemory"
 > limit.  It was possible for an attacker to generate a multipart request
 > crafted such that the server ran out of file descriptors.  This is addressed
 > by https://golang.org/cl/30410, tracked in https://golang.org/issue/17965.
 > Thanks to Simon Rawet for the report.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
