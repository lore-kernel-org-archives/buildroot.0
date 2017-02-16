From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Feb 2017 23:08:40 +0100
Subject: [Buildroot] [PATCH v3 2/5] package: add generic support for lz
	archives
In-Reply-To: <83572997-616f-8bec-fadb-0a59bbf847ed@mind.be> (Arnout
 Vandecappelle's message of "Wed, 15 Feb 2017 23:48:13 +0100")
References: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
 <1e78e6f82883e4ba95766459a39cbd2d49934152.1486930542.git.baruch@tkos.co.il>
 <20170215221520.41e4c66e@free-electrons.com>
 <83572997-616f-8bec-fadb-0a59bbf847ed@mind.be>
Message-ID: <87a89lg55j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

>> Since there is already the exact same pattern for XZCAT, I decided to
 >> apply your patch anyway. I also don't really understand the use case
 >> for all those BR2_ZCAT, BR2_BZCAT, BR2_XZCAT, etc. config options.
 >> Peter, maybe you can shed some light on why we have these?

 >  As I understand it, these options are provided in case you have an old build
 > host and have locally installed these tools in e.g. your homedir. However, I
 > wouldn't mind getting rid of these options completely, and instead require that
 > they are in PATH.

 >  True, they could also be used to pass alternative options to the extractors,
 > but I don't see much point of that. Or they could be used to call it in an
 > alternative form, e.g. "zcat" instead of "gzip -d -c", or "busybox gzip -d -c".
 > But I also don't see much point of that.

Like Arnout, I also don't think there's much need for these options -
But yeah, they also don't cause a lot of problems.

-- 
Bye, Peter Korsgaard
