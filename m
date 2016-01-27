From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Jan 2016 18:18:46 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20160122102957.10f29956@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 22 Jan 2016 10:29:57 +0100")
References: <20160122073021.E35B6101A27@stock.ovh.net>
 <20160122102957.10f29956@free-electrons.com>
Message-ID: <87fuxjos95.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> x86_64 |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/2561190b274d71666c4bdf3c569b02063cefdb30/

 > ./relocatable.c: In function 'libintl_relocate':
 > ./relocatable.c:402:40: error: 'INSTALLPREFIX' undeclared (first use in this function)
 >        const char *orig_installprefix = INSTALLPREFIX;

 > Musl related ? Not sure. Peter, you added the madplay package back in
 > 2007, so can you have a look ? :-)

Heh, I don't recall any details from 2007 - But I've taken a look and
pushed a fix. It was indeed musl related.

-- 
Venlig hilsen,
Peter Korsgaard 
