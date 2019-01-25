From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Jan 2019 16:03:49 +0100
Subject: [Buildroot] [PATCH v2 6/7] tpm2-tools: do not enforce
 dependency on tpm2-abrmd
In-Reply-To: <b169a705-b11b-cd83-4b74-f593f1d2e2fc@mind.be> (Arnout
 Vandecappelle's message of "Thu, 24 Jan 2019 17:50:31 +0100")
References: <20190115101522.21042-1-peter@korsgaard.com>
 <20190115101522.21042-6-peter@korsgaard.com>
 <20190115204308.GB2556@scaer> <875zuog74i.fsf@dell.be.48ers.dk>
 <20190117155827.GD2556@scaer>
 <b169a705-b11b-cd83-4b74-f593f1d2e2fc@mind.be>
Message-ID: <8736pgu6cq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  For the situations like the one in this patch, I would say that we could relax
 > a little the 'avoid extra per-package configuration options'. In fact, extra
 > configuration options in Config.in don't cost that much. They don't really make
 > the menus larger because they're only visible when the package is selected. And
 > the .mk handling is the same as for an automatic optional dependency. That said,
 > in this specific case of tpm2-tools, I have the feeling that an additional
 > option is not appropriate. Since the two packages are right next to each other,
 > that is almost the same as having the suboption. So I would go for the help text
 > instead.

Ok, I'll send an updated patch that drops the select and adds a note in
the help text instead.

-- 
Bye, Peter Korsgaard
