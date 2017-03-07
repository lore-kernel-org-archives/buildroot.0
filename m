From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Mar 2017 14:02:53 +0100
Subject: [Buildroot] [PATCH 1/1] pcre: Change download location
In-Reply-To: <87d1dtdzim.fsf@dell.be.48ers.dk>
References: <5f582368-797e-10ad-1c19-a998496cabbf@ya.ru>
 <20170306212039.4134ccee@free-electrons.com>
 <87d1dtdzim.fsf@dell.be.48ers.dk>
Message-ID: <20170307140253.60681b57@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 07 Mar 2017 13:47:45 +0100, Peter Korsgaard wrote:

> I'm a bit confused about the description. To me it sounds like a local
> firewall issue with ftp access instead, but OK - Others might have a
> similar setup.

If you look at Buildroot 2015.11, as point out in the commit log, it
contains:

PCRE_VERSION = 8.38
PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre

However, the 8.38 version is no longer available at
ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre, the oldest
available version from this site is 8.39.

Hence, the fact that we have been using
ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre in older
Buildroot versions means that these older versions are now "broken" and
have to fallback on sources.buildroot.net.

So, no: it's not a local issue due to a firewall.

By using the https://ftp.pcre.org/pub/pcre/ location, which contains
all previous versions, we increase our chances that 2017.02 will not be
"broken" in 2 years.

We could have also said that pcre.org looks a bit more
official/upstream, and indeed https:// is better than ftp://.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
