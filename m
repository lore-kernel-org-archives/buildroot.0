From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 20 Sep 2013 11:09:42 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-09-19
In-Reply-To: <B0A6FFF3-ACCB-44F1-8C5E-03E88849F4D5@layer-7.net> (Michael
 Rommel's message of "Fri, 20 Sep 2013 10:29:43 +0200")
References: <20130920063008.7C55952C101@lolut.humanoidz.org>
 <B0A6FFF3-ACCB-44F1-8C5E-03E88849F4D5@layer-7.net>
Message-ID: <87wqmbdfl5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Rommel <rommel@layer-7.net> writes:

 Michael> Hi Thomas,

 Michael> I wanted to look after the pyzmq package, as I submitted it.

 Michael> The build log says:

 Michael>  [7m>>> python-pyzmq 13.1.0 Downloading [27m
 Michael> --2013-09-19 11:47:40--  https://pypi.python.org/packages/source/p/pyzmq/pyzmq-13.1.0.tar.gz
 Michael> Resolving pypi.python.org... 185.31.16.184, 185.31.16.185
 Michael> Connecting to pypi.python.org|185.31.16.184|:443... connected.
 Michael> ERROR: certificate common name `*.a.ssl.fastly.net' doesn't match requested host name `pypi.python.org'.
 Michael> To connect to pypi.python.org insecurely, use `--no-check-certificate'.
 Michael> --2013-09-19 11:47:40--  http://sources.buildroot.net//pyzmq-13.1.0.tar.gz
 Michael> Resolving sources.buildroot.net... 176.9.16.109
 Michael> Connecting to sources.buildroot.net|176.9.16.109|:80... connected.
 Michael> HTTP request sent, awaiting response... 404 Not Found
 Michael> 2013-09-19 11:47:40 ERROR 404: Not Found.

 Michael> make: *** [/home/test/test/3/output/build/python-pyzmq-13.1.0/.stamp_downloaded] Error 1


 Michael> indicating a download error. Now I have no idea, why the
 Michael> script changes to
 Michael> http://sources.buildroot.net//pyzmq-13.1.0.tar.gz.

That's the default fallback mirror we're using, but as this is a new
package I haven't updated the mirror yet.


 Michael> I have investigated the certificate "error", which in fact is none, because if
 Michael> you look at the actual sent cert, you see that in the Alternative name section,
 Michael> pypi.python.org is listed.
 Michael> Maybe the fetch program incorrectly does not evaluate this section?

That's afaik a known issue with older versions of wget. pypi.python.org
also works over http, so I'll change it to use that instead.

-- 
Bye, Peter Korsgaard
