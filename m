From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Mar 2017 13:44:47 +0100
Subject: [Buildroot] [PATCH 1/1] pcre: Change download location
In-Reply-To: <5f582368-797e-10ad-1c19-a998496cabbf@ya.ru> (Oleg Kitain's
 message of "Mon, 6 Mar 2017 03:02:02 +0300")
References: <5f582368-797e-10ad-1c19-a998496cabbf@ya.ru>
Message-ID: <87h935dznk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Oleg" == Oleg Kitain <okitain@ya.ru> writes:

 > Subject: [PATCH 1/1] pcre: Change download location
 > The location at ftp.csx.cam.ac.uk only stores 2 latest versions of PCRE.
 > This results in old (2015.11 and older currently) buildroot versions
 > timing out on wget several times and having to retrieve the package
 > from sources.buildroot.org afterwards.

Timing out several times? Is ftp access blocked in your firewall?

A missing file should not cause any timeout, it should simply generate
an error and fall back to sources.buildroot.net, E.G.:

wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.37.tar.bz2
--2017-03-07 13:43:28--  ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.37.tar.bz2
           => ?pcre-8.37.tar.bz2?
Resolving ftp.csx.cam.ac.uk (ftp.csx.cam.ac.uk)... 131.111.8.115
Connecting to ftp.csx.cam.ac.uk (ftp.csx.cam.ac.uk)|131.111.8.115|:21... connected.
Logging in as anonymous ... Logged in!
==> SYST ... done.    ==> PWD ... done.
==> TYPE I ... done.  ==> CWD (1) /pub/software/programming/pcre ... done.
==> SIZE pcre-8.37.tar.bz2 ... done.

==> PASV ... done.    ==> RETR pcre-8.37.tar.bz2 ...
No such file ?pcre-8.37.tar.bz2?.

-- 
Bye, Peter Korsgaard
