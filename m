From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 17:03:35 +0100
Subject: [Buildroot] [PATCH v2 2/2] check-host-tar.sh: blacklist tar
 1.30+
In-Reply-To: <20180227085541.11318-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 27 Feb 2018 09:55:41 +0100")
References: <20180227085541.11318-1-peter@korsgaard.com>
 <20180227085541.11318-2-peter@korsgaard.com>
Message-ID: <87606ipgh4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Tar 1.30 changed the --numeric-owner output for filenames > 100 characters,
 > leading to hash mismatches for the tar archives we create ourselves from
 > git.  This is really a fix for a bug in earlier tar versions regarding
 > deterministic output, so it is unlikely to be reverted in later versions.

 > To work around this issue, blacklist tar 1.30+ similar to how we do it for
 > pre-1.17 versions so Buildroot falls back to building host-tar.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 >  Changes since v1:
 >   - None

Committed after adding a link to
http://lists.busybox.net/pipermail/buildroot/2018-January/211222.html
which explains the issue in more details, thanks.

-- 
Bye, Peter Korsgaard
