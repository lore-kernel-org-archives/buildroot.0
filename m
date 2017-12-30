From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Dec 2017 00:06:10 +0100
Subject: [Buildroot] [PATCH v2] gdb: prevent installation of libbfd.so
 and libopcode.so
In-Reply-To: <20171208212952.20366-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Fri, 8 Dec 2017 22:29:52 +0100")
References: <20171208212952.20366-1-ps.report@gmx.net>
Message-ID: <87d12vke8t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > The gdb install target installs dynamic versions of libbfd and
 > libopcode, accidentally overwriting the binutils provided versions
 > (gdb itself links against the bundled static ones to avoid
 > version problems, so the dynamic ones are un-needed).

 > Prevent the installation by using the '--disable-install-libbfd'
 > configure option.

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 > Changes v1 -> v2:
 >   - enhance commit log (suggested by Thomas Petazzoni)
 >   - use --disable-install-libbfd instead of --disable-shared

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
