From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Mar 2017 15:03:49 +0100
Subject: [Buildroot] [PATCH 1/1] pcre: Change download location
In-Reply-To: <20170307140253.60681b57@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 7 Mar 2017 14:02:53 +0100")
References: <5f582368-797e-10ad-1c19-a998496cabbf@ya.ru>
 <20170306212039.4134ccee@free-electrons.com>
 <87d1dtdzim.fsf@dell.be.48ers.dk>
 <20170307140253.60681b57@free-electrons.com>
Message-ID: <878tohdvzu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Tue, 07 Mar 2017 13:47:45 +0100, Peter Korsgaard wrote:

 >> I'm a bit confused about the description. To me it sounds like a local
 >> firewall issue with ftp access instead, but OK - Others might have a
 >> similar setup.

 > If you look at Buildroot 2015.11, as point out in the commit log, it
 > contains:

 > PCRE_VERSION = 8.38
 > PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre

 > However, the 8.38 version is no longer available at
 > ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre, the oldest
 > available version from this site is 8.39.

 > Hence, the fact that we have been using
 > ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre in older
 > Buildroot versions means that these older versions are now "broken" and
 > have to fallback on sources.buildroot.net.

 > So, no: it's not a local issue due to a firewall.

But how would this cause several TIMEOUTS? E.G. something where wget
will try several times to contact the ftp server.

It should just have done a single ftp login + get, and as soon as it
failed fall back to sources.buildroot.net unless something is causing
the ftp connection to "hang".

-- 
Bye, Peter Korsgaard
