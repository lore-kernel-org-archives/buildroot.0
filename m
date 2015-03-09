From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Mar 2015 22:46:29 +0100
Subject: [Buildroot] [PATCH 1/2] target-finalize: generate all *.pyc
In-Reply-To: <54FE13AC.6060208@mind.be>
References: <1425918264-1912-1-git-send-email-s.martin49@gmail.com>
 <20150309185405.5f312f1b@free-electrons.com>
 <54FE13AC.6060208@mind.be>
Message-ID: <20150309224629.543cfc59@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Mon, 09 Mar 2015 22:42:04 +0100, Arnout Vandecappelle wrote:

> > Why not, but then don't we want to do something in the Python package
> > infra, and in the Python 2/3 packages themselves to avoid spending time
> > biulding the .pyc files?
> 
>  compileall will check timestamps to avoid recompiling unnecessarily. So you
> just have the tree walk to consider, which I think is a minor issue.

Ah, good to know. Then indeed it's useless to do any special trick:
let's just call compileall as a target finalize hook.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
