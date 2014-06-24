From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jun 2014 18:42:44 +0200
Subject: [Buildroot] [RFCv1 0/4] Generating a graph of the size
 installed by each package
In-Reply-To: <53A9A7E2.7040906@mind.be>
References: <1402177567-8021-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <53A977B4.70205@lucaceresoli.net> <53A9A7E2.7040906@mind.be>
Message-ID: <20140624184244.174eac0e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, Arnout,

On Tue, 24 Jun 2014 18:31:30 +0200, Arnout Vandecappelle wrote:

> > Of course your approach collects more information, but I don't see
> > these extra info used in the final graph.
> 
>  The reason is explained a bit further in that cover letter: we only do
> stripping and removing of redundant stuff in the finalize step, so calculating
> the size before that doesn't make much sense.

Exactly.

>  The alternative of repeating the finalize step after each package doesn't sound
> very attractive either.

Indeed. Doing all the stripping and removal of unneeded stuff involves
a lot of 'find' invocations on the entire output/target directory,
which we probably don't want to repeat over and over again at the end
of the target installation step of each package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
