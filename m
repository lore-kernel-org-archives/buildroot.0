From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 03 Nov 2017 16:59:09 +0100
Subject: [Buildroot] [PATCH 1/2] dhcpcd: add SysV start-up script
In-Reply-To: <20171102230602.3c61e8d2@windsurf> (Thomas Petazzoni's message of
 "Thu, 2 Nov 2017 23:06:02 +0100")
References: <20171031223659.6831-1-code@mmayer.net>
 <20171031223659.6831-2-code@mmayer.net>
 <20171102230602.3c61e8d2@windsurf>
Message-ID: <877ev75p6a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> +[ -x $DAEMON ] || exit 0
 >> +[ -f $CONFIG ] || exit 0

 > We have these in a lot of init scripts, so I kept them. But I find
 > those tests pretty silly in fact:

 >  - The daemon should definitely be there, as it's installed by the same
 >    package. And if it turns out not to be there, I'd prefer a loud
 >    failure than an init script that silently ignores the problem.

 >  - Same for the configuration file: I prefer a loud error than an init
 >    script that ignores the problem.

 > Yann, Peter, Arnout, can we agree that such tests should be removed
 > entirely, and we let the init script fail if the daemon does not exist,
 > and the daemon fail if its configuration file does not exist ?

Sounds sensible to me.

-- 
Bye, Peter Korsgaard
